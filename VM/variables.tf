variable "number_of_instances" {
  description = "The number of EC2 instances to create"
  default     = 3
}

variable "instance_type" {
  description = "The type of instance to create"
  default     = "t2.medium"
}

variable "instance_name" {
  description = "The base name for the instances"
  default     = "Project"
}

variable "ami_key_pair_name" {
  description = "The key pair name to access the instances"
  default = "Lab"
}