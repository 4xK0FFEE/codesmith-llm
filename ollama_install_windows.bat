@echo off
echo Installing Ollama...
winget install Ollama.Ollama

echo Pulling deepseek-coder:6.7b model...
ollama pull deepseek-coder:6.7b

echo Running Ollama...
ollama run deepseek-coder:6.7b
