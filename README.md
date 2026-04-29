# CloudProgramming

##Requirments

Terraform and AWS CLI installed
AWS account

##How to run

1. Connect terraform to your AWS account and create an IAM user with S3 and CloudFront access
2. Run main.tf in your terminal
3. Run the following commands in order
   ```bash
   terraform init
   terraform plan
   terraform apply
4. Confirm by typing yes if prompted then wait for the code to run.
5. A url for the page will be in the output, use it to access the page by copy/pasting in your browser
6. After finishing, to avoid extra costs simply run
   ```bash
   terraform destroy
