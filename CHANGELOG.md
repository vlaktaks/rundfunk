# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project aims to follow a clear, human-readable changelog practice.

## [Unreleased]

_No unreleased changes documented._

## [1.0.0] - 2026-04-15

### Added
- Initial Rundfunk Omarchy theme implementation for Omarchy 4.5 conventions.
- Dark Japanese cyberpunk color palette (`colors.toml`) with graphite surfaces and restrained cyan/red/magenta accents.
- Sixteen bundled 4K (3840×2160) static wallpapers (`backgrounds/*.jpg`) with matching native one-time intro reveal videos (`backgrounds/intros/*.mp4`, 2560×1440, 30fps, 5.5s, H.264 yuv420p, no audio, identical stems) for Omarchy 4.5 intro support.
- Wallpaper videos sourced from Pixabay and other media platforms (see `ASSETS.md` for inventory and source information where known).
- Hyprland theme overrides (`hyprland.lua`) for sharp 1px borders and square corners (for local/user-owned theme application on 4.5).
- Shell surface styling overrides (`shell.toml`) preserving existing Omarchy top bar layout.
- Theme-scoped gold accent styling (`#D6B45A`) for bar text and supported shell/Hyprland border tokens, with explicit 1px border widths configured for menu, launcher, popups, tooltip, notifications, polkit, and lock surfaces.
- Theme assets/metadata: `keyboard.rgb`, `icons.theme`, `unlock.png`, `preview.png` (README preview), and `preview-unlock.png` (unlock preview asset, faithful copy for native Omarchy convention).
- Repository documentation: `README.md`, `ASSETS.md`, and `AGENTS.md`.
- Repository governance/config: GitHub Actions CI workflow, Dependabot configuration, and CodeRabbit configuration.

### Changed
- Replaced early generated wallpaper experiments with curated, Rundfunk-adapted wallpaper/intro compositions using Omarchy's native one-time intro → matching static wallpaper mechanism (no continuous/looping desktop video playback).
- Integrated eligible owner-supplied source videos into native wallpaper/intro pairs, completing and validating matching stems and resolver behavior.
- Removed exactly three owner-rejected wallpaper/intro pairs after testing: `2-sunset-palm-road` (`51587-465226632.mp4`), `13-velvet-horizon` (`188528-883127082.mp4`), and `14-aurora-veil` (`202495-918066643.mp4`). Remaining wallpapers were not renumbered; original source videos were left untouched.
- Integrated root `preview.png` as the README preview and `preview-unlock.png` as the unlock preview asset (faithful copy of the confirmed preview); preserved the original `Pasted image.png` file unmodified.
- Corrected previously excessive shell/menu/popup-style border thickness by configuring explicit 1px border widths in theme-scoped `shell.toml` (fallback surface widths were the cause).
- Updated documentation to reflect the final 16-pair collection, preview integration, native Omarchy 4.5 behavior/limitations, and factual media-source notes.

### Notes
- **Remaining collection (16 pairs):** `1-sunset-river-valley`, `3-pumpkin-smoke-night`, `4-ocean-horizon-waves`, `5-daemon-sliced-veil`, `6-neon-heartbeat-pulse`, `7-obsidian-nocturne`, `8-ember-cascade`, `9-amber-drift`, `10-abyssal-current`, `11-cobalt-lumina`, `12-gilded-mist`, `15-luminous-drift`, `16-ember-haze`, `17-neon-canopy`, `18-midnight-campfire`, `19-crimson-reverie`.
- **Fresh-install default wallpaper:** `16-ember-haze.jpg` is the preferred default. Omarchy 4.5 selects the initial fallback background by sorted filename when no remembered per-theme selection exists; with preserved filenames, the lexicographically first remaining wallpaper is `10-abyssal-current.jpg`. No supported theme-scoped native override without renaming/duplicating assets or modifying Omarchy internals was identified. Existing users' remembered wallpaper selections are preserved.
- **Omarchy 4.5 git-installed staging:** repo-installed themes do not stage `*.lua` or certain terminal/VS Code config files; `hyprland.lua` behavior overrides apply via local non-git theme copies, while supported `colors.toml`/`shell.toml` tokens, backgrounds/intros, and other staged assets apply in the standard git-install path.
- **Validation (configuration/resolver/log-based):** 16/16 wallpaper-intro pairs present with matching stems and successful native resolver checks; controlled theme-switch logs evidenced intro playback execution/completion for newly verified pairs in prior runs. On-screen visual playback/handoff, border/menu/topbar visual appearance, fresh-install default behavior, and unlock-preview visuals require owner visual confirmation.
