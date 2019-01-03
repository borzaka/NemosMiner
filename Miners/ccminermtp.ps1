if (!(IsLoaded(".\Include.ps1"))) {. .\Include.ps1; RegisterLoaded(".\Include.ps1")}

<<<<<<< HEAD

=======
>>>>>>> parent of d33f8b9... Revert "tidy-up a little"
$Path = ".\Bin\NVIDIA-ccminermtp119/ccminer_sm61.exe"
$Uri = "https://github.com/nemosminer/djm34mtpccminer/releases/download/1.1.9/ccminermtp119.7z"

$Commands = [PSCustomObject]@{
    "mtp" = "" #MTP
}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | ForEach-Object {
    [PSCustomObject]@{
        Type      = "NVIDIA"
        Path      = $Path
        Arguments = "-d $($Config.SelGPUCC) -i 16 --quite -b $($Variables.NVIDIAMinerAPITCPPort) -a $_ -o stratum+tcp://$($Pools.(Get-Algorithm($_)).Host):$($Pools.(Get-Algorithm($_)).Port) -u $($Pools.(Get-Algorithm($_)).User) -p $($Pools.(Get-Algorithm($_)).Pass)$($Commands.$_)"
<<<<<<< HEAD
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Week}
        API       = "ccminer"
        Port      = $Variables.NVIDIAMinerAPITCPPort #4068
=======
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Day}
        API       = "ccminer"
        Port      = $Variables.NVIDIAMinerAPITCPPort
>>>>>>> parent of d33f8b9... Revert "tidy-up a little"
        Wrap      = $false
        URI       = $Uri
        User      = $Pools.(Get-Algorithm($_)).User
    }
}