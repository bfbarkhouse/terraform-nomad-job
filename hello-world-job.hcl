job "hello-world-job" {
  region      = "us"
  datacenters = ["bbarkhouse"]
  type        = "service"

  update {
    stagger      = "30s"
    max_parallel = 2
  }

  group "hello-world-group" {
    count = 1

    network {
      port "http" {
        static = 8080
        to     = 80
      }
    }

    service {
      name = "hello-world"
      port = "http"
      check {
        name     = "hello-world"
        type     = "tcp"
        port     = "http"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "hello-world-server-task" {
      driver = "docker"

      config {
        image = "httpd"
        ports = ["http"]
      }

      resources {
        cpu    = 500 # MHz
        memory = 100 # MB
      }
    }
  }
}