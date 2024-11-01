variable "BeStrong_RG_location" {
  default = "Sweden Central"
}

variable "BeStrong_RG_name" {
  default = "bestrong-rg"
}

variable "sql_admin_user" {
  type    = string
  default = "sqladminuser"
  sensitive = true

}

variable "sql_admin_password" {
  type    = string
  description = "Ferrari0192!"
  default = "Ferrari0192!"
  sensitive = true
}

variable "BeStrong_SA_name" {
  type = string
  default = "bestrongstoracc"
}

variable "tenant_id" {
  type = string
  default = "f128dd7a-1fd1-4e3e-8496-674b767ef552"
}