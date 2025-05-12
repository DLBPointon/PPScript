. "/functions/private/Install-ChocoPrograms.ps1"

<#
    .SYNOPSIS
        An opinionated windows setup script

    .DESCRIPTION
        Written by Damon-Lee Pointon (DLBPointon) - 12/May/2025

        This is a Windows 11 powershell script written to make setup of PC's
        just a bit easier.

        Others are welcome to use it. It will be split into:
        1, General Programs
            - Chrome        --- Google Chrome
            - FanControl    --- Control your fan speeds
            - Files         --- Better File Explorer (Rust)
            - HWiNFO        --- Check your PC
            - Libre Office  --- A great open source Microsoft Office competitor
            - Obsidian      --- Best Note taking app - plugins and generally awesome
            - Spotify       --- Music Streaming
            - Tor           --- Private Browsing
            - VLC           --- Media Viewer
            - WinRAR        --- The mighty WinRAR
            - Zoom          --- You know what Zoom is


        2, Programming Tools
            - VSCodium      --- VSCode without the Microsoft Tracking 'Features'
            - Python3-la... --- The Python programming language - latest v3
            - Rust          --- The Rust programming language
            - Termius       --- A clean SSH terminal
            - Docker Desk...--- Docker Desktop
            - Git           --- Holy Git
   
        3, Gaming Programs
            - Steam         --- It's Steam.
            - EA Store      --- EA
            - Minecraft     --- Blocks and blocks and blocks and...
            - Battle.Net    --- Starcraft baybeee
            - Discord       --- Chat to friends
            - CurseForge    --- Modded Minecraft Launcher
            - PrismLauncher --- Open Source Minecraft Launcher
            - Epic Games    --- Epic Games Launcher

        4, Local Media Management Programs
            - Jellyfin App  --- Jellyfine Media Player
            - Calibre       --- Ebook and comic organiser

        5, Creativity Programs
            - Krita         --- Art program
            - Blockbench    --- Minecraft modding and block creator

        6, Other Stuff...
            - JDownloader2  --- Download from urls
            - Moonlight     --- One is the Streamer
            - Sunshine      --- One is the Server
            - Raspbery Pi...--- Raspberry Pi Imager for imaging raspberry pi's
            - Rufus         --- USB Imager for imaging USBs
            - Tidal         --- HQ alternative to Spotify
            - Firefox       --- Alternative to Chrome

        9, ESSENTIALS (=[1,3])
        0, ALL OF THE ABOVE (=[1,2,3,4,5,6])

    .EXAMPLE
        NOT IN USE YET 'irm https://scripts.pointon-lab.com/ppscript | iex'
        
        USE THIS: Run in Admin Powershell >  ./windev.ps1
#>

function CheckAndInstallChocolatey {
    # Check is chocolatey is already installed
    $is_choco_installed = Get-Command -Name choco install dellcommandupdate.exe -ErrorAction SilentlyContinue

    if ( $is_choco_installed ) {
        Write-Output 'Chocolaty is installed already!'


    } else {
        Write-Output 'Chocolatey is not installed! Auto Installing now...'

        # Install chocolatey from their website
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        Write-Output 'If no errors then Chocolaty is now installed and ready for use.'
    }
}

CheckAndInstallChocolatey
