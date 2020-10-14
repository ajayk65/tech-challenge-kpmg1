output "elb_dns" {
  description = "Elastic Load Balancer DNS"
  value       = "${tiers.web.elb_dns}"
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = "${tiers.db.rds_endpoint}"
}
