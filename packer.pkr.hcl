source "googlecompute" "instruqt_image" {
  account_file = "instruqt.json"
  project_id   = "instruqt-jacob"
  source_image = "ubuntu-2204-jammy-v20221101a"
  ssh_username = "root"
  zone         = "us-central1-a"
  image_name   = "instruqt-image-01"
  disk_size    = "10"
}

build {
  sources = ["source.googlecompute.instruqt_image"]

  provisioner "file" {
    source = "/files/"
    destination = "/tmp"
  }
  
  provisioner "shell" {
    inline = ["apt update && apt install nginx -y"]
  }

}
