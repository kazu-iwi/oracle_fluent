SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode,2
;日本語キーボード用
RAlt & h::Send,{Home}
RAlt & a::Send,+{Home}
RAlt & n::Send,{End}
RAlt & e::Send,+{End}
RAlt & i::Send,{Up}
RAlt & j::Send,{Left}
RAlt & k::Send,{Down}
RAlt & l::Send,{Right}
RAlt & u::Send,{PgUp}
RAlt & o::Send,{PgDn}
RAlt::Send,{vKF3}