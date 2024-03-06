# Kubernetes Service Manifest (Type: Load Balancer)
resource "kubernetes_ingress_v1" "ingress" {
  metadata {
    name = "ingress-namedbasedvhost-demo"
    annotations = {
      # Load Balancer Name
      "alb.ingress.kubernetes.io/load-balancer-name" = "ingress-namedbasedvhost-demo"
      # Ingress Core Settings
      "alb.ingress.kubernetes.io/scheme" = "internet-facing"
      # Health Check Settings
      "alb.ingress.kubernetes.io/healthcheck-protocol" =  "HTTP"
      "alb.ingress.kubernetes.io/healthcheck-port" = "traffic-port"
      #Important Note:  Need to add health check path annotations in service level if we are planning to use multiple targets in a load balancer    
      "alb.ingress.kubernetes.io/healthcheck-interval-seconds" = 15
      "alb.ingress.kubernetes.io/healthcheck-timeout-seconds" = 5
      "alb.ingress.kubernetes.io/success-codes" = 200
      "alb.ingress.kubernetes.io/healthy-threshold-count" = 2
      "alb.ingress.kubernetes.io/unhealthy-threshold-count" = 2
      ## SSL Settings
      # Option-1: Using Terraform jsonencode Function
      "alb.ingress.kubernetes.io/listen-ports" = jsonencode([{"HTTPS" = 443}, {"HTTP" = 80}])
      # Option-2: Using Terraform File Function      
      #"alb.ingress.kubernetes.io/listen-ports" = file("${path.module}/listen-ports/listen-ports.json")
      "alb.ingress.kubernetes.io/certificate-arn" =  "${aws_acm_certificate.acm_cert.arn}"
      #"alb.ingress.kubernetes.io/ssl-policy" = "ELBSecurityPolicy-TLS-1-1-2017-01" #Optional (Picks default if not used)    
      # SSL Redirect Setting
      "alb.ingress.kubernetes.io/ssl-redirect" = 443
      # External DNS - For creating a Record Set in Route53
      "external-dns.alpha.kubernetes.io/hostname" = "tfdefault101.stacksimplify.com"
    }    
  }
  spec {
    ingress_class_name = "my-aws-ingress-class" # Ingress Class        
    # Default Rule: Route requests to App3 if the DNS is "tfdefault101.stacksimplify.com"        
    default_backend {
      service {
        name = kubernetes_service_v1.myapp3_np_service.metadata[0].name
        port {
          number = 80
        }
      }
    }

    # Rule-1: Route requests to App1 if the DNS is "tfapp101.stacksimplify.com"
    rule {
      host = "tfapp101.truemekok.online"      
      http {
        path {
          backend {
            service {
              name = kubernetes_service_v1.myapp1_np_service.metadata[0].name
              port {
                number = 80
              }
            }
          }
          path = "/"
          path_type = "Prefix"
        }
      }        
    }

    # Rule-2: Route requests to App2 if the DNS is "tfapp102.stacksimplify.com"
    rule {
      host = "tfapp201.stacksimplify.com"      
      http {
        path {
          backend {
            service {
              name = kubernetes_service_v1.myapp2_np_service.metadata[0].name
              port {
                number = 80
              }
            }
          }
          path = "/"
          path_type = "Prefix"
        }
      }        
    }
  }
}