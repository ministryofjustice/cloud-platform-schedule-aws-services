
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
  default     = ""
}


variable "rds_schedule_expression_start" {
  description = "Define the AWS Systems Manager schedule expression to stop RDS"
  type        = string
  default     = ""
}

variable "rds_target_tag_key" {
  description = "Targets specify what tags to use, tag all the instances you want State Manager to start and stop RDS"
  type        = string
  default     = ""
}


variable "rds_target_tag_value" {
  description = "Targets specify what tags to use, tag all the instances you want State Manager to start and stop RDS"
  type        = string
  default     = ""
}