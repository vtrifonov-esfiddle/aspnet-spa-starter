FROM node:12 AS nodeBuild

WORKDIR /appSource/ClientApp
COPY ./ClientApp /appSource/ClientApp

RUN npm install
RUN npm run-script build

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as aspnetBuild

WORKDIR /appSource
COPY . /appSource
COPY --from=nodeBuild /appSource/ClientApp/build /appSource/ClientApp/build

RUN dotnet restore
RUN dotnet publish -c Release -o /appPublish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=aspnetBuild /appPublish /app

ENTRYPOINT ["dotnet", "AspnetSpaContainer.dll"]