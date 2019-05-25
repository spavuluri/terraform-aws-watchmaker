# Terraform module to create a Watchmaker Windows Autoscaling Group using a CloudFormation cfn.json
# Assumes that watchmaker-win-autoscale.cfn.json is stored in the same directory as main.tf of the module.

resource "aws_cloudformation_stack" "watchmaker-win-autoscale" {
  template_body = "${file("${path.module}/watchmaker-win-autoscale.template.cfn.yaml")}"

  name               = "${var.Name}"
  capabilities       = "${var.Capabilities}"
  disable_rollback   = "${var.DisableRollback}"
  iam_role_arn       = "${var.IamRoleArn}"
  notification_arns  = "${var.NotificationArns}"
  on_failure         = "${var.OnFailureAction}"
  policy_body        = "${var.PolicyBody}"
  policy_url         = "${var.PolicyUrl}"
  tags               = "${var.StackTags}"
  timeout_in_minutes = "${var.TimeoutInMinutes}"

  parameters = {
    AmiId                       = "${var.AmiId}"
    AppScriptParams             = "${var.AppScriptParams}"
    AppScriptUrl                = "${var.AppScriptUrl}"
    AppVolumeDevice             = "${var.AppVolumeDevice}"
    AppVolumeSize               = "${var.AppVolumeSize}"
    AppVolumeSnapshotId         = "${var.AppVolumeSnapshotId}"
    AppVolumeType               = "${var.AppVolumeType}"
    AsgMetrics                  = "${join(",", var.AsgMetrics)}"
    AsgNotificationTypes        = "${join(",", var.AsgNotificationTypes)}"
    AsgSnsArn                   = "${var.AsgSnsArn}"
    CfnEndpointUrl              = "${var.CfnEndpointUrl}"
    CloudWatchAgentUrl          = "${var.CloudWatchAgentUrl}"
    CloudWatchAppLogs           = "${join(",", var.CloudWatchAppLogs)}"
    DesiredCapacity             = "${var.DesiredCapacity}"
    EbsOptimized                = "${var.EbsOptimized}"
    InstanceRole                = "${var.InstanceRole}"
    InstanceTerminationPolicies = "${join(",", var.InstanceTerminationPolicies)}"
    InstanceType                = "${var.InstanceType}"
    KeyPairName                 = "${var.KeyPairName}"
    LoadBalancerNames           = "${var.LoadBalancerNames}"
    MaxCapacity                 = "${var.MaxCapacity}"
    MinCapacity                 = "${var.MinCapacity}"
    NoPublicIp                  = "${var.NoPublicIp}"
    NoReboot                    = "${var.NoReboot}"
    PatchGroup                  = "${var.PatchGroup}"
    PypiIndexUrl                = "${var.PypiIndexUrl}"
    PythonInstaller             = "${var.PythonInstaller}"
    RootVolumeSize              = "${var.RootVolumeSize}"
    ScaleDownSchedule           = "${var.ScaleDownSchedule}"
    ScaleUpSchedule             = "${var.ScaleUpSchedule}"
    SecurityGroupIds            = "${var.SecurityGroupIds}"
    SubnetIds                   = "${var.SubnetIds}"
    TargetGroupArns             = "${var.TargetGroupArns}"
    ToggleCfnInitUpdate         = "${var.ToggleCfnInitUpdate}"
    ToggleNewInstances          = "${var.ToggleNewInstances}"
    WatchmakerAdminGroups       = "${var.WatchmakerAdminGroups}"
    WatchmakerAdminUsers        = "${var.WatchmakerAdminUsers}"
    WatchmakerBootstrapper      = "${var.WatchmakerBootstrapper}"
    WatchmakerConfig            = "${var.WatchmakerConfig}"
    WatchmakerEnvironment       = "${var.WatchmakerEnvironment}"
    WatchmakerExtraArgs         = "${var.WatchmakerExtraArgs}"
    WatchmakerOuPath            = "${var.WatchmakerOuPath}"
    WatchmakerStandaloneUrl     = "${var.WatchmakerStandaloneUrl}"
    WatchmakerVersion           = "${var.WatchmakerVersion}"
  }
}
