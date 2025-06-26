# Using a JSON file
resource "grafana_dashboard" "dashboard" {
  provider = grafana.my_stack

  config_json = file("Alloy_Resources-1750952464360.json")
  folder = grafana_folder.<folder-name>.id
}
