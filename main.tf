terraform {
  required_providers {
    jenkins = {
      source  = "taiidani/jenkins"
      version = "~> 0.9.0"
    }
    sonarqube = {
      source  = "jdamata/sonarqube"
      version = "0.0.11"
    }
  }
}

resource "sonarqube_webhook" "webhook" {
  name = "jenkins-webhook"
  url  = "http://jenkins.jenkins.svc.cluster.local:8080/sonarqube-webhook/"
}

resource "jenkins_credential_secret_text" "sonarqube-api-key" {
  name   = "sonarqube-api-key"
  secret = sonarqube_webhook.webhook.id

  depends_on = [
    sonarqube_webhook.webhook
  ]
}

# configure sonarqube server in configuration

# create github application?