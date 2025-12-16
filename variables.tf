variable "instances" {
  type        = list(string)
  default = ["n2-standard-2", "n2-standard-2"]
  description = "VM ip list"
}

variable "ip_addresses" {
  type = list(string)
  default = ["192.168.1.1", "192.168.1.2"]
}

variable "name" {
  type        = string
  description = "Name for the vpc network"
  default     = "myvpc"
}