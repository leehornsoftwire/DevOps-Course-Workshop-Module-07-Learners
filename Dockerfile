FROM mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get update && apt-get install -y build-essential && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/

RUN mkdir /opt/Project 
WORKDIR /opt/Project 
COPY DotnetTemplate.sln .
COPY DotnetTemplate.Web DotnetTemplate.Web
COPY DotnetTemplate.Web.Tests DotnetTemplate.Web.Tests

RUN dotnet build

WORKDIR /opt/Project/DotnetTemplate.Web
RUN npm i

ENTRYPOINT [ "dotnet", "run" ]
