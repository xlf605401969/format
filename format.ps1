# 需要进行格式化的源码目录
$FormatSourcePath = "Source", "Src", "include", "Inc"
# 需要排除的文件
$ExcludeFiles = 

# 不在源码目录下需要进行格式化的文件
$ExtraFormatFiles = "test.c"

if (-not (Test-Path -Path .\.clang-format))
{
    Throw "No Format Style File!"
}

if (-not (Test-Path -Path .\clang-format.exe))
{
    Throw "No Format Program File!"
}

foreach ($path in $FormatSourcePath)
{
    $files = Get-ChildItem -Recurse $path | Where-Object {$_.Name -match ".*\.(c|h)"}
    foreach ($file in $files)
    {
        $format = $true
        foreach ($excludeFile in $ExcludeFiles)
        {
            if ($excludeFile.contains($file.Name))
            {
                $format = $false
            }
        }
        if ($format)
        {
            Write-Host ("Formatting File {0}" -f $file.FullName)
            &".\clang-format.exe" -style=file -i $file.FullName
        }
        else 
        {
            Write-Host ("Exclude File {0}" -f $file.FullName)
        }

    }
}

foreach ($file in $ExtraFormatFiles)
{
    Write-Host ("Formatting File {0}" -f $file)
    &".\clang-format.exe" -style=file -i $file
}

Write-Host "Format Complete!"
Pause