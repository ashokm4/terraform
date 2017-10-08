provider "aws"
   {
   region = "us-east-1"
   }

data "terraform_remote_state" "dbms" {
  backend = "s3"
  config {
    bucket = "ashtfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
resource "aws_instance" "ts-example" {
    ami  = "ami-8c1be5f6"
    instance_type = "t2.micro"
    subnet_id = "subnet-350e7918"
#    security_groups = ["myPubSeurityGroup"]
    security_groups = ["sg-20af585c"]
    key_name = "MyHome"
    availability_zone = "us-east-1b"
    tags {
    Name = "openshift-tf"
    }
}
