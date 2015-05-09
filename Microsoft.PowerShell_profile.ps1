function ff ([string] $glob) { get-childitem -recurse -include $glob }

function osr { shutdown -r -t 5 }

function osh { shutdown -h -t 5 }

function rmd ([string] $glob) { remove-item -recurse -force $glob }

function whoami { (get-content env:\userdomain) + "\" + (get-content env:\username); }

function strip-extension ([string] $filename)
{
    [system.io.path]::getfilenamewithoutextension($filename)
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
   $content = gc $filename

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
set-alias env "Get-ChildItem Env:"
set-alias conemu "C:\Program Files\ConEmu\ConEmu64.exe"
function .. {
  cd ..;
}

function ... {
  cd ..\..;
}
set-alias edit notepad
cd $HOME;

