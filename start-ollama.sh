#!/bin/bash

# Start Ollama in the background
ollama serve &

# Wait for Ollama to wake up
echo "Waiting for Ollama to start..."
while ! curl -s http://localhost:11434/api/tags > /dev/null; do
  sleep 1
done

# Pull the model (Ollama won't re-download if it's already in the volume)
echo "Checking for qwen2.5-coder:1.5b..."
ollama pull qwen2.5-coder:1.5b

#echo "Checking for qwen2.5-coder:7b..."
#ollama pull qwen2.5-coder:7b

# Keep the container running
echo "Ollama is ready!"
wait $!
