## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| assign\_public\_ips\_on\_launch | Assign public IPs on launch for public subnet resources | `bool` | `true` | no |
| eip\_tags | Tags attached to the EIPs | `map(string)` | `{}` | no |
| enable\_dns\_hostnames | Enable DNS hostnames for VPC | `bool` | `true` | no |
| enable\_dns\_support | Enable DNS support for VPC | `bool` | `true` | no |
| internal\_route\_table\_tags | Tags attached to the internal route table | `map(string)` | `{}` | no |
| internal\_subnet\_tags | Additional subnets tags | `map(string)` | `{}` | no |
| internal\_subnets | Subnets configuration | `map(string)` | `{}` | no |
| internet\_gateway\_tags | Tags attached to internet gateway | `map(string)` | `{}` | no |
| nat\_tags | Tags attached to the EIPs | `map(string)` | `{}` | no |
| prefix | Resources prefix | `string` | n/a | yes |
| private\_route\_table\_tags | Tags attached to the private route table | `map(string)` | `{}` | no |
| private\_subnet\_tags | Additional subnets tags | `map(string)` | `{}` | no |
| private\_subnets | Subnets configuration | `map(string)` | `{}` | no |
| public\_route\_table\_tags | Tags attached to the pubic route table | `map(string)` | `{}` | no |
| public\_subnet\_tags | Additional subnets tags | `map(string)` | `{}` | no |
| public\_subnets | Subnets configuration | `map(string)` | `{}` | no |
| subnet\_tags | Additional subnets tags | `map(string)` | `{}` | no |
| tags | Tags attached to all resources | `map(string)` | `{}` | no |
| vpc\_cidr | IP range for the whole VPC | `string` | n/a | yes |
| vpc\_tags | Additional VPC tags | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_internet\_gateway | n/a |
| this\_nat\_gateways | n/a |
| this\_subnets | n/a |
| this\_vpc | n/a |

