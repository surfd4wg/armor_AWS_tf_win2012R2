#output "ip" {
#  value = aws_eip.webserver.public_ip
#   value = aws_eip.webserver.public_ip
#   value = join("", aws_eip.webserver.public_ip.*)
#    value = element(concat(aws_eip.webserver.public_ip.*, [""]), 0)
#}
output "IPAddress-InstanceName" {
  value = [aws_eip.webserver.*.public_ip, "-", aws_instance.winrm.*.tags.Name]
}

output "Admin_Username" {
  value = "Administrator"
}

output "Admin_Password" {
  value = aws_instance.winrm.*.password_data
}

#output "Admin_Password_rsadecrypted" {
#  value = rsadecrypt(aws_instance.winrm.*.password_data, file(var.private_key_path))
#}

#  value = [rsadecrypt(tostring("${aws_instance.winrm.*.password_data}"), file("~/.ssh/surfkeywin.pem"))]

#output "password" {
#  value = ["${rsadecrypt(aws_instance.winrm.*.password_data, file(var.private_key_path))}"]
#  value = ["${aws_instance.winrm.*.tags.Name}", "-", rsadecrypt(aws_instance.winrm.*.password_data, file(var.private_key_path))]
#}

#output "Instructions" {
#  value = "Give the system about 5 minutes to load it's ssh server and armor agent capabilities. Please note that the original password to login and provision the server will be output in the terraform.tfstate file in plain text. Please change the password after deployment."
#}
#output "target_arn" {
# value ="${aws_alb_target_group.lambda[count.index].arn}"
#}
#output "event_bus_arn" {
#    value = element(concat(aws_cloudwatch_event_bus.event_bus.*.arn, [""]), 0)
#}
#output "target_arn" {
# value =join("", aws_alb_target_group.lambda[*].arn)
#}
