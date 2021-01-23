provider "aws" {
  region = "us-east-2"
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"
  
    cluster_name           = "webservers-prod"
    db_remote_state_bucket = "josh-state-files"
    db_remote_state_key    = "prod/services/webserver-cluster/terraform.tfstate"
    
    instance_type = "t2.micro"
    min_size      = 3
    max_size      = 4
}
