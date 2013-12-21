
using terms from application "BibDesk"
	on perform BibDesk action with publications thePublications for script hook theScriptHook
		-- in reality there will never be > 1
		set theField to get field name of theScriptHook
		if theField is not "Local File" then return
		
		set theAddedFile to get new values of theScriptHook as string
		
		-- contants for constructing the plist of keywords
		set plistFront to "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\"><plist version=\"1.0\"><array>"
		set plistEnd to "</array></plist>"
		
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
			do shell script "xattr -w com.apple.metadata:_kMDItemUserTags '" & plistTagString & "' " & quoted form of theAddedFile
		end repeat
		
	end perform BibDesk action with publications
end using terms from