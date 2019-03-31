# CAP :tophat:

## Introduction
Wikipedia:
> In theoretical computer science, the CAP theorem, also named Brewer's theorem after computer scientist Eric Brewer, states that it is impossible for a distributed data store to simultaneously provide more than two out of the following three guarantees:
> * Consistency: Every read receives the most recent write or an error
> * Availability: Every request receives a (non-error) response – without the guarantee that it contains the most recent write
> * Partition tolerance: The system continues to operate despite an arbitrary number of messages being dropped (or delayed) by the network between nodes

> In particular, the CAP theorem implies that in the presence of a network partition, one has to choose between consistency and availability.

This project aims to test **Partition Tolerance** of two NoSQL databases.

## Goals
- [x] Research and select one **AP** and one **CP** NoSQL database
- [x] Setup cluster of EC2 instances for each selected database
- [x] Decide approach to create network partitions for experiments
- [x] Record findings from following scenario
  - [x] System function during normal mode
  - [x] Effect on nodes during partition
  - [x] Reading stale data during partition
  - [x] System function during partition recovery mode

## Journal
Project Journal available at following locations for this project.

[Week 1 Report (3/10-3/16)](Journal/Week%201%20Report.md)

[Week 2 Report (3/17-3/23)](Journal/Week%202%20Report.md)

[Week 3 Report (3/24-3/30)](Journal/Week%203%20Report.md)

## AWS Network Architecture

### MongoDB (Consistency with Network Partition)

![AWS Network Diagram MongoDB](Resources/AWS&#32;Network&#32;Diagram&#32;-&#32;MongoDB.png)

### Cassandra (Availability with Network Partition)

![AWS Network Diagram Cassandra](Resources/AWS&#32;Network&#32;Diagram&#32;-&#32;Cassandra.png)

