variable "subnets_id" {
  type = list(string)
}

variable "name" {
  description = "Name of VPC in which NAT will be created"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "enable_az_specific" {
  description = "enable nat for az specific or not"
  type = bool
}
