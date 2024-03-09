# Kubernetes Deployment Manifest
resource "kubernetes_deployment_v1" "myapp3" {
  metadata {
    name = "app3-nginx-deployment"
    labels = {
      app = "app3-nginx"
    }
  } 
 
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "app3-nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "app3-nginx"
        }
      }

      spec {
        container {
          # Custom Requests for Fargate Pods in a Kubernetes Deployment 
          resources {
            requests = {
              "cpu" = "1000m"
              "memory" = "2048Mi" 
            }
            limits = {
              "cpu" = "2000m"
              "memory" = "4096Mi"
            }
          }
          image = "stacksimplify/kubenginx:1.0.0"
          name  = "app3-nginx"
          port {
            container_port = 80
          }
          }
        }
      }
    }
}

