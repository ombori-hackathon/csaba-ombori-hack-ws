# csaba-ombori-hack - Hackathon Workspace

Multi-repo workspace for Ombori hackathon with SwiftUI macOS client and FastAPI backend.

## Quick Start

### 1. Complete Git Setup (One-Time)

```bash
chmod +x complete-git-setup.sh
./complete-git-setup.sh
```

This script will:
- Push the API repository
- Set up Git submodules
- Initialize and push the workspace repository

### 2. Start Development Environment

```bash
# Terminal 1: Start PostgreSQL database
docker compose up -d

# Terminal 2: Start FastAPI backend
cd services/api
uv run fastapi dev

# Terminal 3: Run Swift macOS client
cd apps/macos-client
swift run CsabaOmboriHackClient
```

### 3. Verify Everything Works

```bash
# Check database is running
docker compose ps

# Check API health
curl http://localhost:8000/health

# Check Swift builds
cd apps/macos-client && swift build
```

## Repositories

- **Workspace**: https://github.com/ombori-hackathon/csaba-ombori-hack-ws
- **macOS Client**: https://github.com/ombori-hackathon/csaba-ombori-hack-macos
- **API Backend**: https://github.com/ombori-hackathon/csaba-ombori-hack-api

## Project Structure

```
├── apps/
│   └── macos-client/      # SwiftUI macOS app (submodule)
├── services/
│   └── api/               # FastAPI Python backend (submodule)
├── specs/                 # Feature specifications
├── .claude/
│   ├── agents/            # Specialized Claude agents
│   └── skills/            # Custom workflows (/feature)
├── docker-compose.yml     # PostgreSQL database
└── CLAUDE.md              # Development guide
```

## Claude Code Workflows

### Skills

- `/feature` - Build new features end-to-end with TDD

### Agents

- `/architect` - System design and API contracts
- `/swift-coder` - Swift client development
- `/python-coder` - FastAPI backend development
- `/reviewer` - Code review
- `/debugger` - Issue investigation
- `/tester` - Test-driven development

## Development Workflow

1. **Plan First** - Use `/feature` to create specs in `specs/`
2. **Write Tests** - TDD: tests before implementation
3. **Implement** - Use coder agents
4. **Review** - Use reviewer agent
5. **Commit** - Create PRs with `gh pr create`

## API Endpoints

- Swagger UI: http://localhost:8000/docs
- ReDoc: http://localhost:8000/redoc
- Health check: http://localhost:8000/health
- Items: http://localhost:8000/items

## Tech Stack

- **Frontend**: SwiftUI (macOS 14+)
- **Backend**: FastAPI + Python 3.12+
- **Database**: PostgreSQL 17
- **Package Management**: Swift Package Manager + uv (Python)

## Contributing

See [CLAUDE.md](./CLAUDE.md) for detailed development guidelines and patterns.
