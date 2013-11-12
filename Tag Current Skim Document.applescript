tell application "Skim"
	set d to path of front document
	set t to do shell script "/opt/local/bin/tag --list --no-name " & quoted form of d
	set n to text returned of (display dialog "Current tags: " & t & "
 Tags to add: " default answer "")
	do shell script "/opt/local/bin/tag --add " & quoted form of n & " " & quoted form of d
end tell
