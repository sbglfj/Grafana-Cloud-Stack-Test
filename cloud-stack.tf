terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = ">= 2.9.0"
    }
  }
}
// Step 1: Create a stack
provider "grafana" {
  alias = "cloud"
  cloud_access_policy_token = "SBGLFJ-T Cloud Access Policy Token"
}


resource "grafana_cloud_stack" "my_stack" {
  provider = grafana.cloud

  name        = "sbglfj-t"
  slug        = "sbglfj-t"
  region_slug = "us" # Example "us","eu" etc
}

// Step 2: Create a service account and key for the stack
resource "grafana_cloud_stack_service_account" "cloud_sa" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.my_stack.slug

  name        = "GrafanaCloudServiceAccountSBGLFJ-T"
  role        = "Admin"
  is_disabled = false
}

resource "grafana_cloud_stack_service_account_token" "cloud_sa" {
  provider   = grafana.cloud
  stack_slug = grafana_cloud_stack.my_stack.slug

  name               = "terraform serviceaccount key"
  service_account_id = grafana_cloud_stack_service_account.cloud_sa.id
}

// Step 3: Create resources within the stack
provider "grafana" {
  alias = "my_stack"

  url  = grafana_cloud_stack.my_stack.url
  auth = grafana_cloud_stack_service_account_token.cloud_sa.key
}
resource "grafana_folder" "my_folder" {
  provider = grafana.my_stack

  title = "Test Folder"
}
