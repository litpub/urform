variable "do_token" {
  type        = string
  description = "Generate a Digital Ocean token from https://cloud.digitalocean.com/account/api/tokens"
}

variable "patp" {
  type        = string
  description = "Your @p value for the ship you are creating without the ~ prefix (e.x. zod)"
}

variable "region" {
  type        = string
  description = "The Digital Ocean region where the ship will be created"
  default     = "nyc1"
}

variable "urbit_version" {
  type        = string
  description = "Version tag for Urbit"
  default     = "v0.10.3"
}

variable "size" {
  type        = string
  description = "The Digital Ocean droplet size used to create your ship"
  default     = "s-1vcpu-1gb"
}

variable "ssh_public_key_path" {
  type        = string
  description = "The local file path to your public SSH key."
  default     = "~/.ssh/id_rsa.pub"
}

variable "ssh_private_key_path" {
  type        = string
  description = "The local file path to your private SSH key"
  default     = "~/.ssh/id_rsa"
}

variable "keyfile_path" {
  type        = string
  description = "The local file path to your ship's keyfile"
}