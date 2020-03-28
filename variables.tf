variable "tags" {
  type        = map(string)
  description = "Tags attached to all resources"
  default     = {}
}

variable "prefix" {
  type        = string
  description = "Resources prefix"
}

variable "vpc_cidr" {
  type        = string
  description = "IP range for the whole VPC"
}

variable "vpc_tags" {
  type        = map(string)
  description = "Additional VPC tags"
  default     = {}
}

variable "public_subnets" {
  type        = map(string)
  description = "Subnets configuration"
  default     = {}
}

variable "private_subnets" {
  type        = map(string)
  description = "Subnets configuration"
  default     = {}
}

variable "internal_subnets" {
  type        = map(string)
  description = "Subnets configuration"
  default     = {}
}

variable "assign_public_ips_on_launch" {
  type        = bool
  default     = true
  description = "Assign public IPs on launch for public subnet resources"
}

variable "subnet_tags" {
  type        = map(string)
  description = "Additional subnets tags"
  default     = {}
}

variable "public_subnet_tags" {
  type        = map(string)
  description = "Additional subnets tags"
  default     = {}
}

variable "private_subnet_tags" {
  type        = map(string)
  description = "Additional subnets tags"
  default     = {}
}

variable "internal_subnet_tags" {
  type        = map(string)
  description = "Additional subnets tags"
  default     = {}
}

variable "enable_dns_hostnames" {
  type        = bool
  default     = true
  description = "Enable DNS hostnames for VPC"
}

variable "enable_dns_support" {
  type        = bool
  default     = true
  description = "Enable DNS support for VPC"
}

variable "internet_gateway_tags" {
  type        = map(string)
  description = "Tags attached to internet gateway"
  default     = {}
}

variable "public_route_table_tags" {
  type        = map(string)
  description = "Tags attached to the pubic route table"
  default     = {}
}

variable "private_route_table_tags" {
  type        = map(string)
  description = "Tags attached to the private route table"
  default     = {}
}

variable "internal_route_table_tags" {
  type        = map(string)
  description = "Tags attached to the internal route table"
  default     = {}
}

variable "eip_tags" {
  type        = map(string)
  description = "Tags attached to the EIPs"
  default     = {}
}

variable "nat_tags" {
  type        = map(string)
  description = "Tags attached to the EIPs"
  default     = {}
}