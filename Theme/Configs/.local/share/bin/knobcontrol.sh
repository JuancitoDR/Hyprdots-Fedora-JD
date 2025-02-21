#!/bin/bash

# Escucha el evento del knob (asumiendo /dev/input/event19)
evtest /dev/input/event19 | while read line; do
    # Verifica si el evento corresponde a un aumento de volumen
    if [[ "$line" =~ KEY_VOLUMEUP ]]; then
        pamixer --increase 5  # Incrementar volumen por 5%
    fi

    # Verifica si el evento corresponde a una disminución de volumen
    if [[ "$line" =~ KEY_VOLUMEDOWN ]]; then
        pamixer --decrease 5  # Disminuir volumen por 5%
    fi

    # Verifica si el evento corresponde a mutear
    if [[ "$line" =~ KEY_MUTE ]]; then
        pamixer -t  # Alternar mute
    fi
done

