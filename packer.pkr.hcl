source "googlecompute" "instruqt_image" {
  account_file = "instruqt.json"
  project_id   = var.project_id
  source_image = var.source_image
  ssh_username = "root"
  zone         = "europe-west1-b"
  image_name   = var.image_name
  disk_size    = var.disk_size
}

build {
  sources = ["source.googlecompute.instruqt_image"]

  provisioner "file" {
    source = "files/"
    destination = "/root/"
  }
  
  provisioner "shell" {
    inline = ["apt update && apt install nginx -y"]
  }

}
