// source:  https://grafana.com/docs/grafana-cloud/alerting-and-irm/slo/set-up/terraform/
//          (see above link for RBAC roles needed for access policy used by this action)

resource "grafana_slo" "ratio" {
  name        = "HTTP Requests Kubelet Success Rate Indicator"
  description = "99.5% of  Kubelet HTTP Requests are not 5xx errors"
  query {
    ratio {
      success_metric  = "kubelet_http_requests_total{status!~\"5..\"}"
      total_metric    = "kubelet_http_requests_total"
      group_by_labels = ["job", "instance"]
    }
    type = "ratio"
  }
  objectives {
    value  = 0.995
    window = "30d"
  }
   destination_datasource { 
      uid = "grafanacloud-prom" 
  }
  label {
    key   = "team_name"
    value = "k8s-platform"
  }
  label {
    key   = "service_name"
    value = "kubelet"
  }
  alerting {
    fastburn {
      annotation {
        key   = "name"
        value = "SLO Burn Rate Very High"
      }
      annotation {
        key   = "description"
        value = "Error budget is burning too fast"
      }
    }

    slowburn {
      annotation {
        key   = "name"
        value = "SLO Burn Rate High"
      }
      annotation {
        key   = "description"
        value = "Error budget is burning too fast"
      }
    }
  }
}
