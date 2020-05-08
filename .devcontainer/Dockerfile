FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN apt-get -qq update && apt-get -qqy --no-install-recommends install wget gnupg \
    git \
    unzip

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs \
    procps

ENV ASPNETCORE_ENVIRONMENT Development
ENV NODE_ENV development