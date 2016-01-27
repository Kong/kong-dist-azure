#Indicate your new ResourceGroupName
$resourceGroupName = "kong1";
$subscriptionId = "Put Your Subscription Id Here";
$location = "West Europe"

Add-AzureAccount

Switch-AzureMode AzureResourceManager

Select-AzureSubscription -SubscriptionId $subscriptionId -Current

New-AzureResourceGroup -ResourceGroupName $resourceGroupName -location $location `
-TemplateFile .\azuredeploy.json -TemplateParameterFile .\azuredeploy.parameters.json
