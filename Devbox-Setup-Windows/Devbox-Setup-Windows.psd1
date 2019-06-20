@{

    # Script module or binary module file associated with this manifest.
    RootModule = './Devbox-Setup-Windows.psm1'

    # Version number of this module.
    ModuleVersion = '0.1.0'

    # ID used to uniquely identify this module
    GUID = '5460d6ea-5b6e-466f-afe1-a277fe1061f8'

    # Author of this module
    Author = 'Mathieu Buisson'

    # Description of the functionality provided by this module
    Description = 'This modules provides cmdlets to automate the setup and configuration of a development environment'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules   = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Functions to export from this module
    FunctionsToExport = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = 'DevOps', 'Azure'

            # A URL to the license for this module.
            LicenseUri = 'https://github.com/MathieuBuisson/Devbox-Setup-Windows/blob/master/LICENSE.md'

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/MathieuBuisson/Devbox-Setup-Windows'
        }

    } # End of PrivateData hashtable
}