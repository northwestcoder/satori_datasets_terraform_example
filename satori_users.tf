# We look up 2 users by email and then we can use this data 
# in other areas of terraform

data "satori_user" "data_steward1" {
  email = "datasteward1@yourcompany.com"
}

data "satori_user" "data_steward2" {
  email = "datasteward2@yourcompany.com"
}