# =============================================================================
# SSH CTF Challenge - Base Image
#
# INSTRUCTIONS
#   1. Add any packages your challenge needs to the apt-get install list below.
#   2. Put your challenge-specific setup in the "CHALLENGE SETUP" section.
# =============================================================================

# Minimal Debian base image.
# https://hub.docker.com/_/debian
FROM debian:bookworm-slim

# sshd must run as root to bind to port 22 and manage users/passwords.
# hadolint ignore=DL3002
USER 0:0

# Build-time variables, provided via docker/compose.yml / .env.
ARG USER_NAME="luna"
ARG CTF_FLAG="LUNA{SUDO_SU}"
ARG FLAG_PATH=/root/flag.txt
ARG FLAG_OWNER=root

# Copy the startup script and make it executable.
# Placed before apt so package installs only rebuild when this file changes.
COPY --chmod=0755 entrypoint.sh /entrypoint.sh

# Install the SSH server plus any packages your challenge requires.
# hadolint ignore=DL3008
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        ca-certificates \
        nano \
        openssh-server \
        sudo \
    && rm -rf /var/lib/apt/lists/*

# Remove the baked-in host keys so every container instance generates its own.
RUN rm -f /etc/ssh/ssh_host_*

# Enable password authentication and root login for the challenge.
# The directives may be commented out or set differently in the base image,
# so they are rewritten unconditionally.
RUN sed -ri "s|^#?PermitRootLogin\s+.*|PermitRootLogin yes|" /etc/ssh/sshd_config \
    && sed -ri "s|^#?PasswordAuthentication\s+.*|PasswordAuthentication yes|" /etc/ssh/sshd_config \
    && sed -ri "s|^UsePAM yes|#UsePAM yes|" /etc/ssh/sshd_config

# Trim documentation to keep the image lean for faster instance startup.
RUN rm -rf /usr/share/doc /usr/share/man /var/cache/* /tmp/* /var/tmp/*

# -----------------------------------------------------------------------------
# CHALLENGE SETUP
# Add your own challenge-specific configuration here.
# -----------------------------------------------------------------------------

# Create the login user and drop the flag somewhere it can be found.
RUN useradd -m -u 1000 -s /bin/bash "${USER_NAME}" \
    && echo "${CTF_FLAG}" > "${FLAG_PATH}" \
    && chown "${FLAG_OWNER}:${FLAG_OWNER}" "${FLAG_PATH}" \
    && chmod 700 "${FLAG_PATH}"

EXPOSE 22/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
