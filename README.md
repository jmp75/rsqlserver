# rsqlserver
==========

Sql Server driver  database interface **(DBI)** driver for R. 
This is a DBI-compliant Sql Server driver based on the 
The .NET Framework Data Provider for SQL Server (SqlClient) `System.Data.SqlClient`. 

## Motivation 

The .NET Framework Data Provider for SQL Server (SqlClient) uses its own protocol to communicate with SQL Server. It is lightweight and performs well because it is optimized to access a SQL Server directly without adding an OLE DB or Open Database Connectivity (ODBC) layer.

## Prerequisites and package dependencies 

The `rsqlserver` package uses the .NET framework SDK to build some a small C# project. Typically if you have on your machine the file "C:\Windows\Microsoft.NET\Framework\v4.0.30319\MSBuild.exe", you can skip this paragraph. Otherwise you need to install the [Microsoft Windows SDK for Windows 7 and .NET Framework 4](http://www.microsoft.com/en-us/download/details.aspx?id=8279). An overview of list of Microsoft SDKs is available [here](http://msdn.microsoft.com/en-us/vstudio/hh487283.aspx)

The interoperability of R and .NET code relies on the [rClr](https://github.com/jmp75/rClr) R package. 

## Installation

### Installation of rClr

Unless you are a developer with a clear need and desire to build from source, you are advised to install rClr from the latest installable R package for windows (zip file). Follow the [installation instructions](http://r2clr.codeplex.com/wikipage?title=Installing%20R%20packages&referringTitle=Documentation) and the release notes at the [download page](http://r2clr.codeplex.com/releases/view/112405)

If you are a developer with an existing setup of Visual Studio 2012, (or at least the corresponding build toolchain and C# and C++ compilers), you may try to install it from `github` using the `devtools` package. Whether you use devtools or the command prompt, you should first read the [rClr build documentation](https://r2clr.codeplex.com/wikipage?title=Build%20instructions&referringTitle=Documentation)

```S
require(devtools)
install_github("rClr", 'jmp75', args='--no-test-load')
```

### Installation of rsqlserver

`rsqlserver` is currently available only on github. It is also only available for windows user. A linux version using mono is planned.

You can install it from `github` using the `devtools` package

```S
require(devtools)
install_github('rsqlserver', 'agstudy',args='--no-multiarch')
```

## Features

`rsqlserver` presentes many features:

* fast and easy connection to Sql server.[see benchamrking]
* `dbSendQuery` Querying the data base : low levels functions using sql statement.
* Full DBI compliant: for example Support of Higher level convenient functions :`dbReadTable`,`dbWriteTable`,`dbRemoveTable`,..)
* `dbTransaction`, `dbCommit`, `dbRollback` for **Transaction** management
* `dbCallProc` (in development)  for **Stored procedure** call.
* `dbBulkCopy` using **Bulk Copy** for quickly bulk copying Big data.frame or large files into SQL server tables or views.
* Many DBI extension like `dbGetScalar` , `dbGetNoQuery` , `dbBulkCopy`
* `dbParameter`(coming soon) to handle Transact-SQL named parameters. This will provide better type checking and imporve performance. 

## Benchmarking

You can see `rsqlserver` [benchmarking](https://github.com/agstudy/rsqlserver/wiki/benchmarking) performance  versus  drivers :`RODBC` and `RJDBC.`

## Acknowledgements

I want to thank Jean-Michel Perraud the author of [rClr](http://r2clr.codeplex.com/) package.


[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/02a6e8b8e984a8efdb565750d99a10cf "githalytics.com")](http://githalytics.com/agstudy/rsqlserver)

