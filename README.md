# Urform

A terraform repository to bring up a planet on a Digital Ocean droplet. The easiest way to run Urbit in the cloud.

## Preparation

1. Download your keyfile from Bridge
2. Make sure you have generated an SSH key on your machine
3. Create a Digital Ocean account, and generate an API key

## Usage

Terraform will create a Digital Ocean instance for you, install Urbit, and initialize your pier with the keyfile you provide. Urbit will run inside of a `screen` session named `urbit`. **Important**: By default, we assume your SSH keys exist at `~/.ssh/id_rsa.pub` and `~/.ssh/id_rsa` - if this isn't true, please see the customization options section below.

1. Clone the repository
2. Install terraform (>= 0.12)
3. `cd terraform; terraform init`
4. `terraform apply`
5. Follow the instructions and wait

### Connecting to the host

You can run `terraform status` to get your droplet IP address. You can connect to your droplet with `ssh root@{IP_ADDRESS}`. If you customized the path to your SSH keys, you should also pass that path with `-i {KEY_PATH}`.

### Connecting to Urbit

First, connect to the host. Second, connect to the running screen session with `screen -r urbit`. Detach from screen with `Ctrl-a d`.

## Custom Options and Defaults

Terraform variables are available for almost everything in this flow.

You can customize any of these variables with `export TF_VAR_{variable_name}={value}` as environment variables, before running `terraform apply`.

| Variable | Default | Notes |
|----------|---------|-------|
| do_token | | [Digital Ocean API Token](https://cloud.digitalocean.com/account/api/tokens) |
| patp | | Your ship's @p |
| region | nyc1 | |
| urbit_version | v0.10.3 | |
| size | s-1vcpu-1gb | |
| ssh_public_key_path | ~/.ssh/id_rsa.pub | |
| ssh_private_key_path | ~/.ssh/id_rsa | |
| keyfile_path | | |  