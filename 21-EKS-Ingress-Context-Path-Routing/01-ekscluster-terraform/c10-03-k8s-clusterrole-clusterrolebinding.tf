# Resource: Cluster Role
resource "kubernetes_cluster_role_v1" "eksreadonly_clusterrole" {
  metadata {
    name = "{local.name}-eksreadonly-clusterrole"
  }

  rule {
    api_groups = [""]
    resources  = ["nodes", "namespaces", "pods", "eents", "services"]
    verbs      = ["get", "list"]
  }
  rule {
    api_groups = ["apps"]
    resources = [ "deployments", "daemonsets", "statefulsets", "replicasets" ]
    verbs = [ "get", "list" ]
  }
  rule {
    api_groups = [ "apps" ]
    resources = [ "deployments", "daemonsets", "statefulsets", "replicasets" ]
    verbs = [ "get", "list" ]
  }
  rule {
    api_groups = ["batch"]
    resources = ["jobs"]
    verbs =  ["get", "list"]
  }
}

# Resource: CLuster Role Binding
resource "kubernetes_cluster_role_binding_v1" "eksreadonly_clusterrolebinding" {
  metadata {
    name = "${local.name}-eksreadonly-clusterrolebinidng"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind = "ClusterRole"
    name = kubernetes_cluster_role_v1.eksreadonly_clusterrole.metadata[0].name
  }
  subject {
    kind = "Group"
    name = "eks-readonly-group"
    api_group = "rbac.authorization.k8s.io"
  }
}