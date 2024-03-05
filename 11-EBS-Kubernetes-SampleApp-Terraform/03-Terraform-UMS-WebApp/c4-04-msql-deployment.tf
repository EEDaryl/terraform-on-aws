# Resource: Deployment 
resource "kubernetes_deployment_v1" "mysql_deployment" {
  metadata {
    name = "mysql"
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
      app = "mysql"
      }
    }
    strategy {
      type = "Recreate"
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        container {
          image = "mysql:5.6"
          name  = "mysql"
          port {
            container_port = 3306
            name = "mysql"
          }
          env {
            name = "NYSQL_ROOT_PASSWORD"
            value = "dbpassword11"
          }
          volume_mount {
            name = "mysql-persistent-storage"
            mount_path = "/var/lib/mysql"
          }
          volume_mount {
            name = "useramanagement-dbcreation-script"
            mount_path = "/docker-entrypoint-initdb.d"
          }
          
          }
        }
      }
    }
}