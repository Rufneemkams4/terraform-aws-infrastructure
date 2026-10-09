# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform
resource "aws_instance" "web" {
  ami                                  = "ami-0332d564d76dbd8d6"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1d"
  instance_type                        = "t3.micro"
  key_name                             = "ec2-key"
  security_groups                      = ["launch-wizard-1"]
  subnet_id                            = "subnet-045af0ba2f296b73b"
  tags = {
    Name = "dev-app-server-test"
  }
  tags_all = {
    Name = "dev-app-server"
  }
}
