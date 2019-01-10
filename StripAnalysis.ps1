$S16 = 0
$S32 = 0
$S64 = 0
$S128 = 0
$count = 0

$fileLengths = Get-ChildItem C:\ -recurse | Select-Object @{Name="Kbytes";Expression={$_.Length / 1Kb}}
foreach ($i in $fileLengths){
	$a = $i.Kbytes
	$b = ($a -as [double])
	if($b -le 16){
		$S16++
	}
	elseif(($b -gt 16) -and ($b -le 32)){
		$S32++
	}
	elseif(($b -gt 32) -and ($b -le 64)){
		$S64++
	}
	elseif($b -gt 64){
		$S128++
	}
	$count++
}

$count
$Block16 = $S16/$count
$Block32 = $S32/$count
$Block64 = $S64/$count
$Block128 = $S128/$count

$Block16
$Block32
$Block64
$Block128