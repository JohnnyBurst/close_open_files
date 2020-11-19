#How to close open files that users have open on a remote server.
#To close open files on a file server, get file information and extension type
#Login to file server
#Access powershell as admin on the identified remote server. Run the following two commands

Get-SmbOpenFile | Format-List
Get-SmbOpenFile | where-object -property ShareRelativePath -Match ".filextension"

#View individual files for file properties. Match against file name and extension with further info from user

Get-SmbOpenFile -FileId fileidnumber | select-object -property *

#Script to close the open file

Close-SmbOpenFile -FileId fileidnumber

#For lots of the same open file, review the following command
#Replace "sharedrive:\sharename\path\filename.ext" with file name and path of open files


get-smbopenfile | where-object -property path -like "sharedrive:\sharename\path\filename.ext" | ft clientusername,path

#Change "get-smbopenfile *" to "close-smbopenfile *" for above file. You may receive multiple red CimExceptions for this script.
#By rerunning the "get-smbopenfile" line, you can ensure the script ran successfully if no results are returned.
