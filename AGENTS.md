# AGENTS.md — pjnvim

## What this is

A [Nixvim](https://github.com/nix-community/nixvim) Neovim configuration managed purely via Nix.

**All changes are Nix module files under `config/`** — do not write Lua directly unless embedding it via `lib.nixvim.mkRaw` or in Lua-only subdirectories (`snippets/`).

## Repo structure

| Path | Purpose |
|---|---|
| `flake.nix` | Entrypoint; defines flake-parts system, nixvim derivation, dev shell, formatter, pre-commit hooks |
| `config/default.nix` | Top-level Nixvim module; imports all submodules |
| `config/options.nix` | Core `opts` (tabstop, mouse, fold, scroll, spell, etc.) |
| `config/keymaps.nix` | Global keybindings (`<leader>th` toggles inlay hints) |
| `config/languages/` | LSP config (`lsp.nix`), treesitter (`treesitter.nix`), none-ls (`none-ls.nix`), per-language modules in `languages/*.nix` |
| `config/ui/` | Dashboard, which-key, noice, notify, neotest, statuscol, buffers, line, tree, undo, icons, nui, overseer |
| `config/snippets/` | Luasnip Lua snippets under `luasnip/` (tex/beamer, generic, visual, environments) |
| `config/util/` | plenary, helpview, precognition, todo, numbering |
| `config/completions/` | nvim-cmp config |
| `config/formatting/` | conform + indent-blankline |
| `config/diagnostics/` | lsp-lines |
| `config/debugging/` | DAP config (⚠️ **NOT imported** in `default.nix` — add `./debugging` when DAP is wanted) |
| `config/database/` | **Disabled** (commented out in `default.nix`) |

## Useful commands (language/framework-specific, not obvious)

```bash
# Build the neovim derivation
nix build .#editor       # with vim/vi aliases
nix build                 # default package (no aliases)

# Check — validates the nixvim module without building
nix build .#checks.$(nix eval --raw nixpkgs#system).default

# Format all nix files
nix fmt

# Enter dev shell (with pre-commit hooks environment)
nix develop
```

## Pre-commit hooks (managed via `git-hooks.nix`, declared in `flake.nix`)

All hooks run automatically on `git commit` via the dev shell:

| Hook | Scope | What it checks |
|---|---|---|
| `nixfmt` | `*.nix` | Nix formatting |
| `nil` | `*.nix` | Nix language server analysis |
| `statix` | `*.nix` | Nix anti-pattern linting (runs on repo, not per-file) |
| `deadnix` | `*.nix` | Unused Nix binding detection |
| `flake-checker` | `flake.nix`/`flake.lock` | Flake health checks |
| `stylua` | `*.lua` | Lua formatting (respects `.stylua.toml` if present) |

The dev shell (`nix develop` or `.envrc` via direnv) activates these hooks. Without direnv, run `nix develop` before committing.

Pre-commit hooks are the **canonical lint/format** — there is no separate `npm test` or equivalent.

## Environment / setup

- `.envrc` → `use flake` activates direnv with the nix flake dev shell.
- `.gitignore` tracks `.direnv/` but **not** `.envrc` (explicit negation).
- Only target system: `x86_64-linux`.
- No tests exist outside the nixvim module check (`.checks.default`).
- Nixpkgs input tracks `nixpkgs-unstable`.
