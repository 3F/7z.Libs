# [7z.Libs](https://github.com/3F/7z.Libs)

📦📦 🗜  [nuget.org/packages/**7z.Libs**](https://www.nuget.org/packages/7z.Libs/)

An automated build of the `7z.Libs` NuGet packages.

[![Build status](https://ci.appveyor.com/api/projects/status/5d993sgsfuvxixsl/branch/master?svg=true)](https://ci.appveyor.com/project/3Fs/7z-libs/branch/master)
[![License](https://img.shields.io/badge/License-MIT-74A5C2.svg)](https://github.com/3F/7z.Libs/blob/master/License.txt)
[![NuGet package](https://img.shields.io/nuget/v/7z.Libs.svg)](https://www.nuget.org/packages/7z.Libs/)

[![Build history](https://buildstats.info/appveyor/chart/3Fs/7z-libs?buildCount=20&includeBuildsFromPullRequest=true&showStats=true)](https://ci.appveyor.com/project/3Fs/7z-libs/history)

[`gnt`](https://3F.github.io/GetNuTool/releases/latest/gnt/)` 7z.Libs` [[?](https://github.com/3F/GetNuTool)]

Build and use from source:

```bat
git clone https://github.com/3F/7z.Libs.git src
cd src
build & cd bin\Release\raw
```

Note: the build script is configured to use [*.version*](.version) by default. Use `--target-version` to build specific version, e.g.:

```bat
build --target-version 24.07.0
```

## Why 7z.Libs

[nuget.org/packages/7z.Libs](https://www.nuget.org/packages/7z.Libs/) is available for everyone starting from 2015. It was designed and distributed specially for [vsSolutionBuildEvent](https://github.com/3F/vsSolutionBuildEvent) and for other related purposes.

[7z.Libs](https://github.com/3F/7z.Libs) repositry **does not include** anything from 7-zip (www.7-zip.org) and only represents a fully automated distribution of the 7-zip libraries.

Everything was automated using the following tools:

* [vsSolutionBuildEvent](https://github.com/3F/vsSolutionBuildEvent)
* [hMSBuild](https://github.com/3F/hMSBuild)
* [GetNuTool](https://github.com/3F/GetNuTool)

## .NET 7-zip 

Most progressive use of 7-zip in .NET is possible through **[Conari](https://github.com/3F/Conari)**

As for project [LuNari](https://github.com/3F/LuNari), it was planned in the past as [N7z](https://github.com/3F/N7z)

However, I have the priority to review this tasks not earlier than after IeXod -> MvsSln projects. Read more about on reddit and Follow the news;

* https://github.com/3F

## License

[7z.Libs](https://github.com/3F/7z.Libs) repository is available under the [MIT License (MIT)](https://github.com/3F/7z.Libs/blob/master/License.txt)

```r
Copyright (c) 2015-2024  Denis Kuzmin <x-3F@outlook.com> github/3F
```

[ 「 ❤ 」 ](https://3F.github.io/fund)

7z.Libs contributors: https://github.com/3F/7z.Libs/graphs/contributors

7z.Libs and its various packages may include or reference various software components. 

⚠ You must follow their accompanying licenses depending on their use. [3rd-party-NOTICES](3rd-party-NOTICES.txt)

## Package structure

```
├───bin
│   ├───x64
│   └───x86
├───build
│   ├───native
│   ├───net
│   ├───netcoreapp
│   └───netstandard
├───lib
│   ├───net
│   ├───netcoreapp
│   └───netstandard
└───tools
```

Libraries and tools:

```
* 7za.dll       ~(284 KB - 403 KB)    Compact version of 7z.dll library for 7z archives.
* 7zxa.dll      ~(159 KB - 211 KB)    Compact version of 7z.dll library for extracting from 7z archives.
* 7z.dll        ~(1.23 MB - 1.80 MB)  Full 7-Zip engine for work with all available formats.
* hMSBuild.bat  ~(18 KB)              hMSBuild to build projects with msbuild tools.
* netfx4sdk.cmd ~(6 KB)               netfx4sdk to build on legacy platforms
* gnt.bat       ~(8 KB)               GetNuTool to service NuGet packages including this.
* vsSolutionBuildEvent.bat ~(8 KB)    vsSolutionBuildEvent bat version for customizing or editing build scripts including 7z.Libs.
```

### 7-zip Supported formats

  * Packing / Unpacking: 7z, XZ, BZIP2, GZIP, TAR, ZIP and WIM
  * Unpacking only: AR, ARJ, CAB, CHM, CPIO, CramFS, DMG, EXT, FAT, GPT, HFS, IHEX, ISO, LZH, LZMA, MBR, MSI, NSIS, NTFS, QCOW2, RAR, RPM, SquashFS, UDF, UEFI, VDI, VHD, VMDK, WIM, XAR and Z.

### Preferences

* To prevent copying into output path, define an msbuild property `NG7zLibsCopyToOutput` as false.
* For working with the solution level or for manual adding, use GetNuTool - https://github.com/3F/GetNuTool
* For .NET you can use Conari engine https://github.com/3F/Conari or SevenZipSharp, and so on.

## Contributing

Update [*.version*](.version) or click *vsSolutionBuildEvent.bat* for extra actions, or make even more awesome contribution!