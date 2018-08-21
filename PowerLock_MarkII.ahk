#NoEnv, #Persistent, #SingleInstance

vkFF::
If (A_TimeSincePriorHotkey > 30000 OR A_TimeSincePriorHotkey =-1)
	Run rundll32.exe user32.dll`,LockWorkStation     ;power button        255 » FF   Lock Workstation
return

