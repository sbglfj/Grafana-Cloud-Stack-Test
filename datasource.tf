resource "grafana_data_source" "<data-source-name>" {
  provider = grafana.my_stack

  type          = "influxdb"
  name          = "<data-source-name>"
  url           = "<data-source-url>"
  username      = "<username>"
  password      = "<password>"
  database_name = "<db-name>"
}
