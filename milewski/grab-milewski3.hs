module Main where

import System.Environment
import System.IO
import Text.HTML.TagSoup
import Text.HTML.TagSoup.Tree

extractBody :: String -> [Tag String]
extractBody str =
  let uniTree = universeTree (parseTree str)
      title = flattenTree [x | x@(TagBranch "title" _ _) <- uniTree]
      contentTree =
        [x | x@(TagBranch "div" [("class", "post-content")] _) <- uniTree]
      content =
        flattenTree $
        rmBranchByNameAtr "div" ("class", "post-info") $
        rmBranchByNameAtr "div" ("class", "post-footer") $
        rmBranchByNameAtr "div" ("id", "jp-post-flair") $
        rmBranchByNameAtr "div" ("class", "wpcnt") $
        rmBranchByName "style" $ rmBranchByName "script" contentTree 
  in header1 ++ title ++ header2 ++ content ++ footer


main :: IO ()
main = do
  args <- getArgs
  hSetEncoding stdout utf8
  withFile
    (args !! 0)
    ReadMode
    (\handle -> do
       hSetEncoding handle utf8
       content <- hGetContents handle
       putStr $ renderTags (extractBody content))

header1 :: [Tag String]
header1 =
  [ TagOpen
      "!DOCTYPE"
      [ ("html", "")
      , ("PUBLIC", "")
      , ("", "-//W3C//DTD XHTML 1.0 Transitional//EN")
      , ("", "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
      ]
  , TagText "\n"
  , TagOpen "html" [("xmlns", "http://www.w3.org/1999/xhtml"), ("lang", "en")]
  , TagText "\n"
  , TagOpen "head" [("profile", "http://gmpg.org/xfn/11")]
  , TagText "\n"
  , TagOpen
      "meta"
      [("http-equiv", "Content-Type"), ("content", "text/html; charset=UTF-8")]
  , TagClose "meta"
  , TagText "\n"
  ]

header2 :: [Tag String]
header2 =
  [TagText "\n", TagClose "head", TagText "\n", TagOpen "body" [], TagText "\n"]

footer :: [Tag String]
footer = [TagClose "body", TagText "\n", TagClose "html", TagText "\n"]

rmBranchByName :: String -> [TagTree String] -> [TagTree String]
rmBranchByName name xs = map rmBranchByName' $ filter del xs
  where
    del (TagBranch nm _ _) = nm /= name
    del _ = True
    rmBranchByName' l@(TagLeaf _) = l
    rmBranchByName' (TagBranch nm attr xs') =
      TagBranch nm attr (rmBranchByName name xs')

rmBranchByNameAtr ::
     String -> (String, String) -> [TagTree String] -> [TagTree String]
rmBranchByNameAtr name atr xs = map rmBranchByNameAtr' $ filter good xs
  where
    good (TagBranch nm atrs _) = not (nm == name && any (== atr) atrs)
    good _ = True
    rmBranchByNameAtr' l@(TagLeaf _) = l
    rmBranchByNameAtr' (TagBranch nm atrs xs') =
      TagBranch nm atrs (rmBranchByNameAtr name atr xs')

