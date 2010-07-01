; author: syhan
; date: March 3, 2010
; usage: this ahk script is used for clicking next quiz button and
;        play the audio button without moving the mouse 
;        in 听英文选中文 of 新东方背单词5

SetTitleMatchMode, 2
#SingleInstance force

; Ctrl+N: next quiz
^n::
PostMessage, 0x201, , , Button13, ahk_class #32770
PostMessage, 0x202, , , Button13, ahk_class #32770
return

; Ctrl+P: play 
^p::
PostMessage, 0x201, , , Button3, ahk_class #32770
PostMessage, 0x202, , , Button3, ahk_class #32770
return 
