# ------------------------------------------------------------------------------
# CREATE AND CONFIGURE AWS SERVICES
# ------------------------------------------------------------------------------

provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {}
}

# ------------------------------------------------------------------------------
# Create below Tiers
# ------------------------------------------------------------------------------

module "network" {
  source                = "./tiers/network"
  vpc_cidr              = "${var.vpc_cidr}"
  public_subnet_b_cidr  = "${var.public_subnet_b_cidr}"
  public_subnet_c_cidr  = "${var.public_subnet_c_cidr}"
  private_subnet_b_cidr = "${var.private_subnet_b_cidr}"
  private_subnet_c_cidr = "${var.private_subnet_c_cidr}"
  db_subnet_b_cidr      = "${var.db_subnet_b_cidr}"
  db_subnet_c_cidr      = "${var.db_subnet_c_cidr}"
}

module "web" {
  source           = "./tiers/web"
  public_subnet_b  = "${tiers.web.public_subnet_b}"
  public_subnet_c  = "${tiers.web.public_subnet_c}"
  private_subnet_b = "${tiers.web.private_subnet_b}"
  private_subnet_c = "${tiers.web.private_subnet_c}"
  public_sg        = "${tiers.web.public_sg}"
  private_sg       = "${tiers.web.private_sg}"
}

module "db" {
  source              = "./tiers/db"
  db_subnet_b         = "${tiers.network.db_subnet_b}"
  db_subnet_c         = "${tiers.network.db_subnet_c}"
  db_security_group   = "${tiers.network.private_sg}"
  username            = "${var.username}"
  password            = "${var.password}"
  instance_class      = "${var.instance_class}"
  multi_az            = "${var.multi_az}"
  allocated_storage   = "${var.allocated_storage}"
  skip_final_snapshot = "${var.skip_final_snapshot}"
}
