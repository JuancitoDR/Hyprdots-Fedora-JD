#!/usr/bin/env python3
import evdev
import subprocess

device_path = "/dev/input/event19"  # Ajusta según corresponda

try:
    device = evdev.InputDevice(device_path)
    print(f"Listening to {device.name} on {device_path}")

    for event in device.read_loop():
        if event.type == evdev.ecodes.EV_KEY:
            if event.code == evdev.ecodes.KEY_VOLUMEUP and event.value == 1:
                subprocess.run(["pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%"])
            elif event.code == evdev.ecodes.KEY_VOLUMEDOWN and event.value == 1:
                subprocess.run(["pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%"])
            elif event.code == evdev.ecodes.KEY_MUTE and event.value == 1:
                subprocess.run(["pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle"])
except Exception as e:
    print(f"Error: {e}")
