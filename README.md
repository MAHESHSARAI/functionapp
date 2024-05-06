# Project Title

## Overview
This project aims to set up an environment in Azure using Terraform for deploying serverless Function Apps, provisioning an Azure SQL Database, and configuring related resources.

## Prerequisites
1. Azure subscription
2. Azure DevOps account
3. Terraform installed
4. PowerShell and Azure CLI installed
5. Visual Studio Code and SQL Server Management Studio installed

## Steps to Setup
1. **Azure Subscription Setup:**
   - Ensure you have a free Azure subscription.
   - Make sure your account has the Owner role at the subscription level and Global administrator role at the directory level.
   - Check that you have not used up any quotas in the Azure subscription.

2. **Service Principal Setup:**
   - Set up a Service Principal that can deploy Terraform from Azure DevOps pipeline to an Azure Subscription.

3. **Tool Installation:**
   - Install the latest versions of Terraform, PowerShell, and Azure CLI.
   - Install Visual Studio Code and SQL Server Management Studio on your machine.

4. **Azure SQL Database Provisioning:**
   - Provision an Azure SQL Database in the free Azure subscription.
     - Create a Database named TradeDb.
     - Add two tables:
       - Customers:
         - Id (PK, int, not null)
         - FirstName (nvarchar, null)
         - LastName (nvarchar, null)
         - OrderId (int, null)
       - Orders:
         - OrderId (PK, int, not null)
         - Description (nvarchar, null)
         - OrderQty (int, null)
         - OrderAmount (decimal, null)
         - OrderDate (date, null)
     - Insert two records each in the two tables.

## Steps to Connect and Execute Queries
4.1. **Connect to Azure SQL Database:**
   - Open Azure Data Studio.
   - Click on the "New Connection" button in the Connections tab.
   - Enter the server details (server name, database name), authentication type (SQL Login), and credentials (username and password).
   - Click "Connect" to establish the connection.

4.2. **Open Query Editor:**
   - Once connected, right-click on the database (e.g., TradeDb) in the Object Explorer.
   - Select "New Query" to open the Query Editor.

4.3. **Execute SQL Queries:**
   - In the Query Editor, you can run SQL queries against the connected database.
   - Example queries:
     - To select all records from the Customers table:
       ```sql
       SELECT * FROM dbo.Customers;
       ```
     - To insert a new record into the Customers table:
       ```sql
       INSERT INTO dbo.Customers (Id, FirstName, LastName, OrderId)
       VALUES (1, 'John', 'Doe', 1001);
       ```
     - To delete a record from the Customers table:
       ```sql
       DELETE FROM dbo.Customers
       WHERE Id = 1;
       ```

5. **Function Apps Deployment:**
   - Using Terraform, create two serverless Function Apps with App Insights enabled in two regions:
     - Function App 1:
       - Name: pltfrm-bighand-interview-func-employees-{dd-mm-yy}
       - Location: West Europe
     - Function App 2:
       - Name: pltfrm-bighand-interview-func-projects-{dd-mm-yy}
       - Location: North Europe
     - Use your preferred runtime stack for the function app (e.g., PowerShell Core).

## Resources Created
- Azure SQL Database: TradeDb
  - Tables: Customers, Orders
- Function Apps:
  - pltfrm-bighand-interview-func-employees-{dd-mm-yy} (West Europe)
  - pltfrm-bighand-interview-func-projects-{dd-mm-yy} (North Europe)
- Application Insights: app-insights-employees-{dd-mm-yy}, app-insights-projects-{dd-mm-yy}
- App Service Plans: app-service-plan-northeurope, app-service-plan-westeurope
- Storage Accounts: storageaccountnebighand (North Europe), storageaccountwebighand (West Europe)
- SQL Server: tradedb-test (East US)

## Usage
1. Clone this repository.
2. Navigate to the directory containing the Terraform configurations.
3. Update the variables.tf file with your Azure subscription and resource details.
4. Run `terraform init` to initialize the Terraform configurations.
5. Run `terraform plan` to review the changes to be applied.
6. Run `terraform apply` to apply the Terraform configurations and provision the resources.

## Credits
- Created by [Mahesh]
