## Week 3 Report (3/24-3/30)

### Plan

- [x] Setup Cassandra cluster in N. Virginia and Ohio region
- [x] Carry out experiments on Cassandra cluster before and after partition
- [x] Setup MongoDB sharding (Extra Credit)

### Results

1. **Cassandra Cluster Setup**
   1. Cassandra is installed in each node of 5 Node cluster
   2. Runbook for [installing cassandra on ubuntu](../Runbooks/Install%20cassandra%20on%20ubuntu.md) node is created
   3. Evaluated Datacenter, Racks, Seed node and Replication factor for Cassandra
   4. Runbook for [creating Cassandra cluster](../Runbooks/Setup%20cassandra%20cluster.md) is created
2. **Cassandra Results**
   1. Cassandra is operating in normal mode and can be checked using following command
        ```bash
        ubuntu@cassandra4:~$ sudo nodetool status
        Datacenter: us-east
        ===================
        Status=Up/Down
        |/ State=Normal/Leaving/Joining/Moving
        --  Address     Load       Tokens       Owns (effective)  Host ID                               Rack
        UN  10.0.1.36   268.5 KiB  256          41.3%             5a636989-87e2-4407-9f37-94efc228e343  1b
        DN  10.0.3.93   248.26 KiB  256          38.7%             6075095b-fed7-4c16-a62d-e94f6e057545  1d
        UN  10.0.2.205  293.97 KiB  256          40.2%             e6b08126-e4c3-4682-ada1-ac1180a15816  1c
        Datacenter: us-east-2
        =====================
        Status=Up/Down
        |/ State=Normal/Leaving/Joining/Moving
        --  Address     Load       Tokens       Owns (effective)  Host ID                               Rack
        UN  10.1.1.65   258.58 KiB  256          38.4%             01f3823e-bdfe-418d-885a-fd8b226970ab  2b
        UN  10.1.2.7    254.84 KiB  256          41.3%             7b30d164-4549-457c-84b7-051a9aff6773  2c
        ```
   2. Here you can see that every node in cassandra cluster is operating in `UN` mode i.e. Up and Normal
   3. Connect to cassandra cluster and create keyspace
        ```bash
        $ cqlsh -u cassandra
        $ cassandra@cqlsh> CREATE KEYSPACE test 
            WITH REPLICATION = { 
                'class' : 'NetworkTopologyStrategy', 
                'us-east' : 2,
                'us-east-2' : 1
            };
        ```
   4. Here I have used `NetworkTopologyStrategy` with replication factor mentioned for each Datacenter
   5. Create table for testing and insert dummy data
        ```bash
        CREATE TABLE emp(
            emp_id int PRIMARY KEY,
            emp_name text,
            emp_city text,
            emp_sal varint,
            emp_phone varint
        );
        INSERT INTO emp (emp_id, emp_name, emp_city, emp_phone, emp_sal) VALUES(1, 'Mayur', 'San Jose', 6692167575, 50000);
        INSERT INTO emp (emp_id, emp_name, emp_city, emp_phone, emp_sal) VALUES(2, 'Neeraj', 'Sunnyvale', 6692167576, 60000);
        INSERT INTO emp (emp_id, emp_name, emp_city, emp_phone, emp_sal) VALUES(3, 'Shishir', 'San Fransisco', 6692167577, 70000);

        ```
   6. Once the data is inserted its replicated to entire cluster.
   7. After the network partition we still can write data to each partitioned cluster. However it gets replicated to peer nodes only.
   8. After the partition recovery mode, cluster is back to normal mode.
   9. Thus Cassandra prefers Availability during network partition.

   