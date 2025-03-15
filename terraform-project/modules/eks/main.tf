resource "aws_eks_cluster" "name" {
  name=var.env

  access_config {
    authentication_mode = "API"
    bootstrap_cluster_creator_admin_permissions = true 

  }
  role_arn = aws_iam_role.cluster.arn
  version = var.eks_version

  vpc_config {
    subnet_ids = var.subnets
  }
}