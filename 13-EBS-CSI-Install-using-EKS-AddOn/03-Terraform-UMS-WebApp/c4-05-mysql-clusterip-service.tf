# Resource: MySQL ClusterIP Service
resource "kubernetes_service_v1" "mysql_clusterip_service" {
  metadata {
    name = "mysql"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.mysql_deployment.spec[0].selector[0].match_labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 3306
     # target_port and container_port ignored when cluster_ip = "None"
    }

    type = "ClusterIP"
    cluster_ip = "None"  # This means we are going to use Pod Ip
  }
}