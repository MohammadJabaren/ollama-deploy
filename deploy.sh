#!/bin/bash
set -e

MODEL_NAME="tinyllama"
SERVICE_FILE="/etc/systemd/system/ollama.service"
USER="ubuntu"
PROJECT_DIR="$1"
cd "$PROJECT_DIR"

echo "Starting deployment..."

# Install Ollama if not already installed
if ! command -v ollama &> /dev/null; then
  echo "Ollama not found. Installing..."
  curl -fsSL https://ollama.com/install.sh | sh
fi

# Pull the model if not already pulled
if ! ollama list | grep "tinyllama"
; then
  echo "Model $MODEL_NAME not found. Pulling..."
  sudo -u ubuntu ollama pull "$MODEL_NAME"
fi
# Update the systemd service to listen on all interfaces
echo "Updating ollama.service to listen on 0.0.0.0..."

sudo cp ollama.service /etc/systemd/system

# Reload systemd and restart the Ollama service
if [ -f "$SERVICE_FILE" ]; then
    echo "  Installing systemd service..."
    sudo systemctl daemon-reload
    sudo systemctl restart ollama
    sudo systemctl enable ollama
    echo " Service reloaded and restarted."
    if ! systemctl is-active --quiet ollama.service; then
      echo "❌ ollama.service is not running Yet."
      sudo systemctl status ollama.service --no-pager
      exit 1
    fi
fi
echo "✅ Deployment completed successfully."

