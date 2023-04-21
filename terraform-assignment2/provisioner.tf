resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command = "wsl ./run_ansible.sh"
  }
}
