
variable "tags" {
  description = "Custom tags on aws resources"
  type        = map(any)
  default = {
    team_name              = "cloud-platform"
    business-unit          = "HQ"
    is-production          = "true"
    infrastructure-support = "platforms@digtal.justice.gov.uk"
  }
}

variable "rds_schedule_expression_stop" {
  description = "Define the AWS Systems Manager schedule expression to stop RDS"
  type        = string
  default     = "cron(0 20 ? * * *)"
}


variable "rds_schedule_expression_start" {
  description = "Define the AWS Systems Manager schedule expression to stop RDS"
  type        = string
  default     = "cron(0 07 ? * * *)"
}

variable "rds_target_tag_key" {
  description = "Targets specify what tags, tag all the instances you want State Manager to impact with appropriate tags to start and stop RDS"
  type        = string
  default     = "cloud-platform-rds-auto-shutdown"
}


variable "rds_target_tag_value" {
  description = "Targets specify what tags, tag all the instances you want State Manager to impact with appropriate tags to start and stop RDS"
  type        = string
  default     = "Schedule RDS Stop/Start during non-business hours for cost saving"
}