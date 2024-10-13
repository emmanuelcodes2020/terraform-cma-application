# cma-application
This is terraform repo to create infra for CMA-application
 
 
 ## To run this project locally
CREATING INFRASTRUCTURE FOR CMA APPLICATION
 1) Clone the project from the git repo 
 ```
 git clone git@gitlab.com:lamtech-cma/services/cma-application.git
 ```
 2) Change directory to the Terraform infra directory
 3a) Use this command below to reconfigure initializiation for  the backend 
   
   ```
   terraform init -reconfigure -backend-config bucket="cma-special-project" -backend-config key="major/dev/terraform.tfstate"
   ```

3b) Use plan out instruction for terraform plan and specify the tfvar file 
    
    ```
    terraform plan -out=plan.out --var-file=dev-env.tfvars
    ```

3c) Use plan out instruction for terraform apply and specify the tfvar file 
     
     ```
     terraform apply plan.out  --var-file=dev-env.tfvars
     ```

4) Use terraform destroy and specify the tf var file 
   ```
   terraform destroy  --var-file=uat-env.tfvars
   ```

## backend for the UAT environment 
<!-- # bucket = "cma-uat-special-project"
    # key = "major/uat/terraform.tfstate"
    # region = "eu-west-2" -->





APPLICATION DEPLOYMENT USING ANSIBLE 
1) Clone the project from the git repo 
    
    ```
    git clone git@gitlab.com:lamtech-cma/services/cma-application.git
    ```
  
2) Change directory to the Ansible-Playbook 

3) Use requirement.yml file to install the ansible-role-java
 
    ```
    ansible-galaxy install -r requirements.yml --roles-path roles
    ```

4) Run ansible playbook 
 
  ```
  ansible-playbook -i aws_ec2.yml site.yml -b -u ec2-user --private-key=~/.ssh/lamtech.pem
  ```

