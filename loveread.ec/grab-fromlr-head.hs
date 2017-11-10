module Main where

import System.Environment
import System.IO
import Text.HTML.TagSoup
import Text.HTML.TagSoup.Tree

extractBody :: String -> [Tag String]
extractBody str =
  let uniTree = (universeTree . tagTree . canonicalizeTags . parseTags) str
      title = flattenTree [x | x@(TagBranch "title" _ _) <- uniTree]
  in header1 ++ title ++ header2

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
       hPutStr stdout $ renderTags $ extractBody content
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
  [TagText "\n", TagClose "head", TagText "\n", TagOpen "body" [], TagText "\n"]

