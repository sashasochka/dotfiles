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
set-alias ssh New-PSSecureRemoteSession
set-alias sh New-PSRemoteSession
set-alias cwd Get-Location
function .. {
cd ..;
}

function ... {
cd ..\..;
}
set-alias edit notepad
cd $HOME;

