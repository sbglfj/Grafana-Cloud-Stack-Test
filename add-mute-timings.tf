// source:  https://grafana.com/docs/grafana/latest/alerting/set-up/provision-alerting-resources/terraform-provisioning/

 resource "grafana_mute_timing" "<terraform_mute_timing_name>" {
     name = "No weekends"

     intervals {
         weekdays = ["saturday", "sunday"]
     }
 }
