module "network" {
  source = "./modules/network"
}

module "database" {
  source      = "./modules/database"
  db_password = var.db_password
}

module "ecs" {
  source          = "./modules/ecs"
  vpc_id         = module.network.vpc_id
  public_subnets  = module.network.public_subnets
  private_subnets = module.network.private_subnets
  db_endpoint     = module.database.db_endpoint
}
