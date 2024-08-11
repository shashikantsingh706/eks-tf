resource "aws_iam_role" "eks_master_role" {
  name               = "axle-images"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_master_role.name
}

resource "aws_eks_cluster" "eks_cluster" {
  name                      = "axle-images"
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllermanager", "scheduler"]
  role_arn                  = aws_iam_role.eks_master_role.arn
  version                   = 1.29

  vpc_config {
    endpoint_private_access = var.cluster_endpoint_private_access
    endpoint_public_access  = var.cluster_endpoint_public_access
    public_access_cidrs     = var.cluster_endpoint_public_access_cidrs
    subnet_ids              = data.aws_subnets.private_subnets.ids

  }
  depends_on = [aws_iam_role_policy_attachment.amazon_eks_cluster_policy, aws_cloudwatch_log_group.eks_cluster_cloudwatch]
}


resource "aws_cloudwatch_log_group" "eks_cluster_cloudwatch" {
  name              = "axle-images-eks-cloudwatch-log-group"
  retention_in_days = 14
}