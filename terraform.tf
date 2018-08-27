data "terraform_remote_state" "infra" {
  backend = "atlas"

  config {
    name = "niccorp/gophersearch-infra"
  }
}

terraform {
  backend "atlas" {
    name = "niccorp/gophersearch-app"
  }
}

provider "kubernetes" {
  host                   = "${data.terraform_remote_state.infra.kube_host}"
  username               = "${data.terraform_remote_state.infra.kube_username}"
  password               = "${data.terraform_remote_state.infra.kube_password}"
  client_certificate     = "${base64decode(data.terraform_remote_state.infra.kube_client_certificate)}"
  client_key             = "${base64decode(data.terraform_remote_state.infra.kube_client_key)}"
  cluster_ca_certificate = "${base64decode(data.terraform_remote_state.infra.kube_cluster_ca_certificate)}"
}
