#!/bin/bash
# entrypoint.sh

ARGS=""

if [ -n "$SERIAL_PORT" ]; then ARGS="$ARGS -p $SERIAL_PORT"; fi
if [ -n "$NODE_IP" ]; then ARGS="$ARGS -ip $NODE_IP"; fi
if [ -n "$NODE_BLE" ]; then ARGS="$ARGS --ble $NODE_BLE"; fi
if [ -n "$LAT" ]; then ARGS="$ARGS -lat $LAT"; fi
if [ -n "$LON" ]; then ARGS="$ARGS -lon $LON"; fi
if [ -n "$RAD" ]; then ARGS="$ARGS -rad $RAD"; fi
if [ "$MC_HEADLESS" = "true" ]; then ARGS="$ARGS --headless"; fi
if [ "$MC_GUIONLY" = "true" ]; then ARGS="$ARGS --guionly"; fi
if [ -n "$MC_MAPTILER_KEY" ]; then ARGS="$ARGS -ak $MC_MAPTILER_KEY"; fi

# Uruchomienie aplikacji z przekazanymi argumentami
exec python meshcore_reachability.py $ARGS
