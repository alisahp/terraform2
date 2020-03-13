git clone https://github.com/alisahp
/terraform2
cd Terraform-project/AWS/VPC
source setenv.sh configurations/REGION/vpc.tfvars
terraform apply -var-file=configurations/REGION/vpc.tfvars