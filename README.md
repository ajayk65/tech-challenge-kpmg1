This is terraform project to create three tier setup of an application in AWS cloud. <br />
Below is the approach or factors considered while creating this application.

**1. High Availalibity** :- Two availability zones eu-west-1b and eu-west-1c have been used within AWS region :- eu-west-1.<br />
**2. Scalability** :- Project is using ASG (Auto Scaling Group) feature of EC2.<br />
**3. Load Balancing** :- Elastic Load Balancer has been used for catering load among EC2 instances.<br />
**4. Security** :- Security groups has been used to allow/deny traffic from internet to EC2.<br />

**Steps to reproduce**

[Refer this another github repo to initialize the setup](https://github.com/hchiao/three-tier-init)



**Verification :-** 
After app gets created sucessfully grab the DNS of the ELB from AWS console and verify html page is coming.
