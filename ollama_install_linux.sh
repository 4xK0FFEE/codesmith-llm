#!/bin/bash
# Install Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# Pull the deepseek-coder model
ollama pull deepseek-coder:6.7b

# Run Ollama with the model
ollama run deepseek-coder:6.7b
