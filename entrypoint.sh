#!/usr/bin/env bash
set -euo pipefail

# =============================================================================
# entrypoint.sh - runs on every container start.
# Sets up the SSH runtime, generates host keys (once) and sets the
# password for the challenge user from the environment variables:
#   USER_NAME, USER_PASSWORD
# =============================================================================

echo "[entrypoint] Starting..."

# Directory that sshd requires for privilege separation.
mkdir -p /var/run/sshd

# Sensible defaults when the environment variables are not provided.
USER_NAME="${USER_NAME:-luna}"
USER_PASSWORD="${USER_PASSWORD:-luna}"

# Generate fresh host keys only when none are present yet.
if ls /etc/ssh/ssh_host_* >/dev/null 2>&1; then
  echo "[entrypoint] SSH host keys already present."
else
  echo "[entrypoint] Generating SSH host keys..."
  ssh-keygen -A
fi

# Set the user's password once per container instance.
# (The marker file lives in the writable container layer, so a fresh
#  container re-creates it and applies any new password.)
if [ -f /.ispasswordset ]; then
  echo "[entrypoint] Password already configured."
else
  echo "[entrypoint] Setting password for user '${USER_NAME}'."
  echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd
  touch /.ispasswordset
fi

exec "$@"
