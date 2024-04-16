# environments/dev/variables.tf
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name for dev env"
  type = string
}