# VSVim
## Config file for [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim) using [Lua](https://www.lua.org/)

### Installation

#### Automatic Installation (Recommended)

**Linux/MacOS:**
```bash
bash <(curl -s https://raw.githubusercontent.com/SangTruongTan/vscode-nvim/main/installer/install.sh)
```
The installer will ask if you want to automatically merge settings and keybindings.

**Windows (PowerShell):**
```powershell
# Clone the repository first
git clone https://github.com/SangTruongTan/vscode-nvim.git "$env:USERPROFILE\.config\vscode-nvim"

# Run the auto-configuration script
cd "$env:USERPROFILE\.config\vscode-nvim\installer"
.\auto-config.ps1
```

**Manual Method:**
Clone this repo into your `.config` folder and point VSCode Neovim config path to `init.lua`.

#### Post-Installation Steps

1. **Settings**: The installer will automatically merge `setting.json` into your VSCode settings
2. **Keybindings**: The installer will automatically merge `keybindings.json` into your VSCode keybindings  
3. **Update Neovim path**: Modify the `vscode-neovim.neovimExecutablePaths` setting to point to your Neovim installation

**Requirements**:

- Have [Neovim](https://neovim.io/) in your machine.
- Already install [VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim), [Bookmarks](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks), and [Nvim UI Modifier](https://open-vsx.org/extension/JulianIaquinandi/nvim-ui-modifier) extensions in VSCode.

**Important Note**:

⚠️ **Clipboard Warning**: Be aware that when using VSCode Neovim, the clipboard is shared between your device and Neovim. This means that any text copied in Neovim will be available in your system clipboard and vice versa. Be cautious when copying sensitive information.
