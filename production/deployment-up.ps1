kubectl -f $PSScriptRoot\aspnet-react-deployment.yaml apply
kubectl port-forward services/aspnet-react-container 8084:80