provider "aws" {
  region = "us-east-1"
}

# Data source to get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Data source to get the latest Ubuntu AMI
data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = ["amazon"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }
}


# Create a new security group
resource "aws_security_group" "TF_SG" {
  name = "TG Security Group"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 25
    to_port     = 25
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 465
    to_port     = 465
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 10000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TF-Security-Group"
  }
}

resource "aws_instance" "ec2_instance" {
  count         = var.number_of_instances
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = var.instance_type
  key_name      = var.ami_key_pair_name
  security_groups = [aws_security_group.TF_SG.name]
  tags = {
    Name = "${var.instance_name}-${count.index + 1}"  # Append unique index to instance name
  }

  root_block_device {
    volume_size = 25  # Set the storage size to 25 GiB
  }
}

resource "null_resource" "disable_strict_host_key_checking" {
  count = var.number_of_instances

  connection {
    type        = "ssh"
    host        = aws_instance.ec2_instance[count.index].public_ip
    user        = "ubuntu"
    private_key = file("/home/ubuntu/VM/Lab.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p ~/.ssh",
      "echo 'Host *' >> ~/.ssh/config",
      "echo '  StrictHostKeyChecking no' >> ~/.ssh/config",
      "echo '  UserKnownHostsFile=/dev/null' >> ~/.ssh/config",
      "echo '  LogLevel ERROR' >> ~/.ssh/config" # Suppress warnings
    ]
  }

  depends_on = [aws_instance.ec2_instance]
}

resource "null_resource" "configure_ssh" {
  count = var.number_of_instances

  connection {
    type        = "ssh"
    host        = aws_instance.ec2_instance[count.index].public_ip
    user        = "ubuntu"
    private_key = file("/home/ubuntu/VM/Lab.pem")
  }

  provisioner "file" {
    source      = "/home/ubuntu/.ssh/id_ed25519.pub"
    destination = "/home/ubuntu/id_ed25519.pub"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p ~/.ssh",
      "cat /home/ubuntu/id_ed25519.pub >> ~/.ssh/authorized_keys",
      "chmod 700 ~/.ssh",
      "chmod 600 ~/.ssh/authorized_keys"
    ]
  }

  depends_on = [aws_instance.ec2_instance, null_resource.disable_strict_host_key_checking]
}

output "vm_info" {
  value = { for idx, instance in aws_instance.ec2_instance : "${instance.tags.Name}" => instance.public_ip }
}