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
- [ ] Research and select one **AP** and one **CP** NoSQL database
- [ ] Setup cluster of EC2 instances for each selected database
- [ ] Decide approach to create network partitions for experiments
- [ ] Record findings from following scenario
  - [ ] System function during normal mode
  - [ ] Effect on nodes during partition
  - [ ] Reading stale data during partition
  - [ ] System function during partition recovery mode

## Journal
Project Journal available at following locations for this project.

[Week 1 Report](Journal/Week%201%20Report.md)

[Week 2 Report](Journal/Week%202%20Report.md)

[Week 3 Report](Journal/Week%203%20Report.md)

## AWS Network Architecture

### MongoDB

![AWS Network Diagram MongoDB](Resources/AWS&#32;Network&#32;Diagram&#32;-&#32;MongoDB.png)

