#!/usr/bin/env bash
# -----------------------------------------------
# Hyprlock Watchdog
# Wraps hyprlock and restarts it if it crashes.
# If it keeps crashing, suspends the system as a
# safety measure to protect the unlocked session.
# -----------------------------------------------

MAX_RESTARTS=5
RESTART_DELAY=1
CRASH_WINDOW=60 # Reset crash counter if stable for this many seconds

# Don't start if hyprlock is already running
if pidof hyprlock >/dev/null 2>&1; then
  exit 0
fi

crash_count=0

while [ $crash_count -lt $MAX_RESTARTS ]; do
  start_time=$(date +%s)

  hyprlock
  exit_code=$?

  # Exit code 0 = normal unlock by user
  if [ $exit_code -eq 0 ]; then
    exit 0
  fi

  end_time=$(date +%s)
  runtime=$((end_time - start_time))

  # If hyprlock ran for a while before crashing, reset the counter
  # (it was stable, this is likely a new/different issue)
  if [ $runtime -ge $CRASH_WINDOW ]; then
    crash_count=1
  else
    crash_count=$((crash_count + 1))
  fi

  logger -t hyprlock-watchdog "hyprlock crashed with exit code $exit_code after ${runtime}s (crash $crash_count/$MAX_RESTARTS)"
  notify-send -u critical "Lock Screen" "hyprlock crashed (exit $exit_code). Restarting... ($crash_count/$MAX_RESTARTS)"

  sleep $RESTART_DELAY
done

# Exhausted restart attempts — suspend to protect the session
logger -t hyprlock-watchdog "hyprlock crashed $MAX_RESTARTS times in rapid succession. Suspending system."
notify-send -u critical "Lock Screen" "hyprlock keeps crashing. Suspending system for safety."
sleep 2
systemctl suspend
