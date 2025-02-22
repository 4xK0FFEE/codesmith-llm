# Ollama Setup Guide

## Introduction
Ollama is a powerful tool for running large language models locally, enabling fast inference and offline usage. This guide walks you through installing Ollama, setting up the `deepseek-coder:6.7b` model, and optimizing performance for the best experience.

The `deepseek-coder:6.7b` model is designed for efficient coding assistance, helping developers with code generation, debugging, and AI-powered suggestions.

## Minimum System Requirements
- **CPU**: 8-core processor (Intel i7-8700K / AMD Ryzen 5 3600 or better)
- **RAM**: 16GB
- **GPU**: NVIDIA GTX 1650 / AMD RX 580 with 4GB VRAM
- **Storage**: 20GB free space

## Recommended System Requirements
- **CPU**: 12-core processor (Intel i9-12900K / AMD Ryzen 9 5900X or better)
- **RAM**: 32GB
- **GPU**: NVIDIA RTX 3090 / AMD Radeon RX 6900 XT with 24GB VRAM
- **Storage**: 50GB free space (for multiple models)

## Installation Instructions

### Windows (PowerShell)
```powershell
winget install Ollama.Ollama
ollama pull deepseek-coder:6.7b
ollama run deepseek-coder:6.7b
```

### Windows (Batch Script - `.bat`)
```batch
@echo off
echo Installing Ollama...
winget install Ollama.Ollama
echo Pulling deepseek-coder:6.7b model...
ollama pull deepseek-coder:6.7b
echo Running Ollama...
ollama run deepseek-coder:6.7b
```

### MacOS (Bash)
```bash
brew install ollama
ollama pull deepseek-coder:6.7b
ollama run deepseek-coder:6.7b
```

### Linux (Debian-based)
```bash
curl -fsSL https://ollama.ai/install.sh | sh
ollama pull deepseek-coder:6.7b
ollama run deepseek-coder:6.7b
```

## Usage Guide
To start the Ollama server, run:
```bash
ollama serve
```

To test the setup, run:
```bash
ollama run deepseek-coder:6.7b
```
You should see the model responding to prompts in your terminal.

To use Ollama interactively, enter:
```bash
ollama run deepseek-coder:6.7b --interactive
```

For automated tasks, you can pipe input from a file:
```bash
cat code_snippet.txt | ollama run deepseek-coder:6.7b
```

## Performance Optimization
- **Enable GPU Acceleration**: Ensure your system has an NVIDIA GPU and install the latest CUDA drivers.
- **Reduce Memory Usage**: Use a smaller model variant if available.
- **Adjust Model Parameters**: Set batch size and context length based on your hardware capabilities.
- **Increase Storage**: Ensure sufficient disk space to store multiple model versions.

## Troubleshooting
- If Ollama is not recognized, restart your terminal.
- Ensure your GPU drivers are up to date for optimal performance.
- If the model fails to load, check if you have enough VRAM and disk space.

## Additional Notes
For more details, visit [Ollama's documentation](https://ollama.ai/docs).

