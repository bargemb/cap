## Week 1 Report (3/10-3/16)

### Plan

- [x] Read reference blog posts (https://www.infoq.com/articles/jepsen) and finalize the approach
- [x] Evaluate the tools mentioned in the blog post (https://github.com/jepsen-io/jepsen & https://github.com/aphyr/salticid)
- [x] Read about network partitioning approaches and decide one for this project
- [x] Read about **CP** and **AP** systems and decide NoSQL database in each category

### Results

1. **InfoQ Blog Post**
   1. The blog post talks about design considerations for distributed databases and how they respond to network partitions
   2. Network partition approach is discussed with *iptables*. Also it references tooling related to config automation & simulating partitions
   3. Author also mentions results for MongoDB and Riak systems. In case of MongoDB the discussion was mainly focused on *write concern*
2. **Jepsen & Salticid**
   1. _Jepsen_ is a framework for distributed systems verification. It is a Clojure library to set up a distributed system, run operations against, and verify
   2. _Salticid_ is command line utility to run tasks asynchronously to multiple machines
   
   Both the tools were cumbersome to use and hence decided to perform tests with small code snippets which are native to database.
3. **Network Partitioning**
   
   In case of amazon EC2 cluster I came up with following approches for network partitioning for multi-region deployment
   1. Terminate VPC peering so as to separate two regions
   2. Modifying route table so as to not allow traffic from another region
   3. At the host level, restrict traffic from specific IP
   
   Since it is easy to manage and modify from amazon console, I have decided to use first two approaches with CP and AP systems respectively 
4. **CP and AP NoSQL Databases**
   1. __MongoDB__ is selected for this experiment purpose. MongoDB is document-oriented database with a similar distribution design to Redis. MongoDB accepts write on single primary node and asynchronously replicates a log of its operations ("oplog") to secondaries. In case of network parition, MongoDB does not allow writes to secondaries and hence CP system.
   2. __Cassandra__ is selected for this experiment purpose. Cassandra is typically classified as an AP system, meaning that availability and partition tolerance are generally considered to be more important than consistency in Cassandra.

