# AGENTS.md — Rundfunk Omarchy Theme

This document defines durable instructions for future coding agents and human contributors working in this repository.

## Project purpose

Rundfunk is a complete, distributable **Omarchy theme** (target: Omarchy 4.5) with a dark Japanese cyberpunk / Tokyo-night visual identity. The repository must remain installable from `https://github.com/vlaktaks/rundfunk` and compatible with Omarchy's native theme mechanisms.

## Mandatory inspection before changes

Before changing integration-sensitive code or assets:

1. Inspect the current repository state (`git status`, existing files, docs, workflows).
2. Inspect the installed Omarchy implementation on the target system (e.g. `/usr/share/omarchy/`, theme scripts, stock themes, templates) and prefer observed behavior over assumptions.
3. Read relevant official/manual guidance when available, but treat the installed Omarchy version's behavior as source of truth for compatibility claims.

## Architecture and conventions

- Follow **native Omarchy theme conventions** (theme directory contents, `colors.toml`, `backgrounds/`, intro files, previews/unlock assets, shell/theme overrides as supported).
- Keep theme-specific configuration isolated to this repository/theme directory.
- Avoid copying large portions of Omarchy internal configuration; prefer supported interfaces and templates.
- Preserve the existing Omarchy top bar layout/functionality; adapt colors/styling only where appropriate.
- Do not redesign unrelated desktop components or introduce visual bloat.
- **Omarchy 4.5 git-install staging:** themes installed from a Git repository (directory contains `.git` under `~/.config/omarchy/themes/<name>`) are staged selectively by `omarchy-theme-set`; `*.lua` and `alacritty.toml`, `foot.ini`, `ghostty.conf`, `kitty.conf`, `vscode.json` are not staged for security. Document and design around this constraint; do not bypass it by modifying Omarchy internals or requiring users to disable protections. Prefer `colors.toml` template keys (e.g. `hyprland_active_border`, `hyprland_inactive_border`) and staged files (`shell.toml`, assets, backgrounds/intros) for standard git-based installs.

## Visual and functional requirements

- Dark graphite/charcoal base with restrained neon accents; avoid purple-heavy application theming.
- Window borders: **1px** borders with distinguishable active/inactive colors. On Omarchy 4.5, border colors are provided through supported template/color mechanisms (`colors.toml`, `shell.toml`); compositor decoration such as corner rounding, opacity, shadows, and blur remains Omarchy's own Hyprland configuration and is not overridden by this theme.
- **JetBrainsMono Nerd Font** preferred where supported.
- Bundled static wallpapers (preferably native 3840×2160) selectable via Omarchy's normal wallpaper mechanism, with matching native one-time intros in `backgrounds/intros/` using identical filename stems. Rundfunk uses **static selectable wallpaper images** in `backgrounds/` (no continuously looping desktop videos).
- Each wallpaper may have a matching native intro in `backgrounds/intros/<wallpaper-stem>.<ext>` for Omarchy 4.5's one-time reveal mechanism. Intro videos are short, one-time reveal animations; the final intro frames must match/settle to the corresponding static wallpaper as seamlessly as the native mechanism allows. Use the native Omarchy mechanism (as exemplified by stock themes like Catppuccin). **Never replace this architecture with continuously looping video backgrounds unless the user explicitly requests that in the future.** Verify actual playback/lifecycle on a live system.
- Login/unlock visuals must align with theme where supported, without weakening security or authentication behavior. Do not claim automatic privileged Plymouth/system integration without verification.

## Asset licensing and provenance

- Only include assets that are **legally redistributable** in a public GitHub repository.
- For every bundled wallpaper/third-party asset: verify source, license, redistribution rights, and attribution requirements.
- Record provenance and license details in `ASSETS.md`.
- Do **not** include copyrighted anime screenshots/characters, commercial artwork without redistribution rights, watermarked images, or placeholder wallpapers in releases.

## Security and safety

- Treat installation, theme switching, and scripts as security-sensitive.
- No arbitrary remote code execution, no telemetry, no unnecessary background services, no unnecessary `sudo`.
- Validate/quote paths, handle symlinks and errors safely, avoid destructive file operations.
- Do not overwrite unrelated user files or weaken Omarchy/system security behavior.
- Prefer reversible changes and document any operation that modifies the live system.
- **Updates:** use Omarchy's supported native theme-update mechanism (`omarchy-theme-update` / Extra Themes). Do not introduce custom theme-updater logic without an explicit requirement. Preserve user changes during installs/updates and do not silently overwrite local work. Fresh-install defaults (e.g. initial wallpaper/preview selection) must not override an existing user's remembered choices on update, theme switch, or restart; prefer Omarchy's native per-user state/selection mechanisms.
- **Owner testing:** when requested, keep a local/persistent test installation available for owner evaluation and do not automatically remove or deactivate the owner's test theme. Preserve the development repository and installed test copy as clearly distinguishable.

## Testing and validation

- Perform static validation where feasible: file/structure checks, script linting, YAML/JSON validation, asset/license doc checks, documentation consistency.
- Runtime/visual testing on a live Omarchy desktop must be explicitly authorized before changing the active theme, reloading components, or installing on the user's system.
- Distinguish clearly between static inspection, runtime tests, and visual confirmation in reports.
- Do not claim features or compatibility as tested when they are not.
- **Intro verification:** do not claim intro playback or seamless final-frame handoff is verified without actual on-screen visual evidence. File resolution, format checks, and command success are not sufficient proof of visual playback.

## Documentation

- Keep `README.md`, `CHANGELOG.md`, and `ASSETS.md` accurate and consistent with the actual implementation.
- Document Omarchy 4.5-specific behavior and any known limitations/workarounds (e.g. git-cloned theme staging constraints).
- Do not document unimplemented or untested features as complete.

## Git and review workflow

- `main` is the protected integration branch; implement work on feature branches and submit PRs.
- Unless explicitly authorized, do **not** stage, commit, push, create tags/releases, merge PRs, enable auto-merge, install/apply themes, or modify global/system configuration.
- Never use destructive git operations without explicit authorization; never run `git add .` or `git add -A` when staging is authorized—stage only explicitly approved files.
- Before any authorized commit: inspect status, unstaged diff, staged diff, and exact file scope.
- CI and automated reviews (including CodeRabbit, when available) are required checks; address actionable findings and do not treat reviews as proof of correctness.

## Prohibited actions

- Unnecessary architectural rewrites.
- Destructive changes without authorization.
- Unverified asset redistribution.
- Unrequested global configuration changes.
- Unreviewed changes to installation scripts/workflows.
- False compatibility claims.
- Unnecessary dependencies.

## Release and attribution

- License: **MIT** (preserve license text; maintain appropriate copyright attribution).
- Project author attribution: **J.P. Ramackers** (where appropriate). Do not change repository URL/ownership or rewrite Git history.
- Do not fabricate released versions in the changelog.
