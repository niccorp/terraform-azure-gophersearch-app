output "gopher_ip" {
  value = "${kubernetes_service.gophersearch.load_balancer_ingress.0.ip}"
}

output "gopher_dns" {
  value = "${dnsimple_record.gophersearch.hostname}"
}