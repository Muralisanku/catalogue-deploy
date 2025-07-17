variable "common_tags" {
  default = {
    Project = "roboshop"
    Environment = "dev"
    Terrafrom = "true"
  }
}

variable "tags" {
  default = {
    Component = "catalogue"
  }
}

variable "project_name" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "zone_name" {
  default = "joinaiops.store"
}