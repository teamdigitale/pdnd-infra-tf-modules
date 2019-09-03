# Existing infrastructure

data "azurerm_resource_group" "rg" {
  name = "${local.azurerm_resource_group_name}"
}

# New infrastructure

# The module dynamically creates only A and CNAME records, as other record
# type still don't support dynamical record value definition (which will
# be instead supported from Terraform 0.12 with loops)

# Name servers for dev.pdnd.italia.it
resource "azurerm_dns_ns_record" "dev_ns_records" {
  name                = "dev"
  zone_name           = "pdnd.italia.it"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  ttl                 = "${var.dns_record_ttl}"

  records = [
    "ns1-03.azure-dns.com",
    "ns2-03.azure-dns.net",
    "ns3-03.azure-dns.org",
    "ns4-03.azure-dns.info"
  ]

  tags = {
    environment = "${var.environment}"
  }
}