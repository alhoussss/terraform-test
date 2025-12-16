variable "instances" {
  type        = list(string)
  default = ["n2-standard-2", "n2-standard-2"]
  description = "VM ip list"
}

variable "name" {
  type           = string
  description  = "Name for the vpc network"
  default       = "myvpc"
}