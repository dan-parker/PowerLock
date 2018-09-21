#NoEnv, #Persistent, #SingleInstance
;Must be in auto-execute section if I want to use the constants
#Include %A_ScriptDir%\AHKHID.ahk

;Create GUI to receive messages
Gui, +LastFound
hGui := WinExist()

;Intercept WM_INPUT messages
WM_INPUT := 0xFF
OnMessage(WM_INPUT, "InputMsg")

;Register Keyboard with RIDEV_INPUTSINK (so that data is received even in the background)
p := AHKHID_Register(1, 6, hGui, RIDEV_INPUTSINK)

Return

InputMsg(wParam, lParam) {
    Local devh, iKey, sLabel
    
    Critical
    
    ;Get handle of device
    devh := AHKHID_GetInputInfo(lParam, II_DEVHANDLE)
    ;Check that it is my HP remote5
    If (AHKHID_GetDevInfo(devh, DI_DEVTYPE, True) = RIM_TYPEKEYBOARD)
        And (AHKHID_GetDevInfo(devh, DI_HID_VENDORID, True) = 81)
        And (AHKHID_GetDevInfo(devh, DI_HID_PRODUCTID, True) = 0) {
       ;Get data
        iKey := AHKHID_GetInputInfo(lParam, II_KBD_VKEY)
	If (iKey <> -1) {	
		sLabel := "KB_" . iKey
		;MsgBox, %iKey%
		if IsLabel(sLabel)
			Gosub, %sLabel%
	}
    }
}

;Red
KB_255:
If (A_TimeSincePriorHotkey > 30000 OR A_TimeSincePriorHotkey =-1)
	Run rundll32.exe user32.dll`,LockWorkStation     ;power button        255 » FF   Lock Workstation
return


