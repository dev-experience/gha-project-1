# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/azure-functions/dotnet-isolated:4-dotnet-isolated6.0 AS base
WORKDIR /home/site/wwwroot
EXPOSE 80
EXPOSE 443


FROM mcr.microsoft.com/dotnet/sdk:6.0 AS publish

# Working directory inside the image
WORKDIR /src
# Copy source code of the whole solution to the Docker image
COPY . .
# Run "dotnet restore", "dotnet build", "dotnet publish" in one command
RUN dotnet publish "./Xtz.TicketlessFlowApp/Xtz.TicketlessFlowApp.csproj" --configuration Release --output /app/publish /p:UseAppHost=false


FROM mcr.microsoft.com/dotnet/sdk:6.0 AS unit-tests-runner
WORKDIR /src
# Copy source code of the whole solution to the Docker image
COPY . .
CMD dotnet test './Xtz.TicketlessFlowApp.UnitTests/Xtz.TicketlessFlowApp.UnitTests.csproj' --logger:'trx;LogFilename=/src/test_results/unitTests.trx'

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS integration-tests-runner
WORKDIR /src
# Copy source code of the whole solution to the Docker image
COPY . .
CMD dotnet test './Xtz.TicketlessFlowApp.IntegrationTests/Xtz.TicketlessFlowApp.IntegrationTests.csproj' --logger:'trx;LogFilename=/src/test_results/integrationTests.trx'


FROM base AS final

ARG IMAGE_TIMESTAMP
ARG GIT_COMMIT_SHA
ARG APP_TITLE
ARG APP_DESCRIPTION
ARG REPOSITORY_URL

LABEL org.opencontainers.image.created=${IMAGE_TIMESTAMP}
LABEL org.opencontainers.image.revision=${GIT_COMMIT_SHA}
LABEL org.opencontainers.image.title=${APP_TITLE}
LABEL org.opencontainers.image.description=${APP_DESCRIPTION}
LABEL org.opencontainers.image.source=${REPOSITORY_URL}

WORKDIR /home/site/wwwroot
COPY --from=publish /app/publish .
ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true \
    GIT_COMMIT_SHA=${GIT_COMMIT_SHA} \
    IMAGE_TIMESTAMP=${IMAGE_TIMESTAMP}
