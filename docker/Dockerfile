######################## INSTRUCTIONS ############################

# 1. Add any required packages that need install undeer the RUN section
# 2. Add your actual setup in the SETUP section at the bottom



# Use the official Debian slim image for a lean production container.
# https://hub.docker.com/_/debian
# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
FROM debian:bookworm-slim
USER root

ARG CTF_FLAG="LUNA{SUDO_SU}"
ARG FLAG_PATH=/root/flag.txt
ARG FLAG_OWNER=root
ARG USER_NAME="s"

COPY entrypoint.sh /

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
	&& apt-get install -y openssh-server ca-certificates nano \
	sudo # <package_name> e.g. sudo Challenge Specific Packages Required ############################################### \
# Utils
	# && apt-get install -y mc htop iotop ncdu tar zip nano vim bash sudo sed \
# Net utils
	# && apt-get install -y iputils-ping traceroute telnet dnsutils iperf nmap \
# Deleting keys
	&& rm -rf /etc/ssh/ssh_host_dsa* /etc/ssh/ssh_host_ecdsa* /etc/ssh/ssh_host_ed25519* /etc/ssh/ssh_host_rsa* \
# Config SSH
	&& sed -ri "s|^#PermitRootLogin|PermitRootLogin|" /etc/ssh/sshd_config \
	&& sed -i "s|PermitRootLogin without-password|PermitRootLogin yes|" /etc/ssh/sshd_config \
	&& sed -i "s|PermitRootLogin prohibit-password|PermitRootLogin yes|" /etc/ssh/sshd_config \
	&& sed -ri "s|^#?PermitRootLogin\s+.*|PermitRootLogin yes|" /etc/ssh/sshd_config \
	&& sed -ri "s|^#PasswordAuthentication|PasswordAuthentication|" /etc/ssh/sshd_config \
	&& sed -ri "s|^PasswordAuthentication no|PasswordAuthentication yes|" /etc/ssh/sshd_config \
	&& sed -ri "s|UsePAM yes|#UsePAM yes|g" /etc/ssh/sshd_config \
# Folder Data
	&& mkdir -p /data \
# Cleaning
	&& apt-get clean autoclean -y \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/{apt,dpkg,cache,log}/ \
	&& rm -rf /var/lib/apt/lists/*.lz4 \
	&& rm -rf /var/log/* \
	&& rm -rf /tmp/* \
	&& rm -rf /var/tmp/* \
	&& rm -rf /usr/share/doc/ \
	&& rm -rf /usr/share/man/ \
	&& rm -rf $HOME/.cache \
	&& chmod +x /entrypoint.sh


#### CHALLENGE SPECIFIC SETUP #############################

RUN useradd -m -u 1000 -s /bin/bash ${USER_NAME}
RUN chown ${USER_NAME}:${USER_NAME} /home/${USER_NAME} 

# Setup Flag
RUN echo ${CTF_FLAG} > ${FLAG_PATH}
RUN chown ${FLAG_OWNER}:${FLAG_OWNER} ${FLAG_PATH}
RUN chmod 700 ${FLAG_PATH}



EXPOSE 22/tcp
# Run the web service on container startup.
ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/sbin/sshd", "-D"]

# [END cloudrun_helloworld_dockerfile_go]
