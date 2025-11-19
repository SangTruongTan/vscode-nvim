# VSCode Neovim Cheat Sheet

> **Leader Key:** `<Space>` 
> **⚠️ Clipboard Warning:** Shared between VSCode and Neovim - be cautious with sensitive data

## 📚 **Table of Contents**
- [Navigation](#navigation)
- [File Operations](#file-operations)
- [Buffer/Editor Management](#buffereditor-management)
- [Search & References](#search--references)
- [Git Operations](#git-operations)
- [Code Actions](#code-actions)
- [Folding](#folding)
- [Bookmarks](#bookmarks)
- [Toggle Views](#toggle-views)
- [VSCode Integration](#vscode-integration)
- [Custom Movement](#custom-movement)

---

## 🧭 **Navigation**

| Key | Action | Description |
|-----|--------|-------------|
| `H` | Previous Editor | Navigate to previous tab |
| `L` | Next Editor | Navigate to next tab |
| `<leader>h` | Go to Line Start | Jump to beginning of line (`^`) |
| `<leader>l` | Go to Line End | Jump to end of line (`$`) |
| `<leader>a` | Match Brackets | Jump to matching bracket (`%`) |
| `j` | Visual Line Down | Move down by visual lines (`gj`) |
| `k` | Visual Line Up | Move up by visual lines (`gk`) |
| `s` | Paragraph Down | Jump to next paragraph (`}`) |
| `S` | Paragraph Up | Jump to previous paragraph (`{`) |

---

## 📁 **File Operations**

| Key | Action | Description |
|-----|--------|-------------|
| `<Space>w` | Save File | Save current file |
| `<Space>wa` | Save All | Save all open files |
| `<Space>fs` | Save File | Alternative save command |
| `<Space>fS` | Save All Files | Alternative save all command |
| `<Space>ff` | Format Document | Auto-format current file |
| `<Space>fn` | New File | Create new file |
| `<Space>ft` | Show in Explorer | Reveal file in file explorer |
| `<Space>fr` | Rename File | Rename current file |

---

## 📑 **Buffer/Editor Management**

| Key | Action | Description |
|-----|--------|-------------|
| `<Space>c` | Close Editor | Close current editor/tab |
| `<Space>bc` | Close Editor | Alternative close command |
| `<Space>k` | Close Others | Close all other editors |
| `<Space>bk` | Close Others | Alternative close others command |

---

## 🔍 **Search & References**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>sr` | Find References | Show references to symbol |
| `<leader>sR` | References Sidebar | Show references in sidebar |
| `<leader>sp` | Search Project | Search in files (with selection) |
| `<leader>st` | Search Text | Search in files |
| `<leader>n` | No Highlight | Clear search highlights |

---

## 🌿 **Git Operations**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>gi` | Git Init | Initialize git repository |
| `<leader>gs` | Git Status | Show git status/source control |
| `<leader>gb` | Switch Branch | Checkout/switch git branch |
| `<leader>gd` | Delete Branch | Delete git branch |
| `<leader>gf` | Git Fetch | Fetch from remote |
| `<leader>gp` | Git Pull | Pull from remote |
| `<leader>gg` | Git Graph | Show git graph (GitLens) |

---

## ⚡ **Code Actions**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>i` | Organize Imports | Auto-organize imports |
| `<leader>r` | Quick Fix | Show code actions/quick fixes |
| `<leader>ra` | Refactor Menu | Show refactor options |
| `<leader>rr` | Rename Symbol | Rename symbol/variable |
| `<leader>rd` | Delete Block | Delete current block/function |
| `<leader>rv` | Select Block | Select current block/function |
| `<leader>rh` | Show Hover | Show hover information/documentation |
| `<leader>/` | Toggle Comment | Comment/uncomment selection |

---

## 📂 **Folding**

### With Leader Prefix
| Key | Action | Description |
|-----|--------|-------------|
| `<leader>za` | Toggle Fold | Toggle fold at cursor |
| `<leader>zo` | Open Fold | Open fold at cursor |
| `<leader>zc` | Close Fold | Close fold at cursor |
| `<leader>zO` | Open Recursive | Open fold and all nested folds |
| `<leader>zr` | Open All | Open all folds in file |
| `<leader>zm` | Close All | Close all folds in file |
| `<leader>zb` | Fold Comments | Fold all block comments |
| `<leader>zg` | Fold Regions | Fold all marker regions |
| `<leader>zG` | Open Regions | Open all marker regions |

### Standard Vim Folding
| Key | Action | Description |
|-----|--------|-------------|
| `za` | Toggle Fold | Toggle fold at cursor |
| `zo` | Open Fold | Open fold at cursor |
| `zc` | Close Fold | Close fold at cursor |
| `zO` | Open Recursive | Open fold and all nested folds |
| `zr` | Open All | Open all folds in file |
| `zm` | Close All | Close all folds in file |

---

## 🔖 **Bookmarks**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>m` | Toggle Bookmark | Add/remove bookmark |
| `<leader>mt` | Toggle Bookmark | Alternative toggle command |
| `<leader>ml` | List Bookmarks | Show all bookmarks |
| `<leader>mn` | Next Bookmark | Jump to next bookmark |
| `<leader>mp` | Previous Bookmark | Jump to previous bookmark |

---

## 🎛️ **Toggle Views**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ta` | Toggle Activity Bar | Show/hide activity bar |
| `<leader>ts` | Toggle Sidebar | Show/hide sidebar |
| `<leader>tz` | Toggle Zen Mode | Enter/exit zen mode |
| `<leader>tt` | Theme Selector | Choose VSCode theme |

---

## 🎯 **Project Navigation**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>pf` | Find File | Quick open file picker |
| `<leader>pp` | Switch Project | Open recent projects |
| `<leader>pt` | Project Tree | Show file explorer |

---

## 🔧 **VSCode Integration**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ve` | Focus Editor | Focus on editor area |
| `<leader>vl` | Sidebar Left | Move sidebar to left |
| `<leader>vr` | Sidebar Right | Move sidebar to right |

---

## 🚨 **Error Navigation**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>el` | Error List | Show problems panel |
| `<leader>en` | Next Error | Go to next error/warning |
| `<leader>ep` | Previous Error | Go to previous error/warning |

---

## 🎨 **Special Commands**

| Key | Action | Description |
|-----|--------|-------------|
| `<Space>` | Which Key | Show available commands |
| `<leader><Space>` | Command Palette | Open VSCode command palette |
| `<leader>?` | Search Bindings | Search keybindings |

---

## 📋 **VSCode Keybindings (keybindings.json)**

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl+Alt+J` | Copy Line Down | Duplicate line downward |
| `Ctrl+Alt+K` | Copy Line Up | Duplicate line upward |
| `Ctrl+F F` | Format Document | Auto-format current file |
| `Ctrl+F R` | Find & Replace | Open find/replace dialog |
| `Ctrl+H` | Focus Editor | Focus editor from explorer |
| `Ctrl+K` | Navigate Up | Navigate to upper panel |
| `Ctrl+L` | Navigate Right | Navigate to right panel |
| `Ctrl+J` | Navigate Down | Navigate to lower panel |
| `Ctrl+Shift+J` | Toggle Terminal | Show/hide terminal |

---

## 💡 **Tips & Tricks**

### 🔄 **Which Key Integration**
- Press `<Space>` and wait to see available commands
- Most commands are grouped logically (f=file, g=git, b=buffer, etc.)

### 📋 **Clipboard Behavior**
- Clipboard is shared between VSCode and Neovim
- `unnamedplus` setting enables system clipboard integration
- Be cautious when copying sensitive information

### 🎯 **Navigation Shortcuts**
- Use `H`/`L` for quick tab switching
- Use `s`/`S` for quick paragraph jumping
- Leader+h/l for line start/end movement

### 📁 **File Management**
- `<Space>w` family for all save operations
- `<Space>f` family for file operations
- `<Space>c` family for closing operations

### 🔍 **Search Strategy**
- `<leader>sr` for finding where symbols are used
- `<leader>st` for text search across project
- `<leader>sp` to search for currently selected text

---

## 🎨 **Color Coding Legend**
- 🧭 **Navigation** - Moving around
- 📁 **File Operations** - File management  
- 📑 **Buffers** - Tab/editor management
- 🔍 **Search** - Finding things
- 🌿 **Git** - Version control
- ⚡ **Code** - Refactoring and editing
- 📂 **Folding** - Code folding
- 🔖 **Bookmarks** - Quick navigation marks
- 🎛️ **Toggle** - UI visibility controls