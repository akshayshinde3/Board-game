terraform {
    backend "s3" {
        bucket = "akshay1999tf"
        key    = "EKS/terraform.tfstate"
        region = "us-east-1"
    }
}
