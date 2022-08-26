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
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.scheduler_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.scheduler_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_ssm_association.rds-auto_start](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_association) | resource |
| [aws_ssm_association.rds-auto_stop](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_association) | resource |
| [aws_iam_policy_document.assume_scheduler_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.scheduler_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_ssm_document.start_rds_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_document) | data source |
| [aws_ssm_document.stop_rds_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_rds_schedule_expression_start"></a> [rds\_schedule\_expression\_start](#input\_rds\_schedule\_expression\_start) | Define the AWS Systems Manager schedule expression to stop RDS | `string` | `""` | no |
| <a name="input_rds_schedule_expression_stop"></a> [rds\_schedule\_expression\_stop](#input\_rds\_schedule\_expression\_stop) | Define the AWS Systems Manager schedule expression to stop RDS | `string` | `""` | no |
| <a name="input_rds_target_tag_key"></a> [rds\_target\_tag\_key](#input\_rds\_target\_tag\_key) | Targets specify what tags to use, tag all the instances you want State Manager to start and stop RDS | `string` | `""` | no |
| <a name="input_rds_target_tag_value"></a> [rds\_target\_tag\_value](#input\_rds\_target\_tag\_value) | Targets specify what tags to use, tag all the instances you want State Manager to start and stop RDS | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Custom tags on aws resources | `map(any)` | <pre>{<br>  "business-unit": "HQ",<br>  "infrastructure-support": "platforms@digtal.justice.gov.uk",<br>  "is-production": "true",<br>  "team_name": "cloud-platform"<br>}</pre> | no |

## Outputs

No outputs.

<!--- END_TF_DOCS --->

## Reading Material

https://aws.amazon.com/blogs/database/schedule-amazon-rds-stop-and-start-using-aws-systems-manager/
