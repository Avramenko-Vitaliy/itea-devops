// Provider for users with access and secret keys
provider "aws" {
  shared_credentials_file = "${var.aws_access_credentials_path}"
  region = "${var.region}"
}
