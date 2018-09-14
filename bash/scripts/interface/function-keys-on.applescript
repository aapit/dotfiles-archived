--Enable/Disable "Use all F1, F2, etc. keys as standard function keys" option in Keyboard & Mouse Preference pane and close System Preferences
tell application "System Events"
	tell application "System Preferences"
		reveal anchor "keyboardTab" of pane "com.apple.preference.keyboard"
	end tell
	
	set theCheckbox to checkbox 1 of tab group 1 of window 1 of application process "System Preferences"
	set checkboxStatus to value of theCheckbox as boolean
	tell theCheckbox
		if checkboxStatus is false then click theCheckbox
	end tell
end tell
if application "System Preferences" is running then
	tell application "System Preferences" to quit
end if

"Turned function keys on."
