resource "aws_route53_record" "cma_route53_A_record"  {
  zone_id =  var.zone_id
  name    = "cma-app-${var.env}.globalfrontierlink.co.uk"
  type    = "A"
  alias {
    name                   = aws_lb.cma_nlb.dns_name
    zone_id                = aws_lb.cma_nlb.zone_id
    evaluate_target_health = true
  }
  
}
