###################################
# Satori Dataset and Access Rules

resource "satori_dataset" "satori_dataset_definition1" {

  definition {
    name        = "Terraform Tutorial Satori Dataset 1"
    description = "created from satori terraform provider"
    owners      = [data.satori_user.data_steward1.id, data.satori_user.data_steward2.id]

    include_location {
      datastore = var.datastore_id
      location {
        relational_location {
          db     = "db1"
          schema = "schema1"
        }
      }
    }

    include_location {
      datastore = var.datastore_id
      location {
        relational_location {
          db     = "db1"
          schema = "schema2"
        }
      }
    }

    include_location {
      datastore = var.datastore_id
      location {
        relational_location {
          db     = "db1"
          schema = "schema3"
        }
      }
    }

    include_location {
      datastore = var.datastore_id
      location {
        relational_location {
          db     = "db2"
          schema = "schema1"
        }
      }
    }

    include_location {
      datastore = var.datastore_id
      location {
        relational_location {
          db     = "db2"
          schema = "schema2"
        }
      }
    }

  }

  access_control_settings {
    enable_access_control = true
  }

  custom_policy {
  }

  security_policies = var.security_policy_id

}


###################################
# 2. Our New Satori Access Rule

resource "satori_access_rule" "satori_access_rule1" {

  //reference to owning dataset
  parent_data_policy = satori_dataset.satori_dataset_definition1.id

  //granted access level, OWNER, READ_WRITE, READ_ONLY
  access_level = "READ_ONLY"

  //identity can not be changed after creation
  identity {
    type     = "GROUP"
    group_id = satori_directory_group.group1.id
  }

}