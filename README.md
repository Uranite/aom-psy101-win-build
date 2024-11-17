# aom-psy101-win-build

This repository hosts unofficial Windows builds of AOM-PSY101. These builds are community-maintained and are not officially supported by the original project maintainers.

## About these Builds
This is an unofficial Windows build repository. The builds are available in the [Releases](https://github.com/Uranite/aom-psy101-win-build/releases) section of this repository. Multiple builds are provided, optimized for different CPU architectures using Clang's -march options.

Choose the build that matches your CPU's architecture for optimal performance.

## Architecture

When downloading pre-compiled binaries, you might see x86-64, x86-64-v2, x86-64-v3, etc. If you don't know exactly what ISA extensions your CPU supports, here is a chart to help you quickly understand your hardware's support:
### Not Vendor-Specific
```js
x86-64    : Processors lacking SSE4.2 and newer features
x86-64-v2 : Processors with features up to and including SSE4.2
x86-64-v3 : Processors with features up to and including AVX and/or AVX2
x86-64-v4 : Processors with features up to and including AVX512
```
### AMD
```js
Generation                                             Vectors  Build
Zen   (1xxx)                                           AVX2     x86-64-v3 / znver1
Zen+  (1xxxAF-2xxx-3xxxG/H/U/C)                        AVX2     x86-64-v3 / znver1
Zen2  (3xxx-4xxxS/G/H/U-5700U-5500U-5300U-7520U-7320U) AVX2     x86-64-v3 / znver2
Zen3  (5xxx-7330U-7530U-7730U)                         AVX2     x86-64-v3 / znver3
Zen3+ (6xxx-7xxxH/U)                                   AVX2     x86-64-v3 / znver3
Zen4  (7xxx-8xxxG)                                     AVX512   x86-64-v4 / znver4
Zen5  (9xxx-AI 3xx)                                    AVX512   x86-64-v4 / znver5
```
### Intel (Desktop)
```js
Generation                Vectors  Build
Haswell     (4th gen)     AVX2     x86-64-v3 / haswell
Broadwell   (5th gen)     AVX2     x86-64-v3 / broadwell
Skylake     (6th gen)     AVX2     x86-64-v3 / skylake
Kaby Lake   (7th gen)     AVX2     x86-64-v3 / skylake
Coffee Lake (8-9th gen)   AVX2     x86-64-v3 / skylake
Comet Lake  (10th gen)    AVX2     x86-64-v3 / skylake
Rocket Lake (11th gen)    AVX512   x86-64-v4 / rocketlake
Alder Lake  (12th gen)    AVX2     x86-64-v3 / alderlake
Raptor Lake (13-14th gen) AVX2     x86-64-v3 / raptorlake
```

## Original Project
- Original repository: [AOM-PSY101 on GitLab](https://gitlab.com/damian101/aom-psy101)
- License: BSD 2-Clause "Simplified" License

## License
The compiled builds are distributed under the BSD 2-Clause "Simplified" License. See the [LICENSE](https://github.com/Uranite/aom-psy101-win-build/blob/master/LICENSE) file for more information.
