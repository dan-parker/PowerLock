#NoEnv, #Persistent, #SingleInstance

DelayBetweenKeys = 30000 ; Adjust this value if it doesn't work.

vkFF::
If (A_PriorHotkey = %A_ThisHotkey% && A_TimeSincePriorHotkey > %DelayBetweenKeys%)
	Run rundll32.exe user32.dll`,LockWorkStation     ;power button        255 » FF   Lock Workstation
return





