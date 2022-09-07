from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from thingsiplay.widget import smartbird
import subprocess
import os
from libqtile import hook

mod = "mod4"
terminal = "alacritty"
browser = "firefox"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.run([home])

keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    Key([mod], "m", lazy.screen.next_group(), desc="Cycle to next group"),
    Key([mod], "n", lazy.screen.prev_group(), desc="Cycle to prev group"),

    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Spawn a command using a prompt widget"),
    Key([mod], "d", lazy.spawn("rofi -show run"), desc="Spawn a command using a prompt widget"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "m", lazy.group[browser], desc="Spawn a command using a prompt widget"),

    Key([mod, "control"], "s", lazy.spawn("systemctl poweroff")),
    Key([mod, "control"], "e", lazy.shutdown()),
    Key([mod, "control"], "l", lazy.spawn([ '/home/az/i3lock-color/lock.sh'])),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
]

groups = [Group(i) for i in ["", "", "", "", "", "", "" ,"", " "]]
group_hotkeys = "123456789"

for g, k in zip(groups, group_hotkeys):
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key( [mod], k, lazy.group[g.name].toscreen()),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key( [mod, "shift"], k, lazy.window.togroup(g.name, switch_group=False)),
        ]
    )

# Quickly swap between mail and first windows
keys.extend(
        [
            Key([mod,"shift"], "m", lazy.group[groups[8].name].toscreen()),
            Key([mod,"shift"], "n", lazy.group[groups[0].name].toscreen())
        ]
    )

layouts = [
    layout.Tile(
        border_width=1, 
        border_focus="#00FF00", 
        add_on_top=False, 
        border_on_single=False, 
        ratio=0.5
    ),
    layout.TreeTab(
     fontsize = 10,
     sections = ["First", "Second", "Third", "Fourth"],
     section_fontsize = 10,
     border_width = 2,
     padding_left = 0,
     padding_x = 0,
     padding_y = 5,
     section_top = 10,
     section_bottom = 20,
     level_shift = 8,
     vspace = 3,
     panel_width = 200
     ),
    layout.MonadTall(border_width=1, border_focus="#BF40BF", ratio=0.64),
    layout.Max(),
]

colors = [["#282c34", "#282c34"],
          ["#1c1f24", "#1c1f24"],
          ["#dfdfdf", "#dfdfdf"],
          ["#ff6c6b", "#ff6c6b"],
          ["#98be65", "#98be65"],
          ["#da8548", "#da8548"],
          ["#51afef", "#51afef"],
          ["#c678dd", "#c678dd"],
          ["#46d9ff", "#46d9ff"],
          ["#a9a1e1", "#a9a1e1"]]

catppuccin = {
    "flamingo": "#F2CDCD",
    "mauve": "#DDB6F2",
    "pink": "#F5C2E7",
    "maroon": "#E8A2AF",
    "red": "#F28FAD",
    "peach": "#F8BD96",
    "yellow": "#FAE3B0",
    "green": "#ABE9B3",
    "teal": "#B5E8E0",
    "blue": "000080",
    "sky": "#89DCEB",
    "white": "#D9E0EE",
    "gray0": "#6E6C7E",
    "black1": "#1A1826",
}

widget_defaults = dict(
    font="JetBrainsMono Nerd Font",
    fontsize=13,
    padding=3,
    foreground=catppuccin["black1"],
)
extension_defaults = widget_defaults.copy()


def get_widgets(primary=False):
    widgets = [
        widget.Spacer(length=3, background="#00000000"),
        widget.CurrentLayoutIcon(
            padding=1,
            scale=0.8,
            background=catppuccin["red"],
            custom_icon_paths=["/home/az/.config/qtile/icons/"],
        ),
        widget.CurrentLayout(background=catppuccin["red"]),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["red"],
            background=colors[7],
        ),
        widget.GroupBox(
            highlight_method="line",
            highlight_color = colors[7],
            background=colors[7],
            block_highlight_text_color = "#8b0000",
            hide_unused=False,
        ),
        widget.TextBox(
            text="", padding=0, fontsize=30, foreground=colors[7],
        ),
        widget.WindowName(fontsize=12, foreground=catppuccin["pink"]),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=colors[3],
            background="00000000",
        ),
        smartbird.SmartBird(
            profile = "~/.thunderbird/mbc9sufl.default-release",
            fmt = " {}",
            update_interval = 60,
            foreground=colors[0],
            background=colors[3],
            mouse_callbacks = {
                'Button3':
                lazy.group['0'].dropdown_toggle('thunderbird'),
            },
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["blue"],
            background=colors[3],
        ),
        widget.Volume(
            fmt="墳  ↑",
            mute_command="amixer -D pulse sset Master 25%+",
            foreground=catppuccin["red"],
            background=catppuccin["blue"],
        ),
        widget.Volume(
            fmt=" ↓",
            mute_command="amixer -D pulse sset Master 25%-",
            foreground=catppuccin["red"],
            background=catppuccin["blue"],
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["green"],
            background=catppuccin["blue"],
        ),
        widget.CPU(
            format=" {load_percent:04}%",
            mouse_callbacks={"Button1": lazy.spawn("kitty -e htop")},
            background=catppuccin["green"],
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["peach"],
            background=catppuccin["green"],
        ),
        widget.Clock(format=" %a %d %b %Y, %I:%M", background=catppuccin["peach"]),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["pink"],
            background=catppuccin["peach"],
        ),
        widget.TextBox(
            text="",
            mouse_callbacks={
                "Button1": lazy.spawn("systemctl suspend"),
                "Button2": lazy.spawn("systemctl restart"),
                "Button3": lazy.spawn("systemctl poweroff"),
            },
            background=catppuccin["pink"],
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=30,
            foreground=catppuccin["pink"],
            background="#00000000",
        ),
        widget.Spacer(length=3, background="#00000000"),
    ]
    if primary:
        widgets.insert(-1, widget.Systray())
    return widgets


screens = [
    Screen(
        top=bar.Bar(
            get_widgets(primary=True),
            24,
            background="#00000000",
            margin=[0, 0, 0, 0],
        ),
    )
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True

wl_input_rules = None

wmname = "LG3D"
