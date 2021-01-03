resource "aws_iam_user" "dct_corp_aws_aci" {
name = "dct-corp-aws-aci-iam-user"
tags = local.tags
}

resource "aws_iam_access_key" "dct_corp_aws_aci" {
user = aws_iam_user.dct_corp_aws_aci.name
}

resource "aws_iam_group" "dct_corp_aws_aci"
name = "DCTCorpACIGroup"
}

resource "aws_iam_group_membership" "dct_corp_aws_aci" {
name = "DCTCorpACIGroupMembership"
group = aws_iam_group.dct_corp_aws_aci.name
users = [aws_IAM_USER.DCT_CORP_AWS_ACI.NAME]
}

resource "aws_iam_group_policy_attachement" "dct_corp_aws_aci" {
group = aws_iam_group.dct_corp_aws_aci.name
policy_arn = aws_iam_policy.dct_corp_aws_aci.arn
}

resource "aws_iam_policy" "dct_corp_aws_aci" {
name = "dct-corp-aws-aci-iam-policy"

policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "sqs:DeleteMessage",
                "sqs:ListQueues",
                "sqs:GetQueueUrl",
                "sqs:DeleteMessageBatch",
                "sqs:SendMessageBatch",
                "sqs:ReceiveMessage",
                "sqs:SendMessage",
                "sqs:GetQueueAttributes"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

module "module_user" {
    source = "git::github.com/whuandra/module_user.git"
    }
    



