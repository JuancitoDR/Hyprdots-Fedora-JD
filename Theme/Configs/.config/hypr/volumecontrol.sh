#!/bin/bash

# Script para controlar el volumen basado en eventos
event=$1

case $event in
  "i")
    pactl set-sink-volume @DEFAULT_SINK@ +5%  # Aumentar volumen
    ;;
  "d")
    pactl set-sink-volume @DEFAULT_SINK@ -5%  # Disminuir volumen
    ;;
  "m")
    pactl set-sink-mute @DEFAULT_SINK@ toggle  # Mutear/Desmutear
    ;;
  *)
    echo "Evento no reconocido"
    ;;
esac
