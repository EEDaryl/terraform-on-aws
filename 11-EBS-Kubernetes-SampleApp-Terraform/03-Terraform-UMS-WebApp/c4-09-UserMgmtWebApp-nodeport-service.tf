# Resource: Kubernetes Service Manifest (Type: NodePort)
resource "kubernetes_service_v1" "nodeport_service" {
  metadata {
    name = "usermgmt-webapp-nodeport-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment_v1.usermgmt_webapp.spec[0].selector[0].match_labels.app
    }
    port {
      port        = 80
      target_port = 8080
      node_port = 31280
    }

    type = "NodePort"
  }
}

resource "kubernetes_pod" "example" {
  metadata {
    name = "terraform-example"
    labels = {
      app = "MyApp"
    }
  }

  spec {
    container {
      image = "nginx:1.21.6"
      name  = "example"
    }
  }
}