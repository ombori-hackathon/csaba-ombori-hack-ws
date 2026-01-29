# Snake Game - Quick Start Guide

## Launch the Game

### 1. Start PostgreSQL Database
```bash
cd /Users/csaba.gulyas/ombori/hackatlon
docker compose up -d
```

### 2. Start API Backend
```bash
cd /Users/csaba.gulyas/ombori/hackatlon/services/api
uv run fastapi dev
```
API will be available at: http://localhost:8000

### 3. Launch macOS Client
```bash
cd /Users/csaba.gulyas/ombori/hackatlon
swift run CsabaOmboriHackClient
```

## How to Play

### Controls
- **Arrow Keys** - Move snake (Up: ↑, Down: ↓, Left: ←, Right: →)
- **Space Bar** - Start game / Pause / Resume
- **Buttons** - Use on-screen Start/Pause/Reset buttons

### Game Rules
1. Guide the snake to eat red food
2. Snake grows longer with each food eaten
3. Score increases by 10 points per food
4. Speed increases as you progress (gets harder!)
5. Avoid hitting walls or your own body
6. Game ends on collision

### Speed Progression
- **Starting Speed:** 300ms per move (slow)
- **Speed Increase:** 10ms faster per food eaten
- **Maximum Speed:** 80ms per move (very fast!)
- **Challenge:** You'll need quick reflexes after eating ~22 foods

### Scoring
- **+10 points** per food eaten
- Submit your score to the global leaderboard
- Compete with other players for top rank

## Features

### Tab Navigation
- **Tab 1: Snake Game** - Play the game
- **Tab 2: Leaderboard** - View top scores globally
- **Tab 3: API Demo** - Test API health and database items

### Leaderboard
- See top 100 scores from all players
- Rankings with medals for top 3 (🥇🥈🥉)
- Shows player name, score, and timestamp
- Auto-refreshes when viewing
- Manual refresh button available

### Score Submission
1. Play until game over
2. Click "Submit Score" button
3. Enter your player name in the alert
4. Your score appears on the leaderboard!

## API Endpoints

### POST /leaderboard
Submit a new score:
```bash
curl -X POST http://localhost:8000/leaderboard \
  -H "Content-Type: application/json" \
  -d '{"player_name": "YourName", "score": 250}'
```

### GET /leaderboard
Get top scores:
```bash
curl "http://localhost:8000/leaderboard?limit=10"
```

### API Documentation
Interactive docs: http://localhost:8000/docs

## Troubleshooting

### "API not responding" error
- Check if the API is running: `curl http://localhost:8000/health`
- If not, start it: `cd services/api && uv run fastapi dev`
- You can still play offline, just can't submit scores

### Database connection issues
- Check if PostgreSQL is running: `docker compose ps`
- If not, start it: `docker compose up -d`
- Check health: `docker compose exec postgres pg_isready`

### Game not responding to arrow keys
- Click on the game canvas to focus it
- Make sure the window is in the foreground
- Try pressing Space to start/unpause the game

## Game Strategy Tips

1. **Plan Ahead** - Think a few moves in advance
2. **Use the Edges** - Create patterns along the walls
3. **Spiral Technique** - Move in a spiral to maximize space
4. **Stay Calm** - Speed increases gradually, don't panic
5. **Practice** - The more you play, the better you get!

## High Score Challenge

Current leaderboard top scores (as of implementation):
- 🥇 1st place: 420 points
- 🥈 2nd place: 350 points
- 🥉 3rd place: 250 points

Can you beat them? 🏆

## Technical Details

- **Grid Size:** 20x20 cells
- **Cell Size:** 25x25 pixels
- **Board Size:** 500x500 pixels
- **Rendering:** GPU-accelerated Canvas
- **Backend:** FastAPI with PostgreSQL
- **Platform:** macOS 14+

## Development

### Run Tests
```bash
cd services/api
uv run pytest -v
```

### Build Swift Client
```bash
swift build
```

### View Logs
- API logs appear in the terminal where you ran `uv run fastapi dev`
- Database logs: `docker compose logs -f postgres`

Enjoy the game! 🐍🎮
