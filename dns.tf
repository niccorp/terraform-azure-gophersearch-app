resource "dnsimple_record" "gophersearch" {
  domain = "${var.dnsimple_domain}"
  name   = "app.gophersearch"
  value  = "${kubernetes_service.gophersearch.load_balancer_ingress.0.ip}"
  type   = "A"
  ttl    = 360
}
