# SSH Access Template

This template is designed for challenges that require the user to SSH into the machine to run things on the system.

# Template README example

## Configuration

- `docker/Dockerfile` builds the image that is ran by docker in the compose, using args from the compose to build.
- `docker/compose.yml` contains the main deployment for docker.

Everything you customise lives in the `.env` file, which is created from `env.example` the first time you run ``task``. It is never committed to git. The most common values are:

- `USER_NAME` - the username players will SSH in with
- `USER_PASSWORD` - the password players will SSH in with
- `CTF_FLAG` - the flag, baked into the image at build time
- `FLAG_PATH` / `FLAG_OWNER` - (optional) where the flag is written and who owns it

### Taskfile.yml

https://taskfile.dev/

This is essentially a modernised makefile, in which how you might run ``make`` you can run ``task`` to run the default task.

- ``task`` -> copies the `env.example` to `.env` and quits, allowing you to customise the `.env` before it's used to start the deployment. Run ``task`` again once you've filled it in and it will build and start the stack.
- ``task build`` -> builds the Docker image.
- ``task run_detach`` -> starts the stack and detaches the terminal - e.g. closing the terminal doesn't exit the containers.
- ``task logs`` -> follows the container logs, so you can see what's happening inside.
- ``task down`` -> stops the containers and removes them.
- ``task pre-commit`` -> (requires taskfile installed) installs pre-commit hooks to `.git/` and runs them against all files.

Note: ``task env`` is run automatically by ``task`` and simply creates the `.env` file if it doesn't exist yet.

### .pre-commit-config.yaml

This file, once its pre-commit hooks are installed to the `.git` folder, runs your custom checks as defined in the `.pre-commit-config.yaml` file. The hooks run automatically every time you commit.

Currently the following checks are:

- Generic cleanup -> trailing-whitespace, end-of-file-fixer, check-yaml (checks yaml is valid) etc
- Bash script tidy -> shfmt (shell format) and validate with shellcheck
- Docker validation -> hadolint, which validates Dockerfiles


Title: (Delete this line and above)
END TEMPLATE GUIDANCE
Below follows the README outline
========================================================
# A rushed permission config


## Deployment

### Configuration

All configuration is via the `.env` file (see `env.example`).

- CTF_FLAG
- USER_NAME
- USER_PASSWORD

### Ports

2222: SSH

## Game Details

You may SSH via {instance-ip:2222}

```
ssh {username}@{instance-ip} -p 2222
```

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
