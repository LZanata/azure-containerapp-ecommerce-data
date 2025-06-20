docker build -t blog-leonardo-app:latest .

docker run -d -p 80:80 blog-leonardo-app:latest

az login az 1

# Create a resource group in Azure
az group create --name containerappslab03 --location westus2

# Create an Azure Container Registry
az acr create --resource-group containerappslab03 --name blogleonardoacr --sku Basic

# Log in to the Azure Container Registry
az acr login --name blogleonardoacr

# Tag the Docker image
docker tag blog-leonardo-app:latest blogleonardoacr.azurecr.io/blog-leonardo-app:latest

# Push the Docker image to Azure Container Registry
docker push blogleonardoacr.azurecr.io/blog-leonardo-app:latest

#containerID = blogleonardoacr.azurecr.io/blog-leonardo-app:latest
#user = blogleonardoacr
#password = bkDoZuBSTEEiOxvjOy3bHupAXpqXyv01xAsTV78kSf+ACRCqKFGo

# Create Environment container app
az containerapp env create --name blog-leonardo-env --resource-group containerappslab03 --location westus2

# Create Container App
az containerapp create --name blog-leonardo-app --resource-group containerappslab03 --image blogleonardoacr.azurecr.io/blog-leonardo-app:latest --environment blog-leonardo-env --target-port 80 --ingress external --registry-username blogleonardoacr --registry-password bkDoZuBSTEEiOxvjOy3bHupAXpqXyv01xAsTV78kSf+ACRCqKFGo --registry-server blogleonardoacr.azurecr.io