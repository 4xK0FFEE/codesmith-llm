# PowerShell script to install and set up LLMs on Windows

# Check if Ollama is installed
if (-Not (Get-Command "ollama" -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Ollama..."
    irm https://ollama.com/install.ps1 | iex
} else {
    Write-Host "Ollama is already installed."
}

# Pull LLM models using Ollama
Write-Host "Downloading Mistral 7B..."
ollama pull mistral:7b

Write-Host "Downloading DeepSeek Coder 6.7B..."
ollama pull deepseek-coder:6.7b

Write-Host "Downloading Gemma 2B..."
ollama pull gemma:2b

# Check if llama.cpp exists
$LlamaDir = "$HOME\llama.cpp"
if (-Not (Test-Path $LlamaDir)) {
    Write-Host "Installing llama.cpp..."
    git clone https://github.com/ggerganov/llama.cpp.git $LlamaDir
    cd $LlamaDir
    mkdir build
    cd build
    cmake .. -G "Ninja"
    ninja
} else {
    Write-Host "llama.cpp is already installed."
}

# Download and set up Gemma 9B for llama.cpp
$ModelDir = "$HOME\models"
if (-Not (Test-Path $ModelDir)) {
    mkdir $ModelDir
}

Write-Host "Downloading Gemma 9B (quantized)..."
Invoke-WebRequest -Uri "https://huggingface.co/google/gemma-9b-GGUF/blob/main/gemma-2-9b.Q4_K_M.gguf" -OutFile "$ModelDir\gemma-2-9b.Q4_K_M.gguf"

Write-Host "Setup complete! You can now run models:"
Write-Host "1️⃣ Mistral 7B: ollama run mistral"
Write-Host "2️⃣ DeepSeek 6.7B: ollama run deepseek-coder:6.7b"
Write-Host "3️⃣ Gemma 2B: ollama run gemma:2b"
Write-Host "4️⃣ Gemma 9B (via llama.cpp):"
Write-Host "   cd $LlamaDir/build"
Write-Host "   ./main -m $ModelDir/gemma-2-9b.Q4_K_M.gguf -t 8 --gpu-layers 50"
