#!/usr/bin/env bash
set -eo pipefail

NVIM_PATH="$(which nvim)"

# Set branch to main unless specified by the user
declare -x VN_BRANCH="${VN_BRANCH:-"main"}"
declare -xr VN_REMOTE="${VN_REMOTE:-SangTruongTan/vscode-nvim.git}"
declare -xr INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

declare -xr VSN_BASE_DIR="${VSN_BASE_DIR:-"$HOME/.config/vscode-nvim"}"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"

function main() {
  check_system_deps
  clone_vscode_nvim

  echo ""
  print_art
  echo ""

  echo -e "${GREEN}Configuration files cloned successfully!${ENDCOLOR}"
  echo ""

  # Ask user if they want automatic configuration
  read -p "Do you want to automatically merge settings and keybindings? (y/N): " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    auto_configure
  else
    manual_instructions
  fi
}

function auto_configure() {
  echo -e "${GREEN}Starting automatic configuration...${ENDCOLOR}"

  if command -v python3 &>/dev/null; then
    echo "Using Python auto-configuration script..."
    python3 "$VSN_BASE_DIR/installer/auto-config.py"
  else
    echo -e "${RED}Python3 not found. Please install Python3 for automatic configuration.${ENDCOLOR}"
    echo "Falling back to manual instructions..."
    manual_instructions
  fi
}

function manual_instructions() {
  echo -e "${YELLOW}Manual Configuration Required:${ENDCOLOR}"
  echo ""
  echo -e "1. Settings: Add content from ${GREEN}$VSN_BASE_DIR/setting.json${ENDCOLOR} to your VSCode settings.json"
  echo -e "2. Keybindings: Add content from ${GREEN}$VSN_BASE_DIR/keybindings.json${ENDCOLOR} to your VSCode keybindings.json"
  echo ""
  echo -e "**Replace:${RED} \"vscode-neovim.neovimExecutablePaths.linux\": \"/path/to/your/nvim\"${ENDCOLOR}"
  echo -e "By:${GREEN} \"vscode-neovim.neovimExecutablePaths.linux\": \"$NVIM_PATH\"${ENDCOLOR}"
  echo ""
  echo -e "${YELLOW}Required Extensions:${ENDCOLOR}"
  echo "  - VSCode Neovim (asvetliakov.vscode-neovim)"
  echo "  - Bookmarks (alefragnani.Bookmarks)"
}

function check_system_deps() {

  if ! command -v git &>/dev/null; then
    print_missing_dep_msg "git"
    exit 1
  fi
  if ! command -v nvim &>/dev/null; then
    print_missing_dep_msg "neovim"
    exit 1
  fi
}

function clone_vscode_nvim() {
  echo "Cloning vscode-nvim"
  if ! git clone --branch "$VN_BRANCH" \
    "https://github.com/${VN_REMOTE}" "$VSN_BASE_DIR"; then
    echo "Failed to clone repository. Installation failed."
    exit 1
  fi
}

function print_art() {
  cat <<'EOF'
  ...   ...   ...
   ... ..... ...
    ..... .....
     ...   ...
      .     .    Thank you for installing vscode-nvim!
EOF
}

main "$@"
