$serverName="http://tfs:8080/tfs/ProjectCollection"

#get tfs variable

$tfs = .\get-tfs.ps1 $server

$toolPath='C:\"Program Files (x86)"\"Microsoft Visual Studio 10.0"\Common7\IDE'

$xmlPath= "C:\YourPathToXML"

#get list of team projects

$projects = $tfs.css.ListAllprojects()

foreach ($project in $projects) {

     $projectName = "`"" + $project.Name + "`""

     "Processing Project: $projectName"

     "Importing Change Request WI to TFS"

     $exec = "$toolPath\witadmin importwitd /collection:$serverName /f:$xmlPath\ChangeRequest.xml /p:$projectName"

     $out = Invoke-Expression $exec

     $out

}