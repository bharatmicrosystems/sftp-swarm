// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("credentials.json")}"
 project     = "playground-s-11-8679b2"
 region      = "europe-west1"
}


resource "google_container_cluster" "sftp-swarm" {
  name               = "sftp-swarm"
  location           = "europe-west1-b"
  initial_node_count = 3

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
	  "https://www.googleapis.com/auth/devstorage.read_only",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      clusname = "sftp-swarm"
    }

    tags = ["clusname", "sftp-swarm"]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}