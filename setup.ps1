if ($args[0] -eq "--packer" -or $args[0] -eq "-p") {
	git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
} elseif ($args[0] -eq "--install" -or $args[0] -eq "-i") {
	Copy-Item -Path nvim -Destination $ENV:LOCALAPPDATA -Recurse -Force
} elseif ($args[0] -eq $null ) {
	Get-Content .data\help.dat
}
