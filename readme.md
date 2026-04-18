# Readme

This is an experimental LLM server for my phpStorm ai instances.

In phpStorm, setup docker and execute the docker-compose.yml.

Within a terminal run the following:
```bash
cd ollama-test
docker-compose up -d
```

The bash commands below assume you are in the docker terminal:
```bash
docker exec -it ollama-test bash
```

Download LLM images from the [ollama hub](https://ollama.ai/library).
Here are some basic model images to try:
```bash
ollama pull qwen2.5-coder:7b     # slow - smarter
ollama pull qwen2.5-coder:3b     # faster - dumber
ollama pull qwen2.5-coder:1.5b   # fastest - dumbest
```

To start ollama with your desired LLM image:
```bash
ollama run qwen2.5-coder:1.5b   # use desired LLM image
```

To exit a terminal chat session:
```
>>> /bye
```

### Setup phpStorm AI assistant

Create a new `.env` from the `.env.example` file if you do not want to use the default ollama port for your local machine.
Rebuild the docker image and restart the container after creating the `.env` file.

- **Enable Provider:** Go to Settings (Ctrl+Alt+S) > Tools > AI Assistant > Third-Party AI Providers.
- **Enable Ollama:** Check the box for Enable Ollama.
- **Set Server Address:** If Docker is on your local machine, use http://localhost:11434.
- **Select Model:** Once connected, you can select your pulled models from the dropdown menu in the AI Assistant chat panel. 

