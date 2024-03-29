FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /app

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs

COPY MeuEstoque.Web/MeuEstoque.Web.csproj MeuEstoque.Web/MeuEstoque.Web.csproj
COPY MeuEstoque.Domain/MeuEstoque.Domain.csproj MeuEstoque.Domain/MeuEstoque.Domain.csproj
COPY MeuEstoque.Infrastructure/MeuEstoque.Infrastructure.csproj MeuEstoque.Infrastructure/MeuEstoque.Infrastructure.csproj
COPY MeuEstoque.sln MeuEstoque.sln

RUN dotnet restore
COPY . ./

RUN dotnet publish -c Release -o out --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:6.0
COPY --from=build-env /app/out .

EXPOSE 80
ENTRYPOINT ["dotnet", "MeuEstoque.Web.dll", "--urls", "http://*:80"]