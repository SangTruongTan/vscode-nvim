# VSCode Neovim Cheat Sheet

> **Leader Key:** `<Space>` 
> **⚠️ Clipboard Warning:** Shared between VSCode and Neovim - be cautious with sensitive data

## 📚 **Table of Contents**
- [Navigation](#navigation)
- [Insert Mode Navigation](#-insert-mode-navigation)
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
| `%` | Match Brackets | Jump to matching bracket pair |
| `[(` | Previous Bracket | Jump backward to previous `(` |
| `[{` | Previous Brace | Jump backward to previous `{` |
| `])` | Next Bracket | Jump forward to next `)` |
| `]}` | Next Brace | Jump forward to next `}` |
| `j` | Visual Line Down | Move down by visual lines (`gj`) |
| `k` | Visual Line Up | Move up by visual lines (`gk`) |
| `s` | Paragraph Down | Jump to next paragraph (`}`) |
| `S` | Paragraph Up | Jump to previous paragraph (`{`) |

---

## ⌨️ **Insert Mode Navigation**

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl+h` | Move Left | Move cursor left in insert mode |
| `Ctrl+j` | Move Down | Move cursor down in insert mode |
| `Ctrl+k` | Move Up | Move cursor up in insert mode |
| `Ctrl+l` | Move Right | Move cursor right in insert mode |
| `Ctrl+a` | Line Start | Jump to beginning of line in insert mode |
| `Ctrl+e` | Line End | Jump to end of line in insert mode |
| `Ctrl+n` | Next Option | Navigate to next option in autocomplete/popup menus |
| `Ctrl+p` | Previous Option | Navigate to previous option in autocomplete/popup menus |

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
| `gd` | Go to Definition | Jump to symbol definition |
| `gD` | Peek Definition | Open inline definition view |
| `g;` | Jump Back | Move to previous cursor location |
| `g,` | Jump Forward | Move forward in navigation history |
| `<leader>sp` | Search Project | Search in files (with selection) |
| `<leader>st` | Search Text | Search in files |
| `<leader>sf` | Find & Replace | Open find/replace in editor |
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
| `<leader>tc` | Toggle Chat | Show/hide chat panel |
| `<leader>tz` | Toggle Zen Mode | Enter/exit zen mode |
| `<leader>tt` | Theme Selector | Choose VSCode theme |

---

## 🎯 **Project Navigation**

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>pf` | Find File | Quick open file picker |
| `<leader>pp` | Switch Project | Open recent projects |
| `<leader>pt` | Project Tree | Show file explorer |
| `<leader>po` | Open Folder | Open folder dialog |

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
| `<leader>;` | Command Palette | Open VSCode command palette |

---

## 📋 **VSCode Keybindings (keybindings.json)**

| Key | Action | Description |
|-----|--------|-------------|
| `Ctrl+F R` | Find & Replace | Open find/replace dialog |
| `Ctrl+H` | Focus Editor | Focus editor from explorer |
| `Ctrl+K` | Navigate Up | Navigate to upper panel |
| `Ctrl+L` | Navigate Right | Navigate to right panel |
| `Ctrl+J` | Navigate Down | Navigate to lower panel |
| `Ctrl+Shift+J` | Toggle Terminal | Show/hide terminal |
| `Ctrl+Shift+K` | Next Terminal | Focus next terminal tab |
| `Ctrl+Shift+L` | Previous Terminal | Focus previous terminal tab |
| `Ctrl+Shift+W` | Kill Terminal | Close current terminal |
| `Ctrl+Shift+A` | New Terminal | Create new terminal |

---

## 💡 **Tips & Tricks**

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
- `Ctrl+n` / `Ctrl+p` (or arrows) to move in popups/quick picks

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