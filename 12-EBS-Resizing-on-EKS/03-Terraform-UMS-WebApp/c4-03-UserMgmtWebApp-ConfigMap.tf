# Reosurce: Config Map
resource "kubernetes_config_map_v1" "config_map" {
    metadata {
        name = "my-config"
    }

    data = {
        "webappdb.sql" = "${file("${path.module}/webappdb.sql")}"
    }

    binary_data = {
        "my_payload.bin" = "${filebase64("${path.module}/my_payload.bin")}"
    }
}