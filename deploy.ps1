#Indicate your new ResourceGroupName
$resourceGroupName = "kong1";
$subscriptionId = "4a81a3c5-f813-42bf-b6de-3a1c242ade9a";
$location = "West Europe"


Add-AzureAccount

Switch-AzureMode AzureResourceManager

Select-AzureSubscription -SubscriptionId $subscriptionId -Current

New-AzureResourceGroup -ResourceGroupName $resourceGroupName -location $location `
-TemplateFile .\azuredeploy.json -TemplateParameterFile .\azuredeploy.parameters.json