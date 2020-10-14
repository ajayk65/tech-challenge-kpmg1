This is terraform project to create three tier setup of an application in AWS cloud. <br />
Below is the approach or factors considered while creating this application.

**a. High Availalibity** :- Two availability zones eu-west-1b and eu-west-1c have been used within AWS region :- eu-west-1.<br />
**b. Scalability** :- Project is using ASG (Auto Scaling Group) feature of EC2.<br />
**c. Load Balancing** :- Elastic Load Balancer has been used for catering load among EC2 instances.<br />
**b. Security** :- Security groups has been used to allow/deny traffic from internet to EC2.<br />

**Steps to reproduce**

**1.** Refer this another github repo to [initialize the setup](https://github.com/ajayk65/initialize-setup)<br />
**2.** Clone this repository.

**3.** Execute below sets of commands from repository cloned location:-<br />

**i)** export env=dev (or test/prod)<br />
**ii)** terraform init -backend-config=config/backend-${env}.conf -backend=true<br />
**iii)** terraform apply -var-file=config/${env}.tfvars -var password=<db password> -lock=true<br />



**Verification :-**<br />
After app gets created sucessfully grab the DNS of the ELB from AWS console and verify html page is coming.
