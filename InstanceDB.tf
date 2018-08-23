resource "aws_instance" "instanceDB" {
  ami                         = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type               = "${var.AMI_TYPE}"
  subnet_id                   = "${aws_subnet.main-private-1.id}"
  security_groups             = ["${aws_security_group.DB_sg.id}"]
  key_name                    = "${aws_key_pair.mykeypair.key_name}"
  source_dest_check           = false
  associate_public_ip_address = true

  user_data = <<-EOF
            #!/bin/bash
            sudo apt-get -y update
            sudo apt-get -y install mariadb-server python-pip
            sed -i 's/^bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
            service mysql restart
            EOF

  tags {
    Name = "instanceDB"
  }
}
