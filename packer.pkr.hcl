source "googlecompute" "instruqt_image" {
  
  # Modify as needed
  project_id   = "instruqt-jacob"
  image_name   = "my-instruqt-image-01"
  source_image = "ubuntu-2204-jammy-v20221101a"
  disk_size    = "10"
  ssh_username = "root"

  # Do not modify
  account_file = "instruqt.json"
  zone         = "europe-west1-b"
}

# Example provisioners
build {
  sources = ["source.googlecompute.instruqt_image"]

  provisioner "file" {
    source = "files/"
    destination = "/root"
  }
  
  provisioner "shell" {
    inline = ["apt update && apt install nginx -y"]
  }

}
