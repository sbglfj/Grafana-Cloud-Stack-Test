resource "grafana_folder" "Test-Folder-via-Terraform" {
  provider = grafana.my_stack

  title = "Test-Folder-via-Terraform"
}
