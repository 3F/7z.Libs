# [7z.Libs](https://github.com/3F/7z.Libs)

📦📦 🗜  [nuget.org/packages/**7z.Libs**](https://www.nuget.org/packages/7z.Libs/)

An automated build of the `7z.Libs` NuGet packages.

[![Build status](https://ci.appveyor.com/api/projects/status/5d993sgsfuvxixsl/branch/master?svg=true)](https://ci.appveyor.com/project/3Fs/7z-libs/branch/master)
[![License](https://img.shields.io/badge/License-MIT-74A5C2.svg)](https://github.com/3F/7z.Libs/blob/master/License.txt)
[![NuGet](https://img.shields.io/nuget/v/7z.Libs.svg)](https://www.nuget.org/packages/7z.Libs/)

[`gnt`](https://3F.github.io/GetNuTool/releases/latest/gnt/)` 7z.Libs` [[?](https://github.com/3F/GetNuTool)]

Build and use from source:

```bat
git clone https://github.com/3F/7z.Libs.git src
cd src
build & cd bin\Release\raw
```

Note: the build script is configured to use [*.version*](.version) by default. Use `--target-version` to build specific version, e.g.:

```bat
build --target-version 24.08.0
```

## Why 7z.Libs

[nuget.org/packages/7z.Libs](https://www.nuget.org/packages/7z.Libs/) is available for everyone starting from 2015. It was designed and distributed specially for [vsSolutionBuildEvent](https://github.com/3F/vsSolutionBuildEvent) and for other related purposes.

[7z.Libs](https://github.com/3F/7z.Libs) repository **does not include** anything from 7-zip (**www.7-zip.org**) and only represents a fully automated distribution of the 7-zip libraries.

Everything was automated using the following tools:

* [vsSolutionBuildEvent](https://github.com/3F/vsSolutionBuildEvent)
* [hMSBuild](https://github.com/3F/hMSBuild)
* [GetNuTool](https://github.com/3F/GetNuTool)

### Preferences

MSBuild Property / Environment variable | native C/C+ | .NET    | Default value | Description
----------------------------------------|-------------|---------|---------------|------------------
`NG7zLibsCopyToOutput` | ✔ | ✔ | true | To prevent copying into output path, set as **false**
`NG7zLibsDir32bit` | ✔ | ✔ | x86 | Custom folder name for 32-bit modules if NG7zLibsCopyToOutput=true
`NG7zLibsCopyLicense` | ✔ | ✔ | true | Provide .txt licenses along with modules if NG7zLibsCopyToOutput=true
`NG7zLibsResolvePublish` | - | ✔ | true | Resolve the *Publish* target
`NG7zLibsRootPkg` | ✔ | ✔ | - | Root path to the **7z.Libs** package. E.g. path to tools like $(NG7zLibsRootPkg)tools\
`NG7zLibsLimitToPlatform` | ✔ | - | legacy | Limit copying x86/x64 modules to specific platform. Values: legacy, true, false
`NG7zLibsLimitToPlatform` | - | ✔ | false  | Limit copying x86/x64 modules to specific platform. Relies on `PlatformTarget`

7z.Libs is possible to use in managed projects (.NET, etc.) through Conari engine https://github.com/3F/Conari or SevenZipSharp, and so on.

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

Package Libraries and Tools | Size | Description  | Example
----------------------------|------|--------------|----------
7za.dll  | ~284 - ~403 KB | Compact version of 7z.dll library for 7z archives.
7zxa.dll | ~159 - ~211 KB | Compact version of 7z.dll library for extracting from 7z archives.
7z.dll   | ~1.23 - ~1.80 MB | Full 7-Zip engine for work with all available formats.
[hMSBuild.bat](https://github.com/3F/hMSBuild)     | ~18 KB  | hMSBuild to build projects with msbuild tools+ | `hMSBuild -cs -no-less-15`
[netfx4sdk.cmd](https://github.com/3F/netfx4sdk)   | ~6 KB   | netfx4sdk to build on legacy platforms | `netfx4sdk -mode sys \|\| netfx4sdk -mode pkg` to support netfx4.0 etc.
[gnt.bat](https://github.com/3F/GetNuTool)         | ~8 KB   | GetNuTool to service NuGet packages including this | `gnt 7z.Libs` for working with the solution level or for manual adding **7z.Libs** etc.
[vsSolutionBuildEvent.bat](https://github.com/3F/vsSolutionBuildEvent) | ~8 KB  |  vsSolutionBuildEvent bat version for customizing or editing build scripts including 7z.Libs


### 7-zip Supported formats

  * Packing / Unpacking: 7z, XZ, BZIP2, GZIP, TAR, ZIP and WIM
  * Unpacking only: AR, ARJ, CAB, CHM, CPIO, CramFS, DMG, EXT, FAT, GPT, HFS, IHEX, ISO, LZH, LZMA, MBR, MSI, NSIS, NTFS, QCOW2, RAR, RPM, SquashFS, UDF, UEFI, VDI, VHD, VMDK, WIM, XAR and Z.

## Contributing

[7z.Libs](https://github.com/3F/7z.Libs) is waiting for your awesome contributions!

\*click *vsSolutionBuildEvent.bat* to perform additional build actions

```bat
git clone https://github.com/3F/7z.Libs.git src
cd src & vsSolutionBuildEvent
```