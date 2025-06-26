// source:  https://grafana.com/docs/grafana/latest/alerting/set-up/provision-alerting-resources/terraform-provisioning/

 resource "grafana_message_template" "<terraform_message_template_name>" {
     name = "custom_emails"

     template = <<EOT
 {{ define "custom_email.message" }}
 Lorem ipsum - Custom alert!
 {{ end }}
 EOT
 }
