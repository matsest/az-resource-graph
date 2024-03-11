# Azure Resource Graph

A demo repository for [Azure Resource Graph](https://learn.microsoft.com/en-us/azure/governance/resource-graph/overview) with focus creating and running queries using Azure PowerShell and Azure CLI with local development in VS Code.

## What is Azure Resource Graph?

- Azure Resource Graph is an Azure service that provides a performant queryable interface to Azure across your subscriptions
- The [query language](https://learn.microsoft.com/en-us/azure/governance/resource-graph/concepts/query-language) is based on Kusto Query Language (KQL)

The knowledge of resource graph and KQL is an extremely powerful skill-set when working with Azure and can be utilized to work with governance (logs, alerts, monitoring) and Governance (workbooks, assessments, change analysis, reporting) among other things.

For an introduction to KQL basics in Azure I recommend the MS Learn learning path [here](https://learn.microsoft.com/en-us/training/paths/analyze-monitoring-data-with-kql/).

## Prerequisities

- [VS Code](https://code.visualstudio.com/download)
  - Install [recommended extensions](./.vscode/extensions.json)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Azure PowerShell](https://learn.microsoft.com/en-us/powershell/azure/install-azure-powershell)
- [Reader role](https://learn.microsoft.com/en-us/azure/governance/resource-graph/overview#permissions-in-azure-resource-graph) in your Azure environment

## Azure CLI

```bash
# Login
az login

# Install extension
az extension add --name resource-graph

# In-line query
az graph query -q 'Resources | project name, type | limit 5'

# Query from file
QUERY=$(cat <file>)
az graph query -q $QUERY
```

See more details [here](https://learn.microsoft.com/en-us/azure/governance/resource-graph/first-query-azurecli).

## Azure PowerShell

```powershell
# Login
Connect-AzAccount

# Install module
Install-Module -Name Az.ResourceGraph

# In-line query
Search-AzGraph -Query 'Resources | project name, type | limit 5'

# Query from file
$query = Get-Content -Path <file> -Raw
Search-AzGraph -Query $query
```

See more details [here](https://learn.microsoft.com/en-us/azure/governance/resource-graph/first-query-powershell).

## License

[MIT License](./LICENSE)