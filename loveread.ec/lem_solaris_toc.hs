import Text.HTML.TagSoup

file_nm = "lem_solaris.html"

body =
  [ TagOpen "a" [("name", "gl_1")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1055\1088\1080\1073\1099\1090\1080\1077"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_2")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1057\1086\1083\1103\1088\1080\1089\1090\1099"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_3")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1043\1086\1089\1090\1080"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_4")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1057\1072\1088\1090\1086\1088\1080\1091\1089"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_5")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1061\1072\1088\1080"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_6")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText
      "\171\1052\1072\1083\1099\1081 \1072\1087\1086\1082\1088\1080\1092\187"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_7")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1057\1086\1074\1077\1097\1072\1085\1080\1077"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_8")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1063\1091\1076\1086\1074\1080\1097\1072"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_9")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText
      "\1046\1080\1076\1082\1080\1081 \1082\1080\1089\1083\1086\1088\1086\1076"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_10")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1056\1072\1079\1075\1086\1074\1086\1088"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_11")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1069\1082\1089\1087\1077\1088\1080\1084\1077\1085\1090"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_12")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1057\1085\1099"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_13")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1059\1089\1087\1077\1093"
  , TagClose "div"
  , TagOpen "a" [("name", "gl_14")]
  , TagClose "a"
  , TagText "\r\n"
  , TagOpen "div" [("class", "take_h1")]
  , TagText "\1057\1090\1072\1088\1099\1081 \1084\1080\1084\1086\1080\1076"
  , TagClose "div"
  ]

header =
  [ TagOpen "!DOCTYPE" [("html", "")]
  , TagText "\n"
  , TagOpen "html" [("lang", "ru")]
  , TagText "\n"
  , TagOpen "head" []
  , TagText "\n"
  , TagOpen
      "meta"
      [("http-equiv", "Content-Type"), ("content", "text/html; charset=UTF-8")]
  , TagClose "meta"
  , TagText "\n"
  , TagClose "head"
  , TagText "\n"
  , TagOpen "body" []
  , TagText "\n"
  ]

foot =
  [ TagClose "body"
  , TagText "\n"
  , TagClose "html"]

main :: IO ()
main = 
  let body1 = filter (~/= "</a>") body
      subst x = 
        case x of
          (TagClose "div") -> [x, TagClose "a"]
          (TagOpen "a" [("name", ref)]) -> [TagOpen "a" [("href", file_nm ++ "#" ++ ref)]]
          _ -> [x]
      body2 = do
        x <- body1
        subst x
  in putStr $ renderTags $ header ++ body2 ++ foot
