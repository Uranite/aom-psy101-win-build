# SPDX-License-Identifier: MIT
$BaseFlags = "-flto"
$Architectures = @(
    "x86-64", "x86-64-v2", "x86-64-v3", "x86-64-v4",  # General x86-64 versions
    "znver1", "znver2", "znver3", "znver4", "znver5", # Ryzen architectures
    "haswell", "broadwell", "skylake",                # Intel Haswell, Broadwell, Skylake,
    "rocketlake", "alderlake", "raptorlake"           # Rocket Lake, Alder Lake, and Raptor Lake
)

foreach ($Arch in $Architectures) {
    $exePath = "aom_build/$Arch/aomenc.exe"

    # Check if the executable already exists
    if (Test-Path $exePath) {
        Write-Output "Skipping $Arch as $exePath already exists."
        continue
    }

    # Compile
    cmake --fresh -B aom_build -G Ninja -DBUILD_SHARED_LIBS=0 -DENABLE_DOCS=0 -DCONFIG_TUNE_BUTTERAUGLI=0 -DCONFIG_TUNE_VMAF=0 -DCONFIG_AV1_DECODER=0 -DENABLE_TESTS=0 -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS="$BaseFlags -march=$Arch" -DCMAKE_C_FLAGS="$BaseFlags -march=$Arch"
    ninja -C aom_build

    # Create target directory if it doesn't exist
    $targetDir = "aom_build\$Arch"
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir
    }

    # Move the executable to the target directory
    Move-Item "aom_build\aomenc.exe" $targetDir
}
