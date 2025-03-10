variable "aws_region" {
  description = "AWS region to deploy the infrastructure"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type for Dash App"
  default     = "t2.medium"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-8637735678"
}

variable "vpc_id" {
  description = "VPC ID for deployment"
  type        = vpc-15627272
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = subnet-2839752
}

variable "security_group_id" {
  description = "Security Group ID for the instance"
  type        = sg-89278752992
}