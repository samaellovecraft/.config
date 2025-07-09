$ConfigDir = "$HOME\.config"

# Detect if this script is running under Windows Terminal:
# Windows Terminal sets WT_SESSION to a non-empty GUID when it launches.
if ($env:WT_SESSION) {
    Write-Warning "Cannot configure Windows Terminal while it is running. Please close all instances of WT and run this script again."
}
else {
    Write-Progress "Setting up Windows Terminal configuration..."
    $WTSettings = Join-Path $ConfigDir "WindowsTerminal\settings.json"

    $WTSettingsDestinationPaths = @(
        "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json",
        "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json",
        "$env:LOCALAPPDATA\Microsoft\Windows Terminal\settings.json"
    )

    foreach ($destPath in $WTSettingsDestinationPaths ) {
        # Remove existing settings file/link if any
        if (Test-Path $destPath) {
            Remove-Item $destPath -Force
            Write-Host "Removed existing: $destPath"
            # Create symbolic link from .config/settings.json to the destination path
            try {
                New-Item -ItemType HardLink -Path $destPath -Target $WTSettings
                Write-Host "Created hard link: $WTSettings -> $destPath"
            }
            catch {
                Write-Warning "Failed to link $WTSettings -> $destPath : $_"
            }
        }
    }
}
