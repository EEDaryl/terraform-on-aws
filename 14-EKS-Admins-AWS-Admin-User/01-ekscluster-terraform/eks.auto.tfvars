cluster_name                         = "eksdemo1"
cluster_service_ipv4_cidr            = "172.20.0.0/16"
cluster_version                      = "1.26"
cluster_endpoint_private_access      = true
cluster_endpoint_public_access       = true
cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]
# eks_oidc_root_ca_thumbprint          = ""