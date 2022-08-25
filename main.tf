
resource "aws_iam_role" "scheduler_role" {
  name               = "cloud-platform--StopStartReboot"
  description        = "Allows AWS Systems Manager to stop and start rds resources"
  assume_role_policy = data.aws_iam_policy_document.assume_scheduler_role.json
  tags               = var.tags
}

data "aws_iam_policy_document" "assume_scheduler_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ssm.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "scheduler_policy" {
  name   = "cloud-platform--StopStartReboot"
  role   = aws_iam_role.scheduler_role.id
  policy = data.aws_iam_policy_document.scheduler_policy.json
}

data "aws_iam_policy_document" "scheduler_policy" {
  statement {
    actions = [
      "rds:Reboot*",
      "rds:Start*",
      "rds:Stop*",
      "rds:Describe*",
    ]

    resources = [
      "*",
    ]
  }
}

data "aws_ssm_document" "stop_rds_doc" {
  name            = "AWS-StopRdsInstance"
  document_format = "JSON"
}

data "aws_ssm_document" "start_rds_doc" {
  name            = "AWS-StartRdsInstance"
  document_format = "JSON"
}

resource "aws_ssm_association" "rds-auto_stop" {
  name             = data.aws_ssm_document.stop_rds_doc.name
  association_name = "StopRebootRDS"

  parameters = {
    AutomationAssumeRole = aws_iam_role.scheduler_role.arn
  }  
  targets {
    key    = "tag:cloud-platform-rds-auto-shutdown"
    values = ["Schedule RDS Stop/Start during non-business hours for cost saving"]
  }
  automation_target_parameter_name = "InstanceId"
  apply_only_at_cron_interval      = true
  schedule_expression              = var.rds_schedule_expression_stop

  max_concurrency = "100"
  max_errors      = "100"

  depends_on = [
    aws_iam_role.scheduler_role
  ]
}

resource "aws_ssm_association" "rds-auto_start" {
  name             = data.aws_ssm_document.start_rds_doc.name
  association_name = "StartRebootRDS"

  parameters = {
    AutomationAssumeRole = aws_iam_role.scheduler_role.arn
  }  
  targets {
    key    = "tag:${var.rds_target_tag_key}"
    values = [var.rds_target_tag_value]
  }
  automation_target_parameter_name = "InstanceId"
  apply_only_at_cron_interval      = true
  schedule_expression              = var.rds_schedule_expression_start

  max_concurrency = "100"
  max_errors      = "100"

  depends_on = [
    aws_iam_role.scheduler_role
  ]
}

