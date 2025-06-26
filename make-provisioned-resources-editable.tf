//  source:  https://grafana.com/docs/grafana/latest/alerting/set-up/provision-alerting-resources/terraform-provisioning/

resource "grafana_contact_point" "my_contact_point" {
  name = "My Contact Point"

  disable_provenance = true
}

resource "grafana_message_template" "custom_notification_template_group" {
  name     = "custom_notification_template_group"
  template = "{{define \"template1\" }}Say{{ end }}{{define \"template2\" }}Hi!{{ end }}"

  disable_provenance = true
}
...
