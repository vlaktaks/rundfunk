-- Rundfunk theme overrides for Hyprland (Omarchy)
-- Enforces sharp 1px borders, square corners, and restrained accents.

local active_border = "rgba(d6b45aee)"
local inactive_border = "rgba(d6b45a66)"

hl.config({
  general = {
    border_size = 1,
    gaps_in = 5,
    gaps_out = 10,
    col = {
      active_border = active_border,
      inactive_border = inactive_border,
    },
  },

  decoration = {
    rounding = 0,
    active_opacity = 1.0,
    inactive_opacity = 0.94,

    shadow = {
      enabled = true,
      range = 18,
      render_power = 2,
      color = "rgba(07090bcc)",
      color_inactive = "rgba(07090b66)",
    },

    blur = {
      enabled = true,
      size = 6,
      passes = 2,
      noise = 0.02,
      contrast = 1.0,
      brightness = 0.95,
      vibrancy = 0.12,
    },
  },

  group = {
    col = {
      border_active = active_border,
      border_inactive = inactive_border,
    },
  },
})
