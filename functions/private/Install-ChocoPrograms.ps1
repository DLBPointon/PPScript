function Config-2Hashmap {
    $configPath = Join-Path $PSScriptRoot "..\..\config\appllications.json"
    $json = Get-Content -Path $configPath -Raw | ConvertFrom-Json
    $hashmap = @{}
    foreach ($key in $json.PSObject.Properties.Name) {
        $hashmap[$key] = $json.$key
    }
    return $hashmap
}

function Get-InstallList {
    param (
        [int]$installoption
    )
    
    $option_2_app = @{
        1 = "general_programs"
        2 = "programming_tools"
        3 = "Games"
        4 = "media_manager"
        5 = "Creativity"
        6 = "Others"
        7 = ""
        8 = ""
        9 = "Essentials"
        0 = "ALL"
    }

    $application_list = Config-2Hashmap

    if ($installoption -eq 0) {
        return $application_list.Values
    } elseif ($installoption -eq 9) {
        # Essentials = [1, 3] (general_programs + Games)
        return $application_list.Values | Where-Object { $_.category -eq "general_programs" -or $_.category -eq "Games" }
    } else {
        $category = $option_2_app[$installoption]
        return $application_list.Values | Where-Object { $_.category -eq $category }
    }
}

function Install-ChocoPrograms {
    <#

    #>
    param (
        [int]$installoption
    )

    $install_list = Get-InstallList -installoption $installoption

    foreach ($app in $install_list) {
        if ($app.choco -ne "na") {
            Write-Output "Installing $($app.content) via Chocolatey..."
            choco install $app.choco -y
        } else {
            Write-Output "No Chocolatey package available for $($app.content). Please install manually from: $($app.link)"
        }
    }
}