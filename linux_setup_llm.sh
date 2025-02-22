#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Ollama if not installed
if ! command_exists ollama; then
    echo "Installing Ollama..."
    curl -fsSL https://ollama.com/install.sh | sh
else
    echo "Ollama is already installed."
fi

# Pull LLM models using Ollama
echo "Downloading Mistral 7B..."
ollama pull mistral:7b

echo "Downloading DeepSeek Coder 6.7B..."
ollama pull deepseek-coder:6.7b

echo "Downloading Gemma 2B..."
ollama pull gemma:2b

# Install llama.cpp if not installed
LLAMA_DIR="$HOME/llama.cpp"
if [ ! -d "$LLAMA_DIR" ]; then
    echo "Installing llama.cpp..."
    git clone https://github.com/ggerganov/llama.cpp.git "$LLAMA_DIR"
    cd "$LLAMA_DIR"
    mkdir build && cd build
    cmake .. -G "Ninja"
    ninja
else
    echo "llama.cpp is already installed."
fi

# Create a models directory if not exists
MODEL_DIR="$HOME/models"
mkdir -p "$MODEL_DIR"

# Download and set up Gemma 9B for llama.cpp
echo "Downloading Gemma 9B (quantized)..."
wget -O "$MODEL_DIR/gemma-2-9b.Q4_K_M.gguf" "https://huggingface.co/google/gemma-9b-GGUF/blob/main/gemma-2-9b.Q4_K_M.gguf"

echo "Setup complete! You can now run models:"
echo "1️⃣ Mistral 7B: ollama run mistral"
echo "2️⃣ DeepSeek 6.7B: ollama run deepseek-coder:6.7b"
echo "3️⃣ Gemma 2B: ollama run gemma:2b"
echo "4️⃣ Gemma 9B (via llama.cpp):"
echo "   cd $LLAMA_DIR/build"
echo "   ./main -m $MODEL_DIR/gemma-2-9b.Q4_K_M.gguf -t 8 --gpu-layers 50"
