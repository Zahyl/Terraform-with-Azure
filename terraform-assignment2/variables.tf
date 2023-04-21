variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    Project        = "Automation Project – Assignment 1"
    Name           = "sahil.solanki"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}


