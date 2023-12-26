$releaseDate = Read-Host "リリース日を入力してください（YYYYMMDD）"
if ($releaseDate -notmatch "^[0-9]{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$") {
    Write-Host "リリース日を正しい日付で入力してください。"
    $host.UI.RawUI.ReadKey()
    exit
}

$seqNo = Read-Host "通番を入力してください"
if ($seqNo -notmatch "^[0-9]{1,2}$") {
    $seqNo = "01"
} elseif ($seqNo -match "^[0-9]$") {
    $seqNo = "0" + $seqNo
}

$releaseDir = $releaseDate + "_" + $seqNo;
Write-Host $releaseDir"で更新します。"

# Asset更新対象ファイルパス取得
$filePathList = (Get-ChildItem -Path "{ディレクトリパス}" -Filter *.properties -Recurse).Fullname
$filePathList += (Get-ChildItem -Path "{ディレクトリパス}" -Filter *.xml -Recurse).Fullname
foreach ($filePath in $filePathList){
    $fileContent = Get-Content $filePath
    $serachWord = ""
    $replaceWord = ""
    foreach ($line in $fileContent) {
        if ($line -like "{検索文字}") {
            $serachWord = $line
            $replaceWord = $line -replace "[0-9]{8}_[0-9]{2}", $releaseDir
        }
    }
    $lfText = [System.IO.File]::ReadAllText($filePath).Replace($serachWord,$replaceWord)
    [System.IO.File]::WriteAllText($filePath, $lfText)
    # SJISになるため不採用
    # $fileContent = $fileContent -replace $serachWord,$replaceWord
    # Set-Content -Path $filePath -Value $fileContent
    Write-Host "更新ファイル: "$filePath
}

Write-Host "更新完了しました。"
$host.UI.RawUI.ReadKey()