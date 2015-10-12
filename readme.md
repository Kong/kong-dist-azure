# [Kong][website-url] :heavy_plus_sign: [Microsoft Azure](https://azure.microsoft.com/en-us/)

[![Website][website-badge]][website-url]

[![][kong-logo]][website-url]

Microsoft Azure is used to create an virtual machine for development environment with Kong &including Cassandra.

## Starting the environment

```shell
# clone this repository
$ git clone https://github.com/jdevillard/kong-azure
```

Change (at least) the following parameters in the azuredeploy.parameters.json :
- newStorageAccountName : azure storage account
- adminUsername : admin username used for the SSH Connection
- sshKeyData : ssh key data, you can follow this [tutorial][ssh-key-tuto] to generate your ssh key
- dnsNameForPublicIP : Public DNS Name of the Virtual Machine 

Change the following parameter in the deploy.ps1 script : 
- $subscriptionId : the id of your azure subscription

Then go to the script folder and execute the script 
```PowerShell
 . .\deploy.ps1
```

## Testing Kong

To verify Kong is running successfully, execute the following command from the host machine:

```shell
$ curl  http://<DNS>.<Location>.cloudpapp.azure.com:8001 
```

so with the default value : 

```shell
$ curl  http://kongtemplate1.westeurope.cloudapp.azure.com:8001
```

You should receive a JSON response:

```javascript
{
	"version": "0.5.0",
	"lua_version": "LuaJIT 2.1.0-alpha",
	"tagline": "Welcome to Kong",
	"hostname": "MyAzureKongVM",
	"plugins": {
		"enabled_in_cluster": {
			
		},
		"available_on_server": ["ssl",
		"jwt",
		"acl",
		"cors",
	...
		"response-ratelimiting"]
	}
}
```
[kong-logo]: http://i.imgur.com/4jyQQAZ.png
[website-url]: https://getkong.org/
[website-badge]: https://img.shields.io/badge/GETKong.org-Learn%20More-43bf58.svg
[website-url]: https://getkong.org/
[azure-logo]:https://avatars0.githubusercontent.com/u/6844498?v=3&s=200
[ssh-key-tuto]:https://azure.microsoft.com/en-us/documentation/articles/virtual-machines-linux-use-ssh-key/