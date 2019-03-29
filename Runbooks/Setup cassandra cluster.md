## Setup Cassandra cluster in different region

1. The aim of this runbook is to setup 5 node cassandra cluster in two regions viz. N. Virginia and Ohio. It is assumed that you have 2 VPCs setup in these regions with 3 and 2 private subnets in N. Virginia and Ohio regions respectively. Also please refer [cassandra installation on individual node](Install&#32;cassandra&#32;on&#32;ubuntu.md) to install cassandra on every node in cluster.
   
2. Create security group with following details
   
   ![Cassandra security group](../Resources/Cassandra&#32;security&#32;group.png)

   Please refer to [configuring firewall port access](https://docs.datastax.com/en/archived/cassandra/2.1/cassandra/security/secureFireWall_r.html) for more details regarding ports.

3. Go to Cassandra configuration directory and take backup of configuration file
   
   ```bash
   $ cd /etc/cassandra
   $ sudo cp cassandra.yaml cassandra.yaml.bak
   ```

4. Edit `cassandra.yaml` in your favourite editor with following details
   
   ```yaml
   cluster_name: ‘NoSQL’
   authenticator: PasswordAuthenticator # This is optional (relies on username/password pairs to authenticate)
   seeds: “<node_private_ip>,<node_private_ip>,<node_private_ip>”
   listen_address: <node_private_ip>
   rpc_address: 0.0.0.0
   broadcast_rpc_address: <node_private_ip>
   endpoint_snitch: Ec2Snitch
   ```
   Make sure to refer documentation of [Snitches](https://docs.datastax.com/en/archived/cassandra/2.1/cassandra/architecture/architectureSnitchesAbout_c.html)

5. Clear the default data from the Cassandra system table
   
   ```bash
   $ sudo rm -rf /var/lib/cassandra/data/system/*
   ```

6. Start Cassandra Service on node
   
   ```bash
   $ sudo service cassandra start
   ```

7. Check cluster status
   
   ```bash
   $ sudo nodetool status
   ```