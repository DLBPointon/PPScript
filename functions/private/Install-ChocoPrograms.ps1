function Config-2Hashmap {
    
}

function Get-InstallList {
    param (
        [int]$installoption
    )
    
    $option_2_app = @{
        1 = "general_program"
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

    return "hello"


}

function Install-ChocoPrograms {
    <#

    #>
    param (
        [int]$installoption
    )

    Write-Output "hello"
    $install_list = InstallList -installoption $installoption
}