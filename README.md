AWS NAT Terraform module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates NAT on AWS.
also support secondary cidr.

These types of resources are supported:

* [NAT]

Terraform versions
------------------

Terraform 0.12.

Usage
------

```hcl
provider "aws" {
  region             = "ap-south-1"
}

module "nat" {
  source             = "../"
  name               = "opstree"
  enable_az_specific = true
  subnets_id         = ["Subnet_id_a", "Subnet_id_b"]

  tags = {
    key1 = "value1"
    key2 = "value2"
  }  
}

```

```
output "ngw_id" {
  value       = aws_nat_gateway.nat-gw.*.id
}

output "nat_ip" {
  value       = aws_eip.nat_ip.*.public_ip
}

```
Tags
----
* Tags are assigned to resources with name variable as prefix.
* Additial tags can be assigned by tags variables as defined above.

Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The sting name append in tags | `string` | `"opstree"` | yes |
| enable_az_specific | Option to create NAT in all AZ | `bool` | `false` | yes |
| subnets_id | The Secondary CIDR block for the VPC. Default value is null  | `list(string)` | `["Subnet_id_a", "Subnet_id_b" ]` | yes |

Output
------
| Name | Description |
|------|-------------|
| nat_id | The id of the NGW attached to VPC |
| nat_ip | The public ip for the NGW attached to VPC |

## Related Projects

Check out these related projects.

- [security_group](https://github.com/OT-CLOUD-KIT/terraform-aws-network-skeleton) - Terraform module for creating dynamic Security 


### Contributors

|  [Nikhil Panchal][nikhil_homepage] |
|---|

  [nikhil_homepage]: https://github.com/pnikk7        
