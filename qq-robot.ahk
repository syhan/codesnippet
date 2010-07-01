; this Auto Hot Key script is a simple Tencent QQ robot
; author: syhan

SetTitleMatchMode, 2

; close existed qq dialog
GroupAdd, QQDialogs, ahk_class TXGuiFoundation
WinClose, ahk_group QQDialogs

; forever loop
Loop {

    ; view message, default is Ctrl+Alt+Z
    Send, ^!z
    Sleep, 1000
    
    ; if there's new message rather then the main window
    If WinExist("ahk_class TXGuiFoundation", "", "QQ2009 Beta2") 
    {
        WinActivate
	WinGetTitle, contact, A
        Sleep, 1000
 
	; it's disgusted unicode characters captured from ui needs _SendRaw method
	; while internal requires transform and copy to clipboard, fuck!
        _SendRaw(contact)
        cont := " 是吧，江湖上哪有不认识 "
        Transform, Clipboard, Unicode, %cont%
        Send, ^v
        _SendRaw(contact)
        Send, {enter}

        WinClose
    }
    else
    {
        WinClose, ahk_group QQDialogs
        Sleep, 10000
    }

}

; sample method do counting sheep 8-)
Counter()
{
    static count = 1
    ; ahk is horrible on unicode...
    content := "Hi , this is syhan's QQ robot. I'm doing counting, now I count %count%..."
    count += 1
    return %content%

}

; this method is obtained from http://ahk.5d6d.com/thread-131-1-1.html
_SendRaw(Keys)
{
    Len := StrLen(Keys) ; 得到字符串的长度，注意一个中文字符的长度是2
    KeysInUnicode := "" ; 将要发送的字符序列
    Char1 := "" ; 暂存字符1
    Code1 := 0 ; 字符1的ASCII码，值介于 0x0-0xFF (即1~255)
    Char2 := "" ; 暂存字符2
    Index := 1 ; 用于循环
    Loop
    {
        Code2 := 0 ; 字符2的ASCII码
        Char1 := SubStr(Keys, Index, 1) ; 第一个字符
        Code1 := Asc(Char1) ; 得到其ASCII值
        if(Code1 >= 129 And Code1 <= 254 And Index < Len) ; 判断是否中文字符的第一个字符
        {
            Char2 := SubStr(Keys, Index+1, 1) ; 第二个字符
            Code2 := Asc(Char2) ; 得到其ASCII值
            if(Code2 >= 64 And Code2 <= 254) ; 若条件成立则说明是中文字符
            {
                Code1 <<= 8 ; 第一个字符应放到高8位上
                Code1 += Code2 ; 第二个字符放在低8位上
            }
            Index++
        }

        if(Code1 <= 255) ; 如果此值仍<=255则说明是非中文字符，否则经过上面的处理必然大于255
            Code1 := "0" . Code1

        KeysInUnicode .= "{ASC " . Code1 . "}"

        if(Code2 > 0 And Code2 < 64)
        {
            Code2 := "0" . Code2
            KeysInUnicode .= "{ASC " . Code2 . "}"
        }
        Index++

        if(Index > Len)
            Break
    }
    Send % KeysInUnicode
} 

