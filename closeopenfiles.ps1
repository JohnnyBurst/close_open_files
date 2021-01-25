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

#For multiple instances of the same open file, review the following command
#Replace "filepath.extension" with as much of the file path and extension as possible.

Get-SmbOpenFile | where {$_.Path –like "*filepath.extension"} | Close-SmbOpenFile -Force

#Script to get specific open shared file with user identifying information
get-smbopenfile | where-object -property path -like "sharedrive:\sharename\path\filename.ext" | ft clientusername,path


#By rerunning the "get-smbopenfile" line, you can ensure the script ran successfully if no results are returned.
