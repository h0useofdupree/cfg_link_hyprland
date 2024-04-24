#!/usr/bin/env python3


def parse_scss_colors(scss_file_path):
    colors = {}
    with open(scss_file_path, "r") as file:
        for line in file:
            if ":" in line:
                key, value = line.split(":")
                key = key.strip().replace("$", "")
                value = value.split(";")[0].strip()
                colors[key] = value
    return colors


def generate_kitty_theme(scss_colors):
    kitty_config = {
        "foreground": scss_colors.get("onBackground"),
        "background": scss_colors.get("background"),
        "selection_foreground": scss_colors.get("background"),
        "selection_background": scss_colors.get("onSurface"),
        "url_color": scss_colors.get("primary"),
        "mark1_background": scss_colors.get("primary"),
        "mark2_background": scss_colors.get("secondary"),
        "mark3_background": scss_colors.get("tertiary"),
        "color0": scss_colors.get("surface"),
        "color8": scss_colors.get("surfaceBright"),
        "color1": scss_colors.get("primary"),
        "color2": scss_colors.get("outline"),
        "color3": scss_colors.get("tertiary"),
        "color4": scss_colors.get("onSecondaryContainer"),
        "color5": scss_colors.get("primaryContainer"),
        "color6": scss_colors.get("inversePrimary"),
        "color15": scss_colors.get("onSurfaceVariant"),
    }

    kitty_theme_template = f"""
    #: The basic colors

    foreground                      {kitty_config['foreground']}
    background                      {kitty_config['background']}
    selection_foreground            {kitty_config['selection_foreground']}
    selection_background            {kitty_config['selection_background']}
    url_color                       {kitty_config['url_color']}



    #: OS Window titlebar colors

    wayland_titlebar_color          system
    macos_titlebar_color            system



    #: Colors for marks (marked text in the terminal)

    mark1_foreground black
    mark1_background {kitty_config['mark1_background']}
    mark2_foreground black
    mark2_background {kitty_config['mark2_background']}
    mark3_foreground black
    mark3_background {kitty_config['mark3_background']}


    #: The basic 16 colors

    #: black
    color0 {kitty_config['color0']}
    color8 {kitty_config['color8']}

    #: red
    color1 {kitty_config['color1']}
    color9 {kitty_config['color1']}

    #: green
    color2 {kitty_config['color2']}
    color10 {kitty_config['color2']}

    #: yellow
    color3 {kitty_config['color3']}
    color11 {kitty_config['color3']}

    #: blue
    color4 {kitty_config['color4']}
    color12 {kitty_config['color4']}

    #: magenta
    color5 {kitty_config['color5']}
    color13 {kitty_config['color5']}

    #: cyan
    color6 {kitty_config['color6']}
    color14 {kitty_config['color6']}

    #: white
    color7 {kitty_config['foreground']}
    color15 {kitty_config['color15']}
    """

    kitty_theme_path = "/home/juuls/.config/kitty/generated-theme.conf"
    with open(kitty_theme_path, "w") as f:
        f.write(kitty_theme_template)


scss_colors = parse_scss_colors(
    "/home/juuls/.cache/ags/user/generated/material_colors.scss"
)

generate_kitty_theme(scss_colors)
