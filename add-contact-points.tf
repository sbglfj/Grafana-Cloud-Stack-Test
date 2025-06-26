// source:  https://grafana.com/docs/grafana/latest/alerting/set-up/provision-alerting-resources/terraform-provisioning/

  resource "grafana_contact_point" "<terraform_contact_point_name>" {
     name = "My contact point email"

     email {
         addresses               = ["<email_address>"]
     }
 }
