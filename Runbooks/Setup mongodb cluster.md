## Setup MongoDB cluster in different region

1. The aim of this runbook is to setup 5 node mongodb cluster in two regions viz. N. Virginia and Ohio. It is assumed that you have 2 VPCs setup in these regions with 3 and 2 private subnets in N. Virginia and Ohio regions respectively.
   
2. Copy mongo-ami created as part of lab 4 into above mentioned regions. We are going to use this AMI to launch mongodb instances. If you do not have mongo-ami then refer [Setup MongoDB AMI](https://github.com/paulnguyen/cmpe281/blob/master/labs/lab4/aws-mongodb-replica-set.md) section from lab 4.
   
3. Create security group with following details
   
   ![MongoDB security group](../Resources/MongoDB&#32;security&#32;group.png)

   For 22 port, source is security group of bastion(jumpbox) host. CIDR IPv4 range mentioned for 27017 is to accept traffic from another region via VPC peering. Last 27017 rule is to accept traffic from private subnets of same VPC. To add this rule first create security group with two rules mentioned above and then edit :blush:

4. Launch 5 different instances from mongo-ami in different AZs of these regions.

   ![Launch instance from AMI](../Resources/Launch&#32;instance&#32;from&#32;AMI.png)

5. Make sure to select VPC for respective region, private subnet and disable public IP
   
   ![MongoDB instance configurations](../Resources/MongoDB&#32;instance&#32;configurations.png)

6. Attach security group created above to these instances.
   
7. Edit `/etc/hosts` in each EC2 instance and add hostnames for private IPs
   For example on mongo1 host
   ```bash
    ubuntu@mongo1:~$ cat /etc/hosts
    127.0.0.1 localhost
    127.0.0.1 mongo1
    10.0.1.136 mongo1
    10.0.2.67 mongo2
    10.0.3.188 mongo3
    10.1.1.76 mongo4
    10.1.2.22 mongo5
   ```
   
8. Initialize the Replica Set
   ```javascript
    rs.initiate({
        _id : "nosql",
        members: [
            { _id: 0, host: "mongo1:27017" },
            { _id: 1, host: "mongo2:27017" },
            { _id: 2, host: "mongo3:27017" },
            { _id: 3, host: "mongo4:27017" },
            { _id: 4, host: "mongo5:27017" }
        ]
    });
   ```
   Here the `_id` field should match `replSetName` value in `/etc/mongod.conf`

9. Restart the service and check the status
    ```bash
    $ sudo service mongod restart
    $ sudo service mongod status
    ```  
