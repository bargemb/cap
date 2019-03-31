## Week 2 Report (3/17-3/23)

### Plan

- [x] Setup VPC in two different region N. Virginia and Ohio
- [x] Setup VPC peering between two regions
- [x] Setup MongoDB cluster in N. Virginia and Ohio region
- [x] Carry out experiments on MongoDB cluster before and after partition
- [x] Use Terraform to setup VPC (Extra Credit)

### Results

1. **VPC Setup and Peering**
   1. Since approach decided for network partitioning involves VPC peering, I have decided to setup two VPCs in different regions
   2. Keeping in mind fault tolerant systems and security aspect in mind, I have decided to setup database systems in private subnets in multiple availability zones
   3. Runbook for [VPC Setup](../Runbooks/VPC%20with%20public%20&%20private%20subnets.md) and [VPC Peering](../Runbooks/Inter-region%20VPC%20peering.md) is created
2. **MongoDB Setup**
   1. Each MongoDB instance in replica set is launched in separate private subnet in different availability zone
   2. Runbook is created for [MongoDB installation and replication cluster setup](../Runbooks/Setup%20mongodb%20cluster.md)
3. **MongoDB Results**
   1. Before the partition used following snippet on mongo shell as helper functions
        ```bash
        var day = 1000 * 60 * 60 * 24;
        var randomDate = function () {
            return new Date(Date.now() - (Math.floor(Math.random() * day)));
        }
        var randomName = function() {
            return (Math.random()+1).toString(36).substring(2);
        }
        ```
   2. Used following snippet to insert data from primary node
        ```bash
        for (var i = 1; i <= 60; ++i) {
            db.test.insert({
                name: randomName(),
                creationDate: randomDate(),
                uid: i
            });
            sleep(1000);
        }
        ```
   3. Verfied that replication happens on other nodes before the partition. By default mongodb doesn't allow read from secondaries
   4. Created Network partition by modifying route tables
   5. After the network partition, replication happens between one side of the partition which contains primary node while other side is unavailable
   6. Thus MongoDB prefers Consistency in case of network partition
4. **Terraform Setup**
   1. All the system resource required to create VPC and subnets are defined `.tf` file
   2. Use `brew install terraform` to install Terraform on MacOS
   3. Following command is used to generate execution plan for Terraform. 
        ```bash
        $ terraform plan
        ``` 
   4. Use following command to apply terraform plan and resource changes will be reflected on Amazon
        ```bash
        $ terraform apply
        ``` 
   
   