.386
.model flat, stdcall
option casemap:none

include windows.inc
include kernel32.inc
include user32.inc

includelib kernel32.lib
includelib user32.lib

PUBLIC HookProc

.data
    fileName    BYTE "keylog.txt",0
    fileHandle  DWORD ?
    buffer      BYTE 2 DUP(?)
    msgBoxText db "File opened successfully!", 0
    msgBoxCaption db "Debug Info", 0


.code

HookProc proc nCode:DWORD, wParam:WPARAM, lParam:LPARAM
    ; Check if the hook code indicates the event should be processed
    cmp nCode, 0
    jl skip_event


        invoke MessageBox, NULL, addr fileName, addr fileName, MB_OK

    ; If the key is pressed (WM_KEYDOWN)
    cmp wParam, 0100h
    je key_down

    ; If the key is released (WM_KEYUP)
    cmp wParam, 0101h
    je key_up

skip_event:
    ; Pass event to next hook or default handler
    invoke CallNextHookEx, NULL, nCode, wParam, lParam
    ret

key_down:
    ; Handle key down event
    ; For example, show a message box or log the key code
    invoke MessageBox, NULL, addr fileName, addr fileName, MB_OK
    ret

key_up:
    ; Handle key up event
    ; For example, show a message box or log the key release
    invoke MessageBox, NULL, addr fileName, addr fileName, MB_OK
    ret

HookProc endp

end

