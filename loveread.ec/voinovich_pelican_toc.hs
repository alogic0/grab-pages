{- $ test-tagsoup parse /sdcard/books/fiction/voinovich/voinovich_pelican.html | grep 'TagOpen "a"' -A 5 | grep -v '^--$' -}

import Text.HTML.TagSoup

file_nm = ""   -- "lem_solaris.html"

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
  let body1 = filter (~/= (TagText "\r\n")) $ filter (~/= "</a>") body
      subst x =
        case x of
          (TagClose "div") -> [x, TagClose "a", TagText "\r\n"]
          (TagOpen "a" [("name", ref)]) ->
            [TagOpen "a" [("href", file_nm ++ "#" ++ ref)]]
          _ -> [x]
      body2 = do
        x <- body1
        subst x
  in putStr $ renderTags $ header ++ body2 ++ foot


body =
  [ TagOpen "a" [("name","gl_1")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1050\1083\1077\1097"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_2")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1053\1077\1084\1085\1086\1075\1086 \1086 \1089\1077\1073\1077 \1080 \1085\1077 \1090\1086\1083\1100\1082\1086"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_3")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1060\1077\1076\1086\1088 \1080 \1040\1083\1077\1082\1089\1072\1085\1076\1088\1072"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_4")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1058\1086\1094\1082 \1085\1077 \1073\1077\1088\1077\1090"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_5")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1042 \1087\1086\1080\1089\1082\1072\1093 \1089\1090\1077\1088\1080\1083\1100\1085\1086\1089\1090\1080"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_6")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1054 \1089\1084\1099\1089\1083\1077 \1078\1080\1079\1085\1080"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_7")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1046\1080\1079\1085\1100 \1085\1072\1087\1088\1086\1082\1072\1090"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_8")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1051\1077\1085\1080\1085\1089\1082\1080\1081 \1087\1091\1090\1100"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_9")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1057\1090\1088\1072\1076\1072\1083\1077\1094"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_10")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1058\1086\1090 \1078\1077 \1073\1088\1077\1076"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_11")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1056\1077\1082\1086\1088\1076\1099 \1080 \1072\1085\1090\1080\1088\1077\1082\1086\1088\1076\1099"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_12")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1057\1082\1086\1083\1100\1082\1086 \1089\1090\1086\1080\1090 \1086\1076\1080\1085 \1084\1080\1083\1083\1080\1072\1088\1076"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_13")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1053\1072\1076 \1095\1077\1084 \1074\1099 \1089\1077\1081\1095\1072\1089 \1088\1072\1073\1086\1090\1072\1077\1090\1077?"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_14")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1050\1083\1077\1097\1080 \1089\1086 \1089\1087\1091\1090\1085\1080\1082\1086\1074"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_15")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1057\1077\1082\1088\1077\1090\1085\1099\1081 \1087\1090\1080\1095\1085\1080\1082"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_16")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1048\1074\1072\1085 \1048\1074\1072\1085\1086\1074\1080\1095"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_17")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1050\1090\1086 \1076\1091\1084\1072\1077\1090, \1095\1090\1086 \1078\1080\1074\1077\1090 \1093\1086\1088\1086\1096\1086, \1078\1080\1074\1077\1090 \1093\1086\1088\1086\1096\1086"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_18")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1046\1080\1074\1077\1077 \1074\1089\1077\1093 \1078\1080\1074\1099\1093"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_19")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1057\1090\1072\1083\1080 \1085\1072\1079\1099\1074\1072\1090\1100 \1077\1075\1086 \1055\1077\1088\1083\1080\1075\1086\1089\1086\1084"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_20")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1052\1099 \1080 \1075\1088\1077\1085\1082\1080"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_21")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1042\1090\1086\1088\1086\1081 \1048\1074\1072\1085 \1048\1074\1072\1085\1086\1074\1080\1095"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_22")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1058\1088\1077\1090\1080\1081 \1048\1074\1072\1085 \1048\1074\1072\1085\1086\1074\1080\1095"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_23")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1044\1077\1083\1072\1102\1090 \1074\1080\1076, \1095\1090\1086 \1078\1080\1074\1091\1090"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_24")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1041\1088\1077\1076 \1088\1077\1072\1083\1100\1085\1086\1089\1090\1080"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_25")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1054 \1083\1102\1073\1074\1080, \1073\1088\1072\1082\1077 \1080 \1083\1102\1073\1074\1080 \1074\1085\1077 \1073\1088\1072\1082\1072"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_26")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "Haus der Dummen, \1080\1083\1080 \1044\1086\1084 \1076\1091\1088\1072\1082\1086\1074"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_27")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "Where are you from"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_28")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1057\1084\1077\1096\1072\1085\1085\1099\1081 \1073\1088\1077\1076"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_29")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1055\1088\1086\1073\1082\1072 \1080 \1084\1072\1083\1080\1085\1086\1074\1099\1081 \1087\1077\1083\1080\1082\1072\1085"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_30")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1040\1084\1077\1088\1080\1082\1072\1085\1089\1082\1072\1103 \1086\1082\1082\1091\1087\1072\1094\1080\1103 \1080 \1074\1103\1083\1086\1090\1077\1082\1091\1097\1072\1103 \1096\1080\1079\1086\1092\1088\1077\1085\1080\1103"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_31")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1055\1088\1086\1075\1091\1083\1082\1072"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_32")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1062\1077\1085\1072 \1074\1086\1087\1088\1086\1089\1072"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_33")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1042\1080\1076\1077\1085\1080\1077"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_34")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1063\1077\1083\1086\1074\1077\1082 \1087\1088\1086\1079\1088\1072\1095\1085\1099\1081, \1082\1072\1082 \1089\1090\1077\1082\1083\1086"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_35")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1044\1086\1082\1090\1086\1088 \1050\1083\1077\1097"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_36")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1050\1083\1077\1097"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_37")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1048\1079\1076\1077\1083\1080\1077 \8470 2 \1080 \1087\1088\1080\1079\1099\1074\1099 \1082 \1076\1077\1081\1089\1090\1074\1080\1102"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_38")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1056\1077\1074\1086\1083\1102\1094\1080\1103"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_39")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1042 \1087\1088\1080\1077\1084\1085\1086\1081 \1055\1077\1088\1083\1080\1075\1086\1089\1072"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_40")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1053\1077\1079\1072\1073\1099\1074\1072\1077\1084\1072\1103 \1074\1089\1090\1088\1077\1095\1072"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_41")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1042 \1086\1073\1097\1077\1089\1090\1074\1077 \1087\1077\1083\1080\1082\1072\1085\1086-\1083\1102\1076\1077\1081"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_42")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1047\1072\1089\1077\1076\1072\1085\1080\1077 \1074\1099\1089\1096\1077\1075\1086 \1086\1088\1075\1072\1085\1072"
  ,TagClose "div"
  ,TagOpen "a" [("name","gl_43")]
  ,TagClose "a"
  ,TagText "\r\n"
  ,TagOpen "div" [("class","take_h1")]
  ,TagText "\1042\1077\1083\1080\1082\1072\1103 \1095\1077\1088\1077\1085\1082\1086\1074\1072\1103 \1088\1077\1074\1086\1083\1102\1094\1080\1103"
  ,TagClose "div"
  ]
