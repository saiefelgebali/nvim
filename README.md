# Roadmap 

## One Key One Command

Each key must only do one thing, and not many things in different contexts.

For example: <TAB> shouldn't insert a tab in some cases, but complete a snippet in others.

## Gotchas

### Neovim does not register <C-Space>

On macOS, <C-Space> is tricky because it’s commonly captured by macOS for input-source switching, and even when it gets through, terminals often deliver it to apps as NUL (^@), which Neovim treats as <C-@> / <Nul>.

#### How to fix

Go to:

System Settings → Keyboard → Keyboard Shortcuts → Input Sources

Disable the shortcuts that use Ctrl-Space (typically “Select the previous input source” / “Select next source in Input menu”). This is the most common reason Neovim never sees the key.
