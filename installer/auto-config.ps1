# VSCode Neovim Configuration Auto-Installer for Windows
# Automatically merges settings and keybindings into VSCode configuration files.

param(
    [switch]$Force,
    [switch]$Help
)

function Show-Help {
    Write-Host @"
VSCode Neovim Configuration Auto-Installer

Usage: .\auto-config.ps1 [-Force] [-Help]

Options:
  -Force    Overwrite existing configurations without prompting
  -Help     Show this help message

This script will:
1. Backup existing VSCode settings and keybindings
2. Merge new configurations with existing ones
3. Install required settings for VSCode Neovim integration
"@
}

function Get-VSCodeConfigDir {
    return "$env:APPDATA\Code\User"
}

function Backup-File {
    param([string]$FilePath)
    
    if (Test-Path $FilePath) {
        $backupPath = "$FilePath.backup"
        Copy-Item $FilePath $backupPath -Force
        Write-Host "✓ Backed up existing file to: $backupPath" -ForegroundColor Green
        return $backupPath
    }
    return $null
}

function Merge-JsonSettings {
    param(
        [hashtable]$Existing,
        [hashtable]$New
    )
    
    $result = $Existing.Clone()
    
    foreach ($key in $New.Keys) {
        if ($result.ContainsKey($key) -and $result[$key] -is [hashtable] -and $New[$key] -is [hashtable]) {
            $result[$key] = Merge-JsonSettings $result[$key] $New[$key]
        } else {
            $result[$key] = $New[$key]
        }
    }
    
    return $result
}

function Merge-Keybindings {
    param(
        [array]$Existing,
        [array]$New
    )
    
    $result = @($Existing)
    $existingKeys = @{}
    
    # Track existing key combinations
    foreach ($binding in $Existing) {
        $keyCombo = "$($binding.key)-$($binding.command)"
        $existingKeys[$keyCombo] = $true
    }
    
    # Add new bindings that don't conflict
    foreach ($binding in $New) {
        $keyCombo = "$($binding.key)-$($binding.command)"
        if (-not $existingKeys.ContainsKey($keyCombo)) {
            $result += $binding
        }
    }
    
    return $result
}

function Install-Settings {
    $configDir = Get-VSCodeConfigDir
    $settingsFile = Join-Path $configDir "settings.json"
    $sourceSettings = Join-Path (Split-Path $PSScriptRoot -Parent) "setting.json"
    
    Write-Host "Installing settings to: $settingsFile" -ForegroundColor Cyan
    
    # Check if source file exists
    if (-not (Test-Path $sourceSettings)) {
        Write-Host "❌ Source settings file not found: $sourceSettings" -ForegroundColor Red
        return $false
    }
    
    try {
        # Load source settings
        $newSettings = Get-Content $sourceSettings -Raw | ConvertFrom-Json -AsHashtable
        
        # Load existing settings or create empty hashtable
        $existingSettings = @{}
        if (Test-Path $settingsFile) {
            Backup-File $settingsFile
            try {
                $existingSettings = Get-Content $settingsFile -Raw | ConvertFrom-Json -AsHashtable
            } catch {
                Write-Host "⚠️  Existing settings.json is malformed, creating new one" -ForegroundColor Yellow
            }
        }
        
        # Merge settings
        $mergedSettings = Merge-JsonSettings $existingSettings $newSettings
        
        # Ensure directory exists
        if (-not (Test-Path $configDir)) {
            New-Item -ItemType Directory -Path $configDir -Force | Out-Null
        }
        
        # Write merged settings
        $mergedSettings | ConvertTo-Json -Depth 10 | Set-Content $settingsFile -Encoding UTF8
        
        Write-Host "✓ Settings installed successfully" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "❌ Failed to install settings: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

function Install-Keybindings {
    $configDir = Get-VSCodeConfigDir
    $keybindingsFile = Join-Path $configDir "keybindings.json"
    $sourceKeybindings = Join-Path (Split-Path $PSScriptRoot -Parent) "keybindings.json"
    
    Write-Host "Installing keybindings to: $keybindingsFile" -ForegroundColor Cyan
    
    # Check if source file exists
    if (-not (Test-Path $sourceKeybindings)) {
        Write-Host "❌ Source keybindings file not found: $sourceKeybindings" -ForegroundColor Red
        return $false
    }
    
    try {
        # Load source keybindings
        $newKeybindings = Get-Content $sourceKeybindings -Raw | ConvertFrom-Json
        
        # Load existing keybindings or create empty array
        $existingKeybindings = @()
        if (Test-Path $keybindingsFile) {
            Backup-File $keybindingsFile
            try {
                $existingKeybindings = Get-Content $keybindingsFile -Raw | ConvertFrom-Json
            } catch {
                Write-Host "⚠️  Existing keybindings.json is malformed, creating new one" -ForegroundColor Yellow
            }
        }
        
        # Merge keybindings
        $mergedKeybindings = Merge-Keybindings $existingKeybindings $newKeybindings
        
        # Ensure directory exists
        if (-not (Test-Path $configDir)) {
            New-Item -ItemType Directory -Path $configDir -Force | Out-Null
        }
        
        # Write merged keybindings
        $mergedKeybindings | ConvertTo-Json -Depth 10 | Set-Content $keybindingsFile -Encoding UTF8
        
        Write-Host "✓ Keybindings installed successfully" -ForegroundColor Green
        return $true
    } catch {
        Write-Host "❌ Failed to install keybindings: $($_.Exception.Message)" -ForegroundColor Red
        return $false
    }
}

function Show-ExtensionRequirements {
    $requiredExtensions = @(
        "asvetliakov.vscode-neovim",
        "VSpaceCode.whichkey",
        "alefragnani.Bookmarks"
    )
    
    Write-Host "`n📦 Required Extensions:" -ForegroundColor Yellow
    foreach ($ext in $requiredExtensions) {
        Write-Host "  - $ext"
    }
    
    Write-Host "`nPlease make sure these extensions are installed in VSCode." -ForegroundColor Cyan
    Write-Host "You can install them via VSCode Extensions marketplace or using:" -ForegroundColor Cyan
    Write-Host "code --install-extension <extension-id>" -ForegroundColor Gray
}

# Main execution
if ($Help) {
    Show-Help
    exit 0
}

Write-Host "🚀 VSCode Neovim Configuration Auto-Installer" -ForegroundColor Magenta
Write-Host ("=" * 50) -ForegroundColor Gray

try {
    # Install settings
    $settingsSuccess = Install-Settings
    
    # Install keybindings
    $keybindingsSuccess = Install-Keybindings
    
    # Show extension requirements
    Show-ExtensionRequirements
    
    if ($settingsSuccess -and $keybindingsSuccess) {
        Write-Host "`n✅ Installation completed successfully!" -ForegroundColor Green
        Write-Host "`n⚠️  Important Notes:" -ForegroundColor Yellow
        Write-Host "1. Restart VSCode to apply changes"
        Write-Host "2. Make sure Neovim is installed and accessible in PATH"
        Write-Host "3. Update the Neovim executable path in settings if needed"
        Write-Host "4. Be aware that clipboard is shared between VSCode and Neovim"
    } else {
        Write-Host "`n❌ Installation completed with errors" -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "`n❌ Installation failed: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

Write-Host "`nPress any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")