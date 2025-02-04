$backgroundsdir = ""
$renamedbackgrounds = New-Item -Path "$backgroundsdir" -Name Output -ItemType Directory -Force

Function ResizeImage($file, $output) {
    $wia = New-Object -com wia.imagefile
    $wia.LoadFile($file)
    $wip = New-Object -ComObject wia.imageprocess
    $scale = $wip.FilterInfos.Item("Scale").FilterId                    
    $wip.Filters.Add($scale)
    $wip.Filters[1].Properties("MaximumWidth") = 150
    $wip.Filters[1].Properties("MaximumHeight") = 150
    $wip.Filters[1].Properties("PreserveAspectRatio") = $true
    $wip.Apply($wia) 
    $newimg = $wip.Apply($wia)
    $newimg.SaveFile($output)
}

# #Rename and resize files
$images = get-childitem $backgroundsdir | Where-Object { $_.Name -Like "*.jpg" -or $_.Name -Like "*.jpeg" -or $_.Name -Like "*.png" -or $_.Name -Like "*.bmp" }
foreach ($image in $images) {
    $fileExtension = [System.IO.Path]::GetExtension($image)
    $baseName = new-guid
    $mainName = "$baseName$fileExtension"
    $thumbname = "${baseName}_thumb$fileExtension"
    $target = Join-Path -Path $renamedbackgrounds -ChildPath $mainName
    $thumbTarget = Join-Path -Path $renamedbackgrounds -ChildPath $thumbname
    Copy-Item -Path $image.FullName -Destination $target
    ResizeImage $image $thumbTarget
}
