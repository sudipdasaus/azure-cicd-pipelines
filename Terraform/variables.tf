variable "resource_group" {}
variable "SGport" {}
variable "location" {}

variable "app prot" {
    default = "8080"
}

#List data type
variable "my-list" {
    type = list
    default = ["mumbai", "kolkata", "Delhi"]
}

variable "my-list" {
    type = list(number)
    default = ["1", "2", "3"]
}

#MAP data type
variable "virtual_machine_tag" {
  type = map
  default = {
    app = "webmethod"
    environment = "development"
    dept = "Infra"
  }
}