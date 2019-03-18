## Create inter-region VPC peering

1. To route traffic between two VPCs using private IPv4 OR IPv6 addresses VPC peering is used. It is assumed that two VPCs are available at this stage in different regions. If not please refer [VPC with public & private subnets](VPC&#32;with&#32;public&#32;&&#32;private&#32;subnets.md)
   
2. Make sure to not have any overlapping CIDR block between two VPCs
   
3. Click **Create Peering Connection** to launch VPC peering wizard in VPC dashboard
   
   ![Create VPC peering](../Resources/Create&#32;VPC&#32;peering.png)

4. In VPC peering wizard mention requester VPC and acceptor VPC from another region. Create request as per below screenshot
   
   ![Peering connection wizard](../Resources/Peering&#32;connection&#32;wizard.png)

5. Accept the VPC peering request by switching to another region. The connection request state should be **Pending-acceptance**
   
   ![VPC peering request](../Resources/VPC&#32;peering&#32;request.png)

6. Another important step is to add a route to VPC route tables that points to the IP address range of the other VPC. This should be done at both requester and acceptor VPCs

   ![VPC peering route table](../Resources/VPC&#32;peering&#32;route&#32;table.png)
