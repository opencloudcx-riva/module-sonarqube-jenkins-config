terraform {
  required_providers {
    jenkins = {
      source  = "taiidani/jenkins"
      version = "~> 0.9.0"
    }
  }
}

resource "jenkins_credential_secret_text" "sonarqube-api-key" {
  name   = "sonarqube-api-key"
  secret = var.sonarqube_api_key

  depends_on = [
    sonarqube_webhook.webhook
  ]
}