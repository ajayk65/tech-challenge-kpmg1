This is terraform project to create three tier setup of an application in AWS cloud.
Approach or factors considered while creating this application.

**1. High Availalibity** :- Two availability zones eu-west-1b and eu-west-1c have been used within AWS region :- eu-west-1.

**2. Scalability** :- Project is using ASG (Auto Scaling Group) feature of EC2.

**3. Load Balancing** :- Elastic Load Balancer has been used for catering load among EC2 instances.

**4. Security** :- Security groups has been used to allow/deny traffic from internet to EC2.
