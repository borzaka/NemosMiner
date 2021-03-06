. .\Include.ps1

$Path = ".\Bin\NVIDIA-Alexis78\ccminer.exe"
$Uri = "https://github.com/nemosminer/ccminerAlexis78/releases/download/3%2F3%2F2018/ccminer-Alexis78.zip"

$Commands = [PSCustomObject]@{
    "hsr" = " -d $SelGPUCC" #Hsr(fastest)
    #"bitcore" = "" #Bitcore
    "blake2s" = " -d $SelGPUCC" #Blake2s(fastest)
    #"blakecoin" = " -d $SelGPUCC --api-remote" #Blakecoin
    #"vanilla" = "" #BlakeVanilla
    #"cryptonight" = "" #Cryptonight
    "veltor" = " -i 23 -d $SelGPUCC" #Veltor(fastest)
    #"decred" = "" #Decred
    #"equihash" = "" #Equihash
    #"ethash" = "" #Ethash
    #"groestl" = "" #Groestl
    #"hmq1725" = "" #hmq1725
    "keccak" = " -m 2 -i 29 -d $SelGPUCC" #Keccak(fastest)
    "lbry" = " -d $SelGPUCC" #Lbry
    "lyra2v2" = " -d $SelGPUCC -N 1" #Lyra2RE2(tied with excavotor as fastest) 
    #"lyra2z" = "" #Lyra2z
    #"myr-gr" = " -d $SelGPUCC --api-remote" #MyriadGroestl
    #"neoscrypt" = " -i 15 -d $SelGPUCC" #NeoScrypt
    "nist5" = " -d $SelGPUCC" #Nist5(fastest)
    #"pascal" = "" #Pascal
    #"qubit" = "" #Qubit
    #"scrypt" = "" #Scrypt
    #"sia" = "" #Sia
    "sib" = " -i 21 -d $SelGPUCC" #Sib(fastest)
    "skein" = " -d $SelGPUCC" #Skein(fastest)
    #"timetravel" = "" #Timetravel
    "c11" = " -i 21 -d $SelGPUCC" #C11(fastest)
    #"x11evo" = "" #X11evo
    #"x11gost" = " -i 21 -d $SelGPUCC --api-remote" #X11gost
    "x17" = " -i 20 -d $SelGPUCC" #X17(enemy1.03 faster)
    #"yescrypt" = "" #Yescrypt
}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = "NVIDIA"
        Path = $Path
        Arguments = "-b $($Variables.MinerAPITCPPort) -a $_ -o stratum+tcp://$($Pools.(Get-Algorithm($_)).Host):$($Pools.(Get-Algorithm($_)).Port) -u $($Pools.(Get-Algorithm($_)).User) -p $($Pools.(Get-Algorithm($_)).Pass)$($Commands.$_)"
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Week}
        API = "Ccminer"
        Port = $Variables.MinerAPITCPPort #4068
        Wrap = $false
        URI = $Uri
		User = $Pools.(Get-Algorithm($_)).User
    }
}
