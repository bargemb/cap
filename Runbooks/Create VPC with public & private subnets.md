## Create VPC with Public & Private Subnets

1. VPC is specific to AWS region. Make sure you have created Key Pair in the region you are launching VPC
2. Launch VPC wizard as per below screenshot
   ![VPC wizard](../Resources/Launch&#32;VPC&#32;Wizard.png)
3. Select an option which would create a /16 network with two /24 subnets (one Public & one Private)
   ![VPC options](../Resources/VPC&#32;Options.png)
4. Select all the default configurations. Make sure to add NAT instance instead of NAT gateway to avoid charges
   ![VPC configurations](../Resources/VPC&#32;Configurations.png)