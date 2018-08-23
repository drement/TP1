resource "aws_launch_configuration" "example-launchconfig" {
	name_prefix     = "example-launchconfig"
	image_id        = "${lookup(var.AMIS, var.AWS_REGION)}"
	instance_type   = "t2.micro"
	key_name        = "${aws_key_pair.mykeypair.key_name}"
	security_groups = ["${aws_security_group.myinstance.id}"]

	ebs_block_device {
		device_name           = "/dev/xvdb"
		volume_size           = "5"
		volume_type           = "standard"
		delete_on_termination = true
	}

	user_data = <<-EOF
												 #!/bin/bash
												 mkfs.ext4 /dev/xvdb
												 mkdir /www
												 mount -t ext4 /dev/xvdb /www
												 echo -e "${aws_instance.instanceDB.private_ip}\tdbserver" >> /etc/hosts
												 apt-get update
												 apt-get -y install nginx
												 sed -i 's/listen 80 default_server/listen 8080 default_server/g' /etc/nginx/sites-enabled/default
												 MYIP=`ip a | grep "10\.0" | awk '{print $2}'`
												 echo "This is: $MYIP" > /var/www/html/index.html
												 echo 'Cloud course <img src="https://s3.us-east-2.amazonaws.com/dany-bucket-001/cloud_icon.png">' >> /var/www/html/index.html
												 service nginx restart
												 EOF

	lifecycle {
		create_before_destroy = true
	}
}

resource "aws_autoscaling_group" "example-autoscaling" {
	name                      = "example-autoscaling"
	vpc_zone_identifier       = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
	launch_configuration      = "${aws_launch_configuration.example-launchconfig.name}"
	min_size                  = 2
	max_size                  = 2
	health_check_grace_period = 300
	health_check_type         = "ELB"
	load_balancers            = ["${aws_elb.my-elb.name}"]
	force_delete              = true

	tag {
		key                 = "Name"
		value               = "ec2 instance"
		propagate_at_launch = true
	}
}
