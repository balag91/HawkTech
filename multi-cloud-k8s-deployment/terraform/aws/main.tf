provider "aws" {
  region = "us-east-1"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "multi-cloud-eks"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = aws_subnet.eks_subnets[*].id
  }
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}