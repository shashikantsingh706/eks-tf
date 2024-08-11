resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region us-east-1 --name  legacy-imp"
  }
  depends_on = [aws_eks_node_group.nodes_general, aws_eks_cluster.eks_cluster]
}

resource "null_resource" "metrics-server" {
  provisioner "local-exec" {
    command = "kubectl apply -f metric.yaml"
  }
  depends_on = [aws_eks_node_group.nodes_general, aws_eks_cluster.eks_cluster, null_resource.kubectl, null_resource.cert_create]
}

resource "null_resource" "cert_create" {
  provisioner "local-exec" {
    command = "kubectl apply -f certmanage.yaml"
  }
  depends_on = [aws_eks_node_group.nodes_general, aws_eks_cluster.eks_cluster, null_resource.kubectl]
}

resource "time_sleep" "wait" {
  depends_on      = [aws_eks_node_group.nodes_general, aws_eks_cluster.eks_cluster, null_resource.kubectl, null_resource.cert_create, null_resource.metrics-server]
  create_duration = "90s"
}
