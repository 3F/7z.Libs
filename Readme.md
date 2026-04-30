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
build --target-version 24.08
```

## Why 7z.Libs

[nuget.org/packages/7z.Libs](https://www.nuget.org/packages/7z.Libs/) is available for everyone starting from 2015. It was designed and distributed specially for [vsSolutionBuildEvent](https://github.com/3F/vsSolutionBuildEvent) and for other related purposes.

[7z.Libs](https://github.com/3F/7z.Libs) repository **does not include** anything from 7-zip (**www.7-zip.org**) and only represents a fully automated distribution of the 7-zip libraries.

Everything was automated using the following tools:

* [vsSolutionBuildEvent](https://github.com/3F/vsSolutionBuildEvent)
* [hMSBuild](https://github.com/3F/hMSBuild) `->` [GetNuTool](https://github.com/3F/GetNuTool)

### Preferences

MSBuild Property / Environment variable | native C/C+ | .NET    | Default value | Description
----------------------------------------|-------------|---------|---------------|------------------
`NG7zLibsCopyToOutput` | ✔ | ✔ | true | To prevent copying into output path, set as **false**
`NG7zLibsDir32bit` | ✔ | ✔ | x86 | Custom folder name for 32-bit modules if NG7zLibsCopyToOutput=true
`NG7zLibsCopyLicense` | ✔ | ✔ | true | Provide .txt licenses along with modules if NG7zLibsCopyToOutput=true
`NG7zLibsResolvePublish` | - | ✔ | true | Resolve the *Publish* target
`NG7zLibsRootPkg` | ✔ | ✔ | - | Root path to the **7z.Libs** package. E.g. path to tools like $(NG7zLibsRootPkg)tools\\
`NG7zLibsLimitToPlatform` | ✔ | - | legacy | Limit copying x86/x64 modules to specific platform. Values: legacy, true, false
`NG7zLibsLimitToPlatform` | - | ✔ | false  | Limit copying x86/x64 modules to specific platform. Relies on `PlatformTarget`

7z.Libs is possible to use in managed projects (.NET, etc.) through Conari engine https://github.com/3F/Conari or SevenZipSharp, and so on.

## GetNuTool

GetNuTool simplifies the work at the solution level and more together with *.pkg.install* feature (see below), for example:

```bat
gnt 7z.Libs
gnt 7z.Libs/25.01
```

Documentation: https://github.com/3F/GetNuTool/?tab=readme-ov-file#tmodes-and-commands

### .pkg.install

v1 support in modern 7z.Libs packages compatible with GetNuTool 1.10+

#### `touch` mode and `use`

Syntax: `[~] (arch | alias | command) [:filter]`

For example,

cmd | Description | Result
----|-------------|-------
`gnt ~7z.Libs` | All x86 + x64 7z libraries in separate folders | x64<br/>├─7z.dll<br/>├─7za.dll<br/>└─7zxa.dll<br/>x86<br/>├─7z.dll<br/>├─7za.dll<br/>└─7zxa.dll
`gnt ~7z.Libs -p:use=~` | All x86 + x64 7z libraries without subfolder | .\\7z.**x64**.dll<br/>.\\7z.**x86**.dll<br/>.\\7za.**x64**.dll<br/>.\\7za.**x86**.dll<br/>.\\7zxa.**x64**.dll<br/>.\\7zxa.**x86**.dll<br/>
`gnt ~7z.Libs -p:use=x64` | All x64 libraries in x64 subfolder | x64<br/>├─7z.dll<br/>├─7za.dll<br/>└─7zxa.dll
`gnt ~7z.Libs -p:use=~x64` | All x64 libraries without subfolders | .\\7z.dll<br/>.\\7za.dll<br/>.\\7zxa.dll
`gnt ~7z.Libs -p:use=~x64:7z` | Only x64 7z.dll without subfolder | .\\7z.dll
`gnt ~7z.Libs -p:use=~:7z` <br/>or<br/> `gnt ~7z.Libs -p:use=~7z` | 7z.dll (x64 and x86) without subfolders | .\\7z.**x64**.dll<br/>.\\7z.**x86**.dll
`gnt ~7z.Libs -p:use=x32` | x32 alias to x86 | x32<br/>├─7z.dll<br/>├─7za.dll<br/>└─7zxa.dll
`gnt ~7z.Libs -p:use=:7z` <br/>or<br/> `gnt ~7z.Libs -p:use=7z` | 7z.dll (x64 and x86) in separate folders | x64<br/>└─7z.dll<br/>x86<br/>└─7z.dll
`gnt ~7z.Libs -p:use=~x86:7zxa` | Only x86 7zxa.dll without subfolder | .\\7zxa.dll

Note: `touch` mode is applicable only for GetNuTool v1.10 (or newer) and for 7z.Libs packages at least starting with v26.
* if you need support for older packages, please submit a request via [issue tracker](https://github.com/3F/7z.Libs/issues) or you can rebuild any old yourself. For example, using `--target-version` for old v25.01 will be like:

```bat
build --target-version 25.1.0
```

## dotnet's `Publish`

For dotnet projects 7z.Libs packages supports *Publish* targets. Both Visual Studio (see *Publish...* in context menu) and MSBuild, for example:

> msbuild -t:Publish

Note `NG7zLibsResolvePublish` resolves this by default. Set `NG7zLibsResolvePublish=false` to disable if necessary.

## .NET 7-zip

Most progressive use of 7-zip in .NET is possible through **[Conari](https://github.com/3F/Conari)**

As for project [LuNari](https://github.com/3F/LuNari), it was planned in the past as [N7z](https://github.com/3F/N7z)

However, I have the priority to review this tasks not earlier than after IeXod -> MvsSln projects. Read more about on reddit and Follow the news;

* https://github.com/3F

## License

[7z.Libs](https://github.com/3F/7z.Libs) repository is available under the [MIT License (MIT)](https://github.com/3F/7z.Libs/blob/master/License.txt)

```r
Copyright (c) 2015-2026  Denis Kuzmin <x-3F@outlook.com> github/3F
```

[ 「 ☕ 」 ](http://3F.github.io/%E2%98%95)

7z.Libs contributors: https://github.com/3F/7z.Libs/graphs/contributors

7z.Libs and its various packages may include or reference various software components. 

⚠ You must follow their accompanying licenses depending on their use. [3rd-party-NOTICES](3rd-party-NOTICES.txt)

## Package structure

```
│   .pkg.install.bat      - extra `touch` mode and `use` features for 7z libraries
│   .version              - actual version
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
7za.dll  | ~286 - ~406 KB | Compact version of 7z.dll library for 7z archives.
7zxa.dll | ~159 - ~212 KB | Compact version of 7z.dll library for extracting from 7z archives.
7z.dll   | ~1.25 - ~1.82 MB | Full 7-Zip engine for work with all available formats.
[hMSBuild.bat](https://github.com/3F/hMSBuild)     | ~18 KB  | hMSBuild to build projects with msbuild tools+ | `hMSBuild -cs -no-less-15`
[netfx4sdk.cmd](https://github.com/3F/netfx4sdk)   | ~11 KB  | netfx4sdk to build on legacy platforms | `netfx4sdk -mode sys-or-pkg` to support netfx4.0 via sys or pkg
[gnt.bat](https://github.com/3F/GetNuTool)         | ~7 KB   | GetNuTool to service NuGet packages including this | `gnt 7z.Libs` to work with the solution level or for manual adding **7z.Libs** etc.
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