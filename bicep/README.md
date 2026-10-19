# bicep

## Deploys static web app and resource group

## Az login

```powershell
az login --use-device-code
```

## Verify command

```powershell
az deployment sub validate --name board-deployment --location japaneast --template-file main.bicep --parameters location=japaneast
```

## Run command

```powershell
az deployment sub create --name board-deployment --location japaneast --template-file main.bicep --parameters location=japaneast --no-wait
```

## Cleanup command

```powershell
az group delete -n board-d3c0 --yes --no-wait
```