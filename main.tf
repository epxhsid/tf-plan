module "vpc" {
  source = "./modules/vpc"

  region = var.region
}

module "compute" {
  source = "./modules/compute"

  instances = {
    dev-controlplane-1 = {
      subnet_id = module.vpc.subnet_ids["dev"]
      zone = "asia-southeast1-a"
      role = "controlplane"
    }

    dev-worker-1 = {
      subnet_id = module.vpc.subnet_ids["dev"]
      zone = "asia-southeast1-b"
      role = "worker"
    }

    dev-worker-2 = {
      subnet_id = module.vpc.subnet_ids["dev"]
      zone = "asia-southeast1-c"
      role = "worker"
    }

    /*
    staging-controlplane-1 = {
        subnet_id = module.vpc.subnet_ids["staging"]
        zone = "asia-southeast1-a"
        role = "controlplane"
    }

    staging-worker-1 = {
        subnet_id = module.vpc.subnet_ids["staging"]
        zone = "asia-southeast1-b"
        role = "worker"
    }

    staging-worker-2 = {
        subnet_id = module.vpc.subnet_ids["staging"]
        zone = "asia-southeast1-c"
        role = "worker"
    }

    
    prod-controlplane-1 = {
        subnet_id = module.vpc.subnet_ids["prod"]
        zone = "asia-southeast1-a"
        role = "controlplane"
    }

    prod-worker-1 = {
        subnet_id = module.vpc.subnet_ids["prod"]
        zone = "asia-southeast1-b"
        role = "worker"
    }

    prod-worker-2 = {
        subnet_id = module.vpc.subnet_ids["prod"]
        zone = "asia-southeast1-c"
        role = "worker"
    }
    */
  }
}