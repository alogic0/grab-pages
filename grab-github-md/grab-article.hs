module Main where

import System.Environment
import System.IO
import Text.HTML.TagSoup
import Text.HTML.TagSoup.Tree

-- Grab <article> end remove <svg>
extractArticle :: String -> TagTree String
extractArticle str =
  let uniTree = (universeTree . tagTree . canonicalizeTags . parseTags) str
      contentTree = [x | x@(TagBranch "article" _ _) <- uniTree]
      content = rmBranchByName "svg" contentTree
  in if null content
     then TagLeaf (TagText "No article\n")
     else head content

main :: IO ()
main = do
  args <- getArgs
  hSetEncoding stdout utf8
  hSetEncoding stderr utf8
  let infile = args !! 0
  withFile
    infile
    ReadMode
    (\handle -> do
      hSetEncoding handle utf8
      content <- hGetContents handle
      let article = extractArticle content
  --  error $ "First argument: " ++ infile
      withFile
        "template.html"
        ReadMode
        (\handle -> do
          hSetEncoding handle utf8
          content <- hGetContents handle
          hPutStrLn stdout $
            renderTree $ replaceBranch "article" article $
            parseTree content
        )
    )


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


replaceBranch :: String -> TagTree String -> [TagTree String] -> [TagTree String]
replaceBranch name branch xs = map replaceBranch' xs
  where
    replaceBranch' l@(TagLeaf _) = l
    replaceBranch' (TagBranch nm attr xs') =
      if nm == name
      then branch
      else TagBranch nm attr (replaceBranch name branch xs')
