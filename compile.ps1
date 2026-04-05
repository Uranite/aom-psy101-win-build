if (Test-Path "aom-psy101") {
    Set-Location "aom-psy101"
    git pull
    Write-Host "`nJust incase if the git pull has gone wrong" -ForegroundColor Yellow
    Write-Host "Press Enter to continue or Ctrl+C to exit..." -ForegroundColor Yellow
    $null = Read-Host
} else {
    git clone https://gitlab.com/damian101/aom-psy101 --depth 1
    Set-Location "aom-psy101"
}

$BaseFlags = "-flto"
$Architectures = @(
    "x86-64", "x86-64-v2", "x86-64-v3", "x86-64-v4",  # General x86-64 versions
    "znver1", "znver2", "znver3", "znver4", "znver5", # Ryzen architectures
    "haswell", "broadwell", "skylake",                # Intel Haswell, Broadwell, Skylake,
    "rocketlake", "alderlake", "raptorlake"           # Rocket Lake, Alder Lake, and Raptor Lake
)

foreach ($Arch in $Architectures) {
    $exePath = "aom_build/$Arch/aomenc.exe"

    if (Test-Path $exePath) {
        Write-Output "Skipping $Arch as $exePath already exists."
        continue
    }

    cmake --fresh -B aom_build -G Ninja -DBUILD_SHARED_LIBS=0 -DENABLE_DOCS=0 -DCONFIG_TUNE_BUTTERAUGLI=0 -DCONFIG_TUNE_VMAF=0 -DCONFIG_AV1_DECODER=0 -DENABLE_TESTS=0 -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="$BaseFlags -march=$Arch" -DCMAKE_C_FLAGS="$BaseFlags -march=$Arch"
    ninja -C aom_build

    $targetDir = "aom_build\$Arch"
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir
    }

    Move-Item "aom_build\aomenc.exe" $targetDir
}

$CommitHash = git rev-parse HEAD

$CommitHash | Out-File "aom_build\build_commit.txt"

$PathsToCompress = $Architectures | ForEach-Object { ".\aom_build\$_" }
$PathsToCompress += ".\aom_build\build_commit.txt"

7z a -t7z -mx=9 "aom_build.7z" $PathsToCompress

Write-Host "`nBuild completed using commit: $CommitHash" -ForegroundColor Green
