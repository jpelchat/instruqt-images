source "googlecompute" "instruqt_image" {
  account_file = "instruqt.json"
  project_id   = "instruqt-jacob"
  source_image = "ubuntu-2204-jammy-v20221101a"
  ssh_username = "packer"
  zone         = "us-central1-a"
  image_name   = "instruqt-image-01"
}

build {
  sources = ["source.googlecompute.instruqt_image"]

  provisioner "shell" {
    inline = ["sudo apt update && sudo apt install fail2ban -y"]
  }

}
