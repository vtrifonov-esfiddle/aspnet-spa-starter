FROM mcr.microsoft.com/dotnet/core/sdk:3.0

RUN apt-get -qq update && apt-get -qqy --no-install-recommends install wget gnupg \
    git \
    unzip

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs \
    procps
# enable remote debugging with Visual Studio Code for .NET core apps: 
# https://github.com/OmniSharp/omnisharp-vscode/wiki/Attaching-to-remote-processes#configuring-docker-attach-with-launchjson
# "Attach to Docker Container AspNetCore (.NET)" launch profile
RUN curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l /root/vsdbg

ENV ASPNETCORE_ENVIRONMENT Development
ENV NODE_ENV development
ENV CHOKIDAR_USEPOLLING true

EXPOSE 5000-5001
WORKDIR /app