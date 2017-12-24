{-# LANGUAGE OverloadedStrings, ExtendedDefaultRules #-}

import Lucid
import Lucid.Supplemental
import System.IO (stdout)
import Data.Text.Lazy.IO as L

main :: IO ()
main = L.hPutStr stdout (renderText template1)

-- Template for file: test-out.html
template1 :: Html ()
template1 = do
    doctype_
    "\n"
    html_ [ lang_ "en" ] $ do
        "\n  "
        head_ $ do
            "\n    "
            meta_ [ charset_ "utf-8" ]
            "\n\n    "
            link_ [ media_ "all", rel_ "stylesheet", crossorigin_ "anonymous", href_ "https://assets-cdn.github.com/assets/frameworks-1c2c316b7a17f15536c6a26ed744654fc228a24658a7ae395cdcbf8329c8406b.css" ]
            "\n    "
            link_ [ media_ "all", rel_ "stylesheet", crossorigin_ "anonymous", href_ "https://assets-cdn.github.com/assets/github-8100b9bf1eb6ed8b38eaad2fe7ba51d1895aa0602aafe4a87068d444e07e8c5c.css" ]
            "\n    "
            link_ [ media_ "all", rel_ "stylesheet", crossorigin_ "anonymous", href_ "https://assets-cdn.github.com/assets/site-44b6bba3881278f33c221b6526379b55fbd098af3e553f54e81cab4c9a517c8e.css" ]
            "\n    \n    "
            meta_ [ name_ "viewport", content_ "width=device-width" ]
            "\n    \n    "
            title_ "lucid-from-html/README.md at master \183 alogic0/lucid-from-html \183 GitHub"
            "\n    "
            link_ [ title_ "GitHub", rel_ "fluid-icon", href_ "https://github.com/fluidicon.png" ]
            "\n    "
            meta_ [ property_ "og:title", content_ "alogic0/lucid-from-html" ]
            meta_ [ property_ "og:url", content_ "https://github.com/alogic0/lucid-from-html" ]
            meta_ [ property_ "og:description", content_ "lucid-from-html - Generate Lucid code from html page" ]
            "\n\n    "
            meta_ [ name_ "description", content_ "lucid-from-html - Generate Lucid code from html page" ]
            "\n    "
            link_ [ rel_ "mask-icon", color_ "#000000", href_ "https://assets-cdn.github.com/pinned-octocat.svg" ]
            "\n    "
            link_ [ type_ "image/x-icon", rel_ "icon", class_ "js-site-favicon", href_ "https://assets-cdn.github.com/favicon.ico" ]
            "\n\n    "
            meta_ [ name_ "theme-color", content_ "#1e2327" ]
            "\n  "
        "\n  "
        body_ [ class_ "logged-out env-production page-blob" ] $ do
            "\n    "
            div_ [ id_ "readme", class_ "readme blob instapaper_body" ] $ do
                "\n    "
                article_ [ class_ "markdown-body entry-content", itemprop_ "text" ] $ ""
