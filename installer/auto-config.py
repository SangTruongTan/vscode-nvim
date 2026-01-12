#!/usr/bin/env python3
"""
VSCode Neovim Configuration Auto-Installer
Automatically merges settings and keybindings into VSCode configuration files.
"""

import json
import os
import sys
import platform
import shutil
from pathlib import Path
from typing import Dict, Any, List

def get_vscode_config_dir() -> Path:
    """Get VSCode configuration directory based on OS."""
    system = platform.system().lower()

    if system == "windows":
        return Path(os.environ["APPDATA"]) / "Code" / "User"
    elif system == "darwin":  # macOS
        return Path.home() / "Library" / "Application Support" / "Code" / "User"
    else:  # Linux
        return Path.home() / ".config" / "Code" / "User"

def backup_file(file_path: Path) -> Path:
    """Create a backup of existing file."""
    if file_path.exists():
        backup_path = file_path.with_suffix(f"{file_path.suffix}.backup")
        shutil.copy2(file_path, backup_path)
        print(f"✓ Backed up existing file to: {backup_path}")
        return backup_path
    return None

def merge_json_settings(existing: Dict[Any, Any], new_settings: Dict[Any, Any]) -> Dict[Any, Any]:
    """Merge new settings into existing settings."""
    result = existing.copy()

    for key, value in new_settings.items():
        if key in result and isinstance(result[key], dict) and isinstance(value, dict):
            result[key] = merge_json_settings(result[key], value)
        else:
            result[key] = value

    return result

def merge_keybindings(existing: List[Dict[Any, Any]], new_bindings: List[Dict[Any, Any]]) -> List[Dict[Any, Any]]:
    """Merge keybindings, avoiding duplicates."""
    result = existing.copy()

    # Create a set of existing key combinations to avoid duplicates
    existing_keys = {(binding.get("key"), binding.get("command")) for binding in existing}

    for binding in new_bindings:
        key_combo = (binding.get("key"), binding.get("command"))
        if key_combo not in existing_keys:
            result.append(binding)
            existing_keys.add(key_combo)

    return result

def install_settings():
    """Install VSCode settings."""
    config_dir = get_vscode_config_dir()
    settings_file = config_dir / "settings.json"
    source_settings = Path(__file__).parent.parent / "setting.json"

    print(f"Installing settings to: {settings_file}")

    # Load source settings
    if not source_settings.exists():
        print(f"❌ Source settings file not found: {source_settings}")
        return False

    with open(source_settings, 'r', encoding='utf-8') as f:
        new_settings = json.load(f)

    # Load existing settings or create empty dict
    existing_settings = {}
    if settings_file.exists():
        backup_file(settings_file)
        try:
            with open(settings_file, 'r', encoding='utf-8') as f:
                existing_settings = json.load(f)
        except json.JSONDecodeError:
            print("⚠️  Existing settings.json is malformed, creating new one")

    # Merge settings
    merged_settings = merge_json_settings(existing_settings, new_settings)

    # Ensure directory exists
    config_dir.mkdir(parents=True, exist_ok=True)

    # Write merged settings
    with open(settings_file, 'w', encoding='utf-8') as f:
        json.dump(merged_settings, f, indent=4)

    print("✓ Settings installed successfully")
    return True

def install_keybindings():
    """Install VSCode keybindings."""
    config_dir = get_vscode_config_dir()
    keybindings_file = config_dir / "keybindings.json"
    source_keybindings = Path(__file__).parent.parent / "keybindings.json"

    print(f"Installing keybindings to: {keybindings_file}")

    # Load source keybindings
    if not source_keybindings.exists():
        print(f"❌ Source keybindings file not found: {source_keybindings}")
        return False

    with open(source_keybindings, 'r', encoding='utf-8') as f:
        new_keybindings = json.load(f)

    # Load existing keybindings or create empty list
    existing_keybindings = []
    if keybindings_file.exists():
        backup_file(keybindings_file)
        try:
            with open(keybindings_file, 'r', encoding='utf-8') as f:
                existing_keybindings = json.load(f)
        except json.JSONDecodeError:
            print("⚠️  Existing keybindings.json is malformed, creating new one")

    # Merge keybindings
    merged_keybindings = merge_keybindings(existing_keybindings, new_keybindings)

    # Ensure directory exists
    config_dir.mkdir(parents=True, exist_ok=True)

    # Write merged keybindings
    with open(keybindings_file, 'w', encoding='utf-8') as f:
        json.dump(merged_keybindings, f, indent=4)

    print("✓ Keybindings installed successfully")
    return True

def check_extensions():
    """Check if required extensions are installed."""
    required_extensions = [
        "asvetliakov.vscode-neovim",
        "alefragnani.Bookmarks",
        "JulianIaquinandi.nvim-ui-modifier"
    ]

    print("\n📦 Required Extensions:")
    for ext in required_extensions:
        print(f"  - {ext}")

    print("\nPlease make sure these extensions are installed in VSCode.")
    print("You can install them via VSCode Extensions marketplace or using:")
    print("code --install-extension <extension-id>")

def main():
    """Main installation function."""
    print("🚀 VSCode Neovim Configuration Auto-Installer")
    print("=" * 50)

    try:
        # Install settings
        settings_success = install_settings()

        # Install keybindings
        keybindings_success = install_keybindings()

        # Show extension requirements
        check_extensions()

        if settings_success and keybindings_success:
            print("\n✅ Installation completed successfully!")
            print("\n⚠️  Important Notes:")
            print("1. Restart VSCode to apply changes")
            print("2. Make sure Neovim is installed and accessible in PATH")
            print("3. Update the Neovim executable path in settings if needed")
            print("4. Be aware that clipboard is shared between VSCode and Neovim")
        else:
            print("\n❌ Installation completed with errors")
            return 1

    except Exception as e:
        print(f"\n❌ Installation failed: {e}")
        return 1

    return 0

if __name__ == "__main__":
    sys.exit(main())