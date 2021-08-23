# [7z.Libs](https://github.com/3F/7z.Libs)

📦📦 🗜  [nuget.org/packages/**7z.Libs**](https://www.nuget.org/packages/7z.Libs/)

An automated build of the `7z.Libs` NuGet packages.

[![Build status](https://ci.appveyor.com/api/projects/status/5d993sgsfuvxixsl/branch/master?svg=true)](https://ci.appveyor.com/project/3Fs/7z-libs/branch/master)
[![release](https://img.shields.io/github/release/3F/7z.Libs.svg)](https://github.com/3F/7z.Libs/releases/latest)
[![License](https://img.shields.io/badge/License-MIT-74A5C2.svg)](https://github.com/3F/7z.Libs/blob/master/License.txt)
[![NuGet package](https://img.shields.io/nuget/v/7z.Libs.svg)](https://www.nuget.org/packages/7z.Libs/)

[![Build history](https://buildstats.info/appveyor/chart/3Fs/7z-libs?buildCount=20&includeBuildsFromPullRequest=true&showStats=true)](https://ci.appveyor.com/project/3Fs/7z-libs/history)

[`gnt`](https://3f.github.io/GetNuTool/releases/latest/gnt/)` /p:ngpackages="7z.Libs"` [[?](https://github.com/3F/GetNuTool)]

## Briefly about [7z.Libs](https://github.com/3F/7z.Libs)

Our [nuget.org/packages/7z.Libs](https://www.nuget.org/packages/7z.Libs/) is available for everyone starting from 2015. It was designed and distributed specially for [vsSolutionBuildEvent](https://github.com/3F/vsSolutionBuildEvent) and for other related purposes.

[7z.Libs](https://github.com/3F/7z.Libs) repositry **does not include** anything from 7-zip (www.7-zip.org) and only represents a fully automated distribution of the 7-zip libraries.

Everything was automated using the following tools:

* [vsSolutionBuildEvent](https://github.com/3F/vsSolutionBuildEvent)
* [hMSBuild](https://github.com/3F/hMSBuild)
* [GetNuTool](https://github.com/3F/GetNuTool)

It has been finally opened for everyone as part of https://github.com/3F for more open way!

## .NET 7-zip 

Most progressive use of 7-zip in .NET is possible through 🧬 **[Conari](https://github.com/3F/Conari)**

As for project 🗦🌔 [LuNari](https://github.com/3F/LuNari), it was planned in the past as **[N7z](https://github.com/3F/N7z)**

Today I have the priority to review this tasks not earlier than after IeXod -> MvsSln projects.

Just Follow the news;

* https://github.com/3F
* https://twitter.com/GitHub3F

## ✔ License

[7z.Libs](https://github.com/3F/7z.Libs) is available under the [MIT License (MIT)](https://github.com/3F/7z.Libs/blob/master/License.txt)


```r
Copyright (c) 2015-2021  Denis Kuzmin <x-3F@outlook.com> github/3F
```

[ [ <sub>@</sub> ☕ ] ](https://3F.github.io/Donation/)

7z.Libs contributors: https://github.com/3F/7z.Libs/graphs/contributors

7z.Libs and its various packages may include or reference various software components. 

⚠ You must follow their accompanying licenses depending on their use.

Our [3rd-party-NOTICES](3rd-party-NOTICES.txt)

## Package structure

```
├───bin
│   ├───x64
│   └───x86
│
├───build
│   ├───native
│   └───net
│
└───tools
```

Libraries and tools:

```
* 7za.dll       ~(263 KB - 373 KB)    Compact version of 7z.dll library for 7z archives.
* 7zxa.dll      ~(155 KB - 204 KB)    Compact version of 7z.dll library for extracting from 7z archives.
* 7z.dll        ~(1.08 MB - 1.60 MB)  Full 7-Zip engine for work with all available formats.
* hMSBuild.bat  ~(18.8 KB)            hMSBuild for build projects with msbuild tools.
* gnt.bat       ~(8.92 KB)            GetNuTool to service NuGet packages including this.
```

### 7-zip Supported formats

  * Packing / Unpacking: 7z, XZ, BZIP2, GZIP, TAR, ZIP and WIM
  * Unpacking only: AR, ARJ, CAB, CHM, CPIO, CramFS, DMG, EXT, FAT, GPT, HFS, IHEX, ISO, LZH, LZMA, MBR, MSI, NSIS, NTFS, QCOW2, RAR, RPM, SquashFS, UDF, UEFI, VDI, VHD, VMDK, WIM, XAR and Z.

### Preferences

* To prevent copying into output path, define an msbuild property `NG7zLibsCopyToOutput` as false.
* For work with solution level or for manual adding, use GetNuTool - https://github.com/3F/GetNuTool
* For .NET you can use Conari engine https://github.com/3F/Conari or SevenZipSharp, and so on.

## Contribute

Update *.artefacts* or use *Edit.Scripts.GUI.cmd* for more actions.

We're waiting for your awesome contributions!