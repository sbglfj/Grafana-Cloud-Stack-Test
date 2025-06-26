// source: https://registry.terraform.io/providers/grafana/grafana/latest/docs

// Requires access policy token which is referenced below. 
provider "grafana" {
  frontend_o11y_api_access_token = "<Access Token from previous step>"
}

// run terraform import '<stack-slug>:<app-id>' my-app
// Replace and with the appropriate values for your environment.
