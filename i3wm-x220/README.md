This is the config used in my thinkpad x220. As this is a pretty old laptop the focus of this rice is to be as minimal and low resource consuming as possible, while being completely usable.

## Laptop specs 
Thinkpad x220 i5-2520m 10gb 256gb which i save from e-waste for 0$

## Tools used

**WM:** i3wm (i want to try out dwm tho)   
**Terminal emulator:** st   
**Compositor:** picom   
**Browser:** LibreWolf   
**Editor:** nvim   
**File explorer:** yazi/thunar   

## i3 window manager keybinds

> **Note:** `$mod = Mod4` (Super / Windows key)


| Keybind                 | Action                                 |
| ----------------------- | -------------------------------------- |
| **Mod + t**             | Open terminal (`st`)                   |
| **Mod + q**             | Kill focused window                    |
| **Mod + Space**         | Toggle focus between tiling / floating |
| **Mod + Shift + Space** | Toggle floating mode                   |
| **Mod + f**             | Toggle fullscreen                      |
| **Mod + a**             | Focus parent container                 |

---

### Window Focus (hjkl + arrows)

| Keybind                 | Action                         |
| ----------------------- | ------------------------------ |
| **Mod + h**             | Focus left                     |
| **Mod + j**             | Focus down                     |
| **Mod + k**             | Focus up                       |
| **Mod + l**             | Focus right                    |
| **Mod + ← / ↓ / ↑ / →** | Focus left / down / up / right |

---

### Move Windows

| Keybind                         | Action                        |
| ------------------------------- | ----------------------------- |
| **Mod + Shift + h**             | Move window left              |
| **Mod + Shift + j**             | Move window down              |
| **Mod + Shift + k**             | Move window up                |
| **Mod + Shift + l**             | Move window right             |
| **Mod + Shift + ← / ↓ / ↑ / →** | Move window (arrow direction) |

---

### Layout & Splits

| Keybind             | Action              |
| ------------------- | ------------------- |
| **Mod + Shift + h** | Split horizontally  |
| **Mod + Shift + v** | Split vertically    |
| **Mod + s**         | Stacked layout      |
| **Mod + w**         | Tabbed layout       |
| **Mod + e**         | Toggle split layout |

---

### Workspaces

| Keybind               | Action                       |
| --------------------- | ---------------------------- |
| **Mod + 1–9**         | Switch to workspace 1–9      |
| **Mod + 0**           | Switch to workspace 10       |
| **Mod + Shift + 1–9** | Move window to workspace 1–9 |
| **Mod + Shift + 0**   | Move window to workspace 10  |

---

### Resize Mode

| Keybind                   | Action               |
| ------------------------- | -------------------- |
| **Mod + r**               | Enter resize mode    |
| **h / l**                 | Shrink / grow width  |
| **j / k**                 | Shrink / grow height |
| **Arrow keys**            | Resize in direction  |
| **Enter / Esc / Mod + r** | Exit resize mode     |

---

### i3 Control

| Keybind             | Action                      |
| ------------------- | --------------------------- |
| **Mod + Shift + c** | Reload config               |
| **Mod + Shift + r** | Restart i3                  |
| **Mod + Shift + e** | Exit i3 (with confirmation) |

---

### Launchers & Media

| Keybind                  | Action          |
| ------------------------ | --------------- |
| **Mod + d**              | Rofi launcher   |
| **Mod + p**              | Launch `pmenu`  |
| **XF86AudioRaiseVolume** | Volume up       |
| **XF86AudioLowerVolume** | Volume down     |
| **XF86AudioMute**        | Toggle mute     |
| **XF86AudioMicMute**     | Toggle mic mute |






