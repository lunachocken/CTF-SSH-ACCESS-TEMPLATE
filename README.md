# SSH Access Template

This template is designed for challenges that require the user to SSH into the machine to run things on the system.

# Template README example

## Configuration

docker/Dockerfile builds the image that is ran by docker in the compose, using args from the compose to build
docker/compose.yml contains the main deployment for docker

### Taskfile.yml

https://taskfile.dev/

This is essentialy a modernised makefile, in which how you might run ``make`` you can run ``task`` to run the default task.

``task`` -> copies the env.example to .env and quits, allowing you to customise the .env before it's using to start the deployment
``task down`` -> stops the containers and removes them
``task pre-commit`` -> (requires taskfile installed) -> Installs pre-commit hooks to .git/ and runs against all files
``task env`` -> simply creates the .env
``task run_detach`` -> starts the stack and detaches the terminal - e.g. closing terminal doesn't exit the containers

### .pre-commit-config.yaml

This file once it's got it's pre-commit hooks installed to the .git folder runs your custom checks as defined in the .pre-commit-config.yaml file

Currently the following checks are:

- Generic cleanup -> trailing-whitespace, end-of-file-fixer, check-yaml (checks yaml is valid) etc
- Bash script tidy with shfmt (shell format) and validate with shellcheck
- Docker validation with hadolint, this validates Dockerfiles


Title: (Delete this line and above)
END TEMPLATE GUIDANCE
Below follows the README outline
========================================================
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


## Author

LunaChocken - Created this template

Replace this section
