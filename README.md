BibDesk-MavericksTags
=====================

Applescripts for working with BibDesk, Skim and Mavericks tags

### Dependencies

Install https://github.com/jdberry/tag first

## keywords2tags

Adds the Keywords from the current selection in BibDesk to all linked files as Mavericks tags.

limitations:
- fails ungracefully if there is a broken link to a file in BibDesk

to do:
- two way sync to add any existing Mavericks tags back to BibDesk
- could update to use jdberry's tag rather than kludgy Applescript

## keywords2tags - script hook

For use with BibDesk "Add File or URL" script hook.  When adding a file to a publication in BibDesk, add the publication's keywords to the newly added file as Mavericks tags.

limitations:
- if you undo the add file operation in BibDesk, the tags are not removed from the added file

## Tag Current Skim Document

Displays the Maverick tags in the current Skim document and allows user to append additional tags.

to do:
- option to replace instead of append
