chcp 1251 | Out-Null
$OutputEncoding = [Console]::OutputEncoding

$ErrorView = "CategoryView" # previously was "NormalView"

function Prompt 
{
    $pwd = $(pwd).ToString()
    if ($pwd.StartsWith($env:userprofile))
    {
        $pwd = $pwd -replace [regex]::escape($env:userprofile), "~"
    } 
    else
    {
        $pwd = $pwd.Substring(0,1) + $pwd.Substring(2)
    }
    $pwd = $pwd.ToLower()
    $pwd = $pwd -replace '\\', '/'
    $date = date -format "HH:mm:ss"
    # Prompt requires to use echo, not write-host therefore this hack
    write-host "[$date] " -foregroundcolor cyan -NoNewLine
    write-host "$pwd" -foregroundcolor magenta -NoNewLine
    write-host ">" -foregroundcolor green -NoNewLine
    echo " "
}

function ff ([string] $glob) { get-childitem -recurse -include $glob }

function osr { shutdown -r -t 5 }

function osh { shutdown -h -t 5 }

function rmd ([string] $glob) { remove-item -recurse -force $glob }

function whoami { (get-content env:\userdomain) + "\" + (get-content env:\username); }

function strip-extension ([string] $filename)
{
    [system.io.path]::getfilenamewithoutextension($filename)
}

function Directory-Summary($dir=".")
{
  get-childitem $dir | 
    % { $f = $_ ; 
        get-childitem -r $_.FullName | 
           measure-object -property length -sum | 
             select @{Name="Name";Expression={$f}},Sum}
}

function New-PSSecureRemoteSession
{
	param ($sshServerName, $Cred)
	$Session = New-PSSession $sshServerName -UseSSL -Credential $Cred -ConfigurationName C2Remote
	Enter-PSSession -Session $Session
}

function New-PSRemoteSession
{
	param ($shServerName, $Cred)
	$shSession = New-PSSession $shServerName -Credential $Cred -ConfigurationName C2Remote
	Enter-PSSession -Session $shSession
}

function gotoprojects{set-location E:\projects}
function gotoprofile{set-location C:\Users\Oleksandr\Documents\WindowsPowerShell}
function gotodownloads{set-location C:\Users\Oleksandr\Downloads}

function Enum-Lines($filename) {
   $content = cat $filename -encoding utf8

   $total_lines = 0
   $content | %{++$total_lines}

   $width = [Math]::Ceiling([Math]::Log10($total_lines)) + 1

   $i = 0; 
   $content | %{++$i; "{0,-$width}{1}" -f $i, $_;}
}

set-alias nl Enum-Lines
set-alias subl "C:\Program Files\Sublime Text 3\sublime_text.exe"
set-alias grep select-string
set-alias wssh New-PSSecureRemoteSession
set-alias wsh New-PSRemoteSession
set-alias projects gotoprojects
set-alias profile gotoprofile
set-alias downloads gotodownloads
set-alias cwd Get-Location
set-alias edit vim
set-alias which Get-Command
set-alias du Directory-Summary
set-alias conemu "C:\Program Files\ConEmu\ConEmu64.exe"

function env {
    Get-ChildItem Env:
}

function .. {
    cd ..;
}

function ... {
    cd ..\..;
}

cd $HOME;

