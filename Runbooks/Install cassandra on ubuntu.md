## Install cassandra on ubuntu

1. Launch Ubuntu 16.04 instance from AMI
   
   ![Ubuntu 16.04 AMI](../Resources/Ubuntu&#32;16.04&#32;AMI.png)

2. Launch 5 such instances in N. Virginia and Ohio regions with private subnets in different AZs.
   
3. Allow SSH access from bastion host of respective regions by configuring appropriate security group details
   
4. Update, Upgrade and Restart the instances
   
   ```bash
   $ sudo apt update 
   $ sudo apt upgrade -y
   ```

5.  Add the apache repository of Cassandra to `/etc/apt/sources.list.d/cassandra.sources.list`
   
    ```bash
    $ sudo echo deb http://www.apache.org/dist/cassandra/debian 311x main | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
    ```

6. Add the apache Cassandra repository keys
   
   ```bash
   $ sudo curl https://www.apache.org/dist/cassandra/KEYS | sudo apt-key add -
   ```

7. Update the repositories
   
   ```bash
   $ sudo apt update
   ```

8. Install Cassandra
   
   ```bash
   $ sudo apt install cassandra
   ```