#locals {
#  web_user_data = templatefile("${path.module}/init.ps1", {
#    armor_key = var.armor_key
#    hostnames   = {"dev":"devhost","test":"testhost","prod":"prodhost"}
#  })
#}

#data "null_data_source" "values" {
#  inputs = {
#    pbase = join("", aws_instance.winrm.*.password_data)
#    ptext = rsadecrypt(aws_instance.winrm.*.password_data, file(var.private_key_path))
# value =join("", aws_alb_target_group.lambda[*].arn)
#    }
#}

#locals {
#  pbase = aws_instance.winrm.*.password_data
#  ptext = rsadecrypt(aws_instance.winrm[count.index].password_data, file(var.private_key_path))
#}
