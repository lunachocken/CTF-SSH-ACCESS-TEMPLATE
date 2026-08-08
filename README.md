
# SSH Access Template

This template is designed for challenges that require the user to SSH into the machine to run things on the system.

# Template README example

# A rushed permission config


## Deployment

### Configuration 
All configuration is via config vars in compose.yml

CTF_FLAG
USER_NAME
USER_PASSWORD

### Ports

2222: SSH

## Game Details

You may SSH via {instance-ip:port}
Username: {username}
Password: {password}

### Scenario Description

What brings the solver here? Is there some kind of misconfiguration, vulnerable system?
E.g. We've identified a critical vulnerability in this system and would like you to investigate.
E.g. The IT guy who created this challenge was in far too much of a rush and may have left us vulnerable. Please investigate.
E.g. Our packet logs indicate there is some sort of malicious software on this machine.

## Hints

1. A very surface level hint.
2. Build on the first hint
3. Direct Instruction Hint

## Solution

e.g.
- nano /etc/sudoers
- copy the root line and replace root with \<username\>
- Save the file
- ``sudo su``
- ``cat /root/flag.txt``
