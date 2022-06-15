net use pathofshare /username password
$localpath = "Path of remote PC with CDR files"

Get-ChildItem $localpath -Filter *.zip | Expand-Archive -DestinationPath $localpath -Force
$cdrfiles = Get-ChildItem -Path $localpath -Filter *.csv

foreach ($cdrfile in $cdrfiles)
{
	$Path = $localpath + "\" + $cdrfile
	$newPath = $localpath + "\Edited_Excel\"
	$exportPath = $newPath + $cdrfile
	$exportPath

	Import-Csv -Path $Path | Select empty,did,type,calldatetime,duration,tonumber,fromnumber|ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 |Set-Content -Path $exportPath

}
