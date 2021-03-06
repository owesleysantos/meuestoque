# MeuEstoque

## Dependencies

- [NodeJS 16](https://nodejs.org/)
- [.NET 6.0](https://dotnet.microsoft.com/download/dotnet/6.0)

## Setup

```bash
# Clone repository
git clone https://github.com/happotato/meuestoque.git

# Change to directory
cd meuestoque

# Install dependencies
dotnet restore

# Build
dotnet build
```

### Running

#### With SQLServer

```bash
dotnet run --project MeuEstoque.Web DB:SQLServer:ConnectionString="<string>"
```

#### With SQLite

```bash
dotnet run --project MeuEstoque.Web DB:SQLite:ConnectionString="<string>"
```

#### With InMemory Database

```bash
dotnet run --project MeuEstoque.Web
```

## License

[GPLv3](LICENSE.txt)
