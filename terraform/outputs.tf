output "alb_dns_name" {
  description = "Load Balancer DNS Name"
  value       = module.ecs.alb_dns_name
}
