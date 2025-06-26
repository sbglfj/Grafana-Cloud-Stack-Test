// source:  https://grafana.com/docs/grafana/latest/alerting/set-up/provision-alerting-resources/terraform-provisioning/

resource "grafana_notification_policy" "my_policy_tree" {
contact_point = grafana_contact_point.<terraform_contact_point_name>.name
...

policy {
    contact_point = grafana_contact_point.<terraform_contact_point_name>.name

    matcher {...}

    mute_timings = [grafana_mute_timing.<terraform_mute_timing_name>.name]
}
}
