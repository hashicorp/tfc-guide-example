variable "aws_region" {
  type    = string
  default = "us-west-1"
}

variable "db_table_name" {
  type    = string
  default = "terraform-learnsahahaha"
}

variable "db_read_capacity" {
  type    = number
  default = 1
}

variable "db_write_capacity" {
  type    = number
  default = 1
}

variable "tag_user_name" {
  type = string
}

variable "a_new_variable"{
  default  = "nothing"
}


variable "a_new_variables"{
  default  = "nothings"
}

#this is test text for github
#some more shit i gott try out
