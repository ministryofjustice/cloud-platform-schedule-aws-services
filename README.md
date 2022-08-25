# cloud-platform-terraform-aws-scheduler

[![Releases](https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-aws-scheduler/all.svg?style=flat-square)](https://github.com/ministryofjustice/cloud-platform-terraform-aws-scheduler/releases)

Schedule Amazon RDS stop and start using AWS Systems Manager

## Usage

```
module "aws_scheduler" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-aws-scheduler?ref=1.0"

  rds_schedule_expression_stop   = "cron(0 22 ? * * *)"
  rds_schedule_expression_start  = "cron(0 06 ? * * *)"
  rds_target_tag_key             = "cloud-platform-rds-auto-shutdown"
  rds_target_tag_value           = "Schedule RDS Stop/Start during non-business hours for cost saving"
}
```

<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

No inputs.

## Outputs

No outputs.

<!--- END_TF_DOCS --->

## Tags

Some of the inputs are tags. All infrastructure resources need to be tagged according to the [MOJ techincal guidance](https://ministryofjustice.github.io/technical-guidance/standards/documenting-infrastructure-owners/#documenting-owners-of-infrastructure). The tags are stored as variables that you will need to fill out as part of your module.

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| application |  | string | - | yes |
| business-unit | Area of the MOJ responsible for the service | string | `mojdigital` | yes |
| environment-name |  | string | - | yes |
| infrastructure-support | The team responsible for managing the infrastructure. Should be of the form team-email | string | - | yes |
| is-production |  | string | `false` | yes |
| team_name |  | string | - | yes |
| sqs_name |  | string | - | yes |

## Reading Material

https://aws.amazon.com/blogs/database/schedule-amazon-rds-stop-and-start-using-aws-systems-manager/
