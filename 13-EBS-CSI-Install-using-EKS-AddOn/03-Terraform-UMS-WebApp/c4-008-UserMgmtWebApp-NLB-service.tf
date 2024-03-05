 # Resource: Kubernetes Service Manifest (Type: Network Load Balancer)
 resource "kubernetes_service_v1" "netowkr_lb_service" {
  metadata {
    name = "usermgmt-webapp-network-lb-service"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"  # To create a Network Load Balancer 
    }
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.usermgmt_webapp.spec[0].selector[0].match_labels.app
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}