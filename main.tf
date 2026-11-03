module "vpc" {
    source = "./modules/vpc"

    region = var.region
}

module "compute" {
    source = "./modules/compute"

    subnet_id = module.vpc.subnet_ids["dev"]

    instances = {
        dev-controlplane-1 = {
            zone = "asia-southeast1-a"
            role = "controlplane"
        }

        dev-worker-1 = {
            zone = "asia-southeast1-b"
            role = "worker"
        }

        dev-worker-2 = {
            zone = "asia-southeast1-c"
            role = "worker"
        }
    }
}