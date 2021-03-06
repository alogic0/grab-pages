module Main where

import System.Environment
import System.IO
import Text.HTML.TagSoup
import Text.HTML.TagSoup.Tree
import Data.List
import Data.Char (isDigit)
import Control.Monad (when)

extractBody :: String -> [Tag String]
extractBody str =
  let uniTree = (universeTree . parseTree) str
--      title = flattenTree [x | x@(TagBranch "title" _ _) <- uniTree]
--      contentTree1 = [x | x@(TagBranch "div" [("id","left")] _) <- uniTree]
--      contentTree = [x | x@(TagBranch "body" _  _) <- uniTree]
      contentTree1 =
        [ x
        | x@(TagBranch "td" [("align", "center"), ("valign", "top"), ("class", "tb_read_book")] _) <-
            uniTree
        ]
      navTree = [z | x@(TagBranch "div" (("class","navigation") : _) y) <- universeTree contentTree1, z <- y ]
--      contentTree = [x | x@(TagBranch "div" [("class","news")] _) <- universeTree contentTree1]
      content =
        flattenTree $ rmBranchByName "script" $ rmBranchByName "form" navTree
  in content
--  in header1 ++ title ++ header2 ++ content ++ footer

main :: IO ()
main = do
  args <- getArgs
  hSetEncoding stdout utf8
  hSetEncoding stderr utf8
  let infile = args !! 0
--  error $ "First argument: " ++ infile
  withFile
    infile
    ReadMode
    (\handle -> do
       hSetEncoding handle utf8
       content <- hGetContents handle
       let links1 = filter (isPrefixOf "read_book") $ map (fromAttrib "href")
                    $ filter isTagOpen $ extractBody content
       when (length links1 < 1) $ error "Check site for \"read_book.php\" links"
       let nums = (map (read . reverse . takeWhile isDigit . reverse) links1) :: [Int]
       hPutStrLn stdout $ show $ last $ sort nums
    )

header1 :: [Tag String]
header1 =
  [ TagOpen "!DOCTYPE" [("html", "")]
  , TagText "\n"
  , TagOpen "html" [("xmlns", "http://www.w3.org/1999/xhtml"), ("lang", "ru")]
  , TagText "\n"
  , TagOpen "head" []
  , TagText "\n"
  , TagOpen
      "meta"
      [("http-equiv", "Content-Type"), ("content", "text/html; charset=UTF-8")]
  , TagClose "meta"
  , TagText "\n"
  ]

header2 :: [Tag String]
header2 =
  [TagText "\n", TagClose "head", TagText "\n"] ++ [TagOpen "body" []]

footer :: [Tag String]
footer = [TagClose "body"] ++ [TagClose "html", TagText "\n"]

rmBranchByName :: String -> [TagTree String] -> [TagTree String]
rmBranchByName name xs = map rmBranchByName' $ filter good xs
  where
    good (TagBranch nm _ _) = nm /= name
    good _ = True
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

