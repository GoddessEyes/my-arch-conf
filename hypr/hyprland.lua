-- =============================================================================
-- MONITORS
-- =============================================================================

hl.monitor({
    output = "eDP-1",
    mode = "2560x1440@240",
    position = "0x0",
    scale = "1",
})


hl.monitor({
    output = "HDMI-A-1",
    mode = "2560x1440@144",
    position = "2560x0",
    scale = "1",
})


-- =============================================================================
-- AUTOSTART
-- =============================================================================

hl.on("hyprland.start", function()
    -- Portal / D-Bus env first so other apps see Wayland correctly
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")

    -- Desktop chrome
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")

    -- Utilities
    hl.exec_cmd("clipse -listen")
    hl.exec_cmd("tg-ws-proxy")
end)

-- =============================================================================
-- ENVIRONMENT
-- =============================================================================

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- NVIDIA
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")

-- =============================================================================
-- LOOK AND FEEL
-- =============================================================================

-- Layout / gaps / borders
hl.config({
    general = {
        gaps_in = 10,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
})

-- Window decoration
hl.config({
    decoration = {
        rounding = 10,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
})

-- Animations master switch
hl.config({
    animations = {
        enabled = true,
    },
})

-- Layout engines
hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
})

-- Misc compositor behaviour
hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
        on_focus_under_fullscreen = 1,
    },
})

-- Animation curves & leaves
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- =============================================================================
-- INPUT
-- =============================================================================

hl.config({
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:caps_toggle",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
            tap_to_click = false,
        },
    },
    binds = {
        movefocus_cycles_fullscreen = true,
    },
})

-- =============================================================================
-- KEYBINDINGS
-- =============================================================================

-- --- Core window / session ---
hl.bind("SUPER + Return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind("SUPER + M", hl.dsp.exit())


-- --- Window state ---
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("SUPER + T", hl.dsp.group.toggle())

-- --- Apps ---
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("discord"))
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd("telegram-desktop"))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("vivaldi"))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("codium"))
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd("obsidian"))
hl.bind("SUPER + SHIFT + Z", hl.dsp.exec_cmd("zeditor"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("~/.local/share/JetBrains/Toolbox/scripts/idea"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("/opt/Throne/Throne"))

-- --- Screenshots ---
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("flameshot gui"))

-- --- Move window ---
hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "d" }))

-- --- Focus ---
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

-- --- Workspaces ---
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- --- Mouse move / resize ---
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- --- Volume ---
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })

-- --- Brightness ---
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- --- Media playback ---
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- =============================================================================
-- WINDOW RULES
-- =============================================================================

hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})
