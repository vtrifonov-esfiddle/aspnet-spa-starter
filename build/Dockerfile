FROM mcr.microsoft.com/dotnet/core/sdk:3.0 as build

RUN apt-get -qq update && apt-get -qqy --no-install-recommends install wget gnupg \
    git \
    unzip
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

WORKDIR /appSource
COPY . /appSource

WORKDIR /appSource/ClientApp
RUN ls
RUN npm install

WORKDIR /appSource
RUN dotnet build
RUN dotnet publish -c Release -o /appPublish

FROM mcr.microsoft.com/dotnet/core/aspnet:3.0
WORKDIR /app
COPY --from=build /appPublish /app

ENTRYPOINT ["dotnet", "aspnet-react-container.dll"]