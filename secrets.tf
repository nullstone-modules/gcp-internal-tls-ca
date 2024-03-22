resource "google_secret_manager_secret" "private_key" {
  // Valid secret_id: [[a-zA-Z_0-9]+]
  secret_id = "${local.resource_name}_private_key"
  labels    = local.labels

  replication {
    auto { }
  }

  depends_on = [google_project_service.secret_manager]
}

resource "google_secret_manager_secret_version" "private_key" {
  secret      = google_secret_manager_secret.private_key.id
  secret_data = tls_private_key.this.private_key_pem
}
