FROM node:12 AS nodeBuild

WORKDIR /appSource/ClientApp
COPY ./ClientApp /appSource/ClientApp

RUN npm ci
RUN npm run-script ng build --prod

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as aspnetBuild

WORKDIR /appSource
COPY . /appSource
COPY --from=nodeBuild /appSource/ClientApp/dist /appSource/ClientApp/dist

RUN dotnet restore
RUN dotnet publish -c Release -o /appPublish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=aspnetBuild /appPublish /app

ENTRYPOINT ["dotnet", "AspnetSpaContainer.dll"]