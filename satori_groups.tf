
###################################
# A new local Satori Directory Group


resource "satori_directory_group" "group1" {
  name        = "Terraform Tutorial Group 1"
  description = "group 1 created via terraform"

  member {
    type = "USERNAME"
    name = "local_user"
  }

  member {
    type = "IDP_GROUP"
    name = "group_name1"
    #OKTA, AZURE, ONELOGIN
    identity_provider = "OKTA"
  }

  member {
    type = "DB_ROLE"
    name = "role_name"
    #SNOWFLAKE, REDSHIFT, BIGQUERY, POSTGRESQL, ATHENA, MSSQL, SYNAPSE
    data_store_type = "SNOWFLAKE"
  }
}
