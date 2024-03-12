# Azure Resource Graph 🔎

A repository for [Azure Resource Graph](https://learn.microsoft.com/en-us/azure/governance/resource-graph/overview) with focus on creating and running queries using Azure PowerShell and Azure CLI with local VS Code support.

This purpose of this repository is two-fold - to serve as a reference repository for myself and others while working with Azure Resource Graph - and to share own content related to Azure Resource Graph.

> [!TIP]
>### 📰 Blog posts
> 
> With the work in this repository I am aiming at producing a series of blog posts on [my personal blog](https://www.mxe.no). To get notice of posts you can subscribe to the [site RSS feed](https://www.mxe.no/posts/index.xml) or follow updates in this repository.
> 
> The current goal is to produce the following posts to companion this repository (items without links are not published yet):
> 
> 1. Why Azure Resource Graph
> 2. Basic KQL and Resource Graph Queries
> 3. Advanced Resource Graph Queries
> 4. Sharing Resource Graph Queries in Azure
> 5. Automating Resource Graph Queries
>
> Disclaimer: This might be subject to change as I go along. No dates for publishing promised :wink:

## What is Azure Resource Graph?

- Azure Resource Graph is an Azure service that provides a performant queryable interface to Azure across your subscriptions
- The [query language](https://learn.microsoft.com/en-us/azure/governance/resource-graph/concepts/query-language) is based on Kusto Query Language (KQL)

The knowledge of resource graph and KQL is an extremely powerful skill-set when working with Azure and can be utilized to work with governance (logs, alerts, monitoring) and Governance (workbooks, assessments, change analysis, reporting) among other things.

For an introduction to KQL basics in Azure I recommend the MS Learn learning path [here](https://learn.microsoft.com/en-us/training/paths/analyze-monitoring-data-with-kql/).

## Usage

### Prerequisities

 The following prerequisites are recommended to get started with using the code provided in this repository.

- [VS Code](https://code.visualstudio.com/download)
  - Install [recommended extensions](./.vscode/extensions.json)
- [Azure PowerShell](https://learn.microsoft.com/en-us/powershell/azure/install-azure-powershell)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- [Reader role](https://learn.microsoft.com/en-us/azure/governance/resource-graph/overview#permissions-in-azure-resource-graph) in your Azure environment

> [!NOTE]
> Azure Resource Graph does not require Azure CLI *and* Azure PowerShell. Based on what you're used to and what you are working with you can choose what to use. Both tools work on all platforms. From my side my main tool is Azure PowerShell (running on Linux! :penguin:) as I like the object-based, structured output it offers.

### Azure PowerShell

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

### Azure CLI

```bash
# Login
az login

# Install extension
az extension add --name resource-graph

# In-line query
az graph query -q 'Resources | project name, type | limit 5'

# Query from file
QUERY=$(cat <file>)
az graph query -q "$QUERY"

# Query from file using script with formatted output
./scripts/resource-graph-query.sh <file>
./scripts/resource-graph-query.sh queries/resources/resource-type-count.kql # example

```

See more details [here](https://learn.microsoft.com/en-us/azure/governance/resource-graph/first-query-azurecli).



## License

[MIT License](./LICENSE)