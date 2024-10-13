{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 @echo off\
:: Creating Folder for installers\
set installDir=C:\\Installers\
if not exist %installDir% (\
    mkdir %installDir%\
)\
\
:: Installing Visual Studio (Community Edition)\
echo Installing Visual Studio...\
powershell -Command "Invoke-WebRequest -Uri https://aka.ms/vs/17/release/vs_community.exe -OutFile %installDir%\\vs_community.exe"\
echo Instalace Visual Studio...\
%installDir%\\vs_community.exe --quiet --wait --add Microsoft.VisualStudio.Workload.NativeDesktop --add Microsoft.VisualStudio.Workload.ManagedDesktop --includeRecommended\
\
:: Installing HeidiSQL\
echo Installing HeidiSQL...\
powershell -Command "Invoke-WebRequest -Uri https://www.heidisql.com/installers/HeidiSQL_12.5_64_Setup.exe -OutFile %installDir%\\heidisql.exe"\
echo Instalace HeidiSQL...\
start /wait %installDir%\\heidisql.exe /SILENT\
\
:: Installing CMake\
echo Installing CMake...\
powershell -Command "Invoke-WebRequest -Uri https://github.com/Kitware/CMake/releases/download/v3.27.6/cmake-3.27.6-windows-x86_64.msi -OutFile %installDir%\\cmake.msi"\
echo Instalace CMake...\
msiexec /i %installDir%\\cmake.msi /quiet\
\
:: Installing Git\
echo Installing Git...\
powershell -Command "Invoke-WebRequest -Uri https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.1/Git-2.42.0-64-bit.exe -OutFile %installDir%\\git.exe"\
echo Instalace Git...\
start /wait %installDir%\\git.exe /VERYSILENT /NORESTART\
\
:: Installing Docker Desktop\
echo Installing  Docker Desktop...\
powershell -Command "Invoke-WebRequest -Uri https://desktop.docker.com/win/stable/Docker%20Desktop%20Installer.exe -OutFile %installDir%\\dockerdesktop.exe"\
echo Instalace Docker Desktop...\
start /wait %installDir%\\dockerdesktop.exe install\
\
echo Installation completed!\
pause\
}