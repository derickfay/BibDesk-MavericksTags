set plistFront to "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"><plist version=\"1.0\"><array>"
set plistEnd to "</array></plist>"

(* By Derick Fay, 2013-10-28 *)
(* Thanks to http://mosx.tumblr.com/post/54049528297/convert-openmeta-to-os-x-mavericks-tags-with-this for getting me started *)

tell application "BibDesk"
	
	-- without document, there is no selection, so nothing to do
	if (count of documents) = 0 then
		beep
		display dialog "No documents found." buttons {"¥"} default button 1 giving up after 3
	end if
	set thePublications to the selection of document 1
	
	-- get the keywords
	repeat with thePub in thePublications
		set currentKeywords to get keywords of thePub
		
		
		-- convert the keywords to a plist for use with xattr
		set {myTID, AppleScript's text item delimiters} to {AppleScript's text item delimiters, {", "}}
		set tagList to text items of currentKeywords
		set AppleScript's text item delimiters to myTID
		set plistTagString to ""
		repeat with theTag in tagList
			set plistTagString to plistTagString & "<string>" & theTag & "</string>"
		end repeat
		set plistTagString to plistFront & plistTagString & plistEnd
		
		-- add the tags
		set theFiles to POSIX path of linked files of thePub
		
		repeat with f in theFiles
			do shell script "xattr -w com.apple.metadata:_kMDItemUserTags '" & plistTagString & "' " & quoted form of f
		end repeat
	end repeat
end tell
