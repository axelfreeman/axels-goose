#!/bin/bash
set -e

echo "🪿 Axel's Goose — Emergency AI Agent Recovery"
echo "============================================="

# 1. Install Goose CLI
if ! command -v goose &>/dev/null; then
    echo "📦 Installing Goose CLI..."
    curl -fsSL https://block.github.io/goose/install.sh | bash
fi

# 2. Configure Goose for rescue mode
echo "⚙️  Configuring Goose..."
goose configure --provider openrouter --model qwen/qwen3.7-plus 2>/dev/null || true

# 3. Install developer extension
echo "🔧 Installing developer extension (terminal access)..."
goose toolkit install developer 2>/dev/null || true

# 4. Install MCP servers
echo "🧠 Installing MCP servers..."
goose mcp install memory 2>/dev/null || true
goose mcp install computer-controller 2>/dev/null || true
goose mcp install autovisualiser 2>/dev/null || true

# 5. Add axels-goose command
echo "📋 Installing axels-goose command..."
SCRIPT_URL="https://raw.githubusercontent.com/axelfreeman/axels-goose/main/axels-goose"
curl -fsSL "$SCRIPT_URL" -o /usr/local/bin/axels-goose
chmod +x /usr/local/bin/axels-goose

echo ""
echo "✅ Done! Run 'axels-goose' when Hermes is down."
echo "   axels-goose              — interactive rescue session"
echo "   axels-goose run -c fix   — one-shot command"
