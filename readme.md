# Readme

This is an experimental LLM server to integrate with PhpStorm AI assistant.

Be sure to have enough disk space, 20-50Gb is recommended for all the docker and LLM images.

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

### Use Open-WebUI

Open `http://localhost:3000/` and create an account to use the Open-WebUI interface.

If you access Open WebUI through multiple hostnames (for example `http://192.168.0.7:3000` and `http://ollama.tk`), your browser treats them as different origins and keeps separate local UI/session data.

To keep behavior/settings consistent, use one canonical URL for Open WebUI:

1. Set `WEBUI_URL` in `.env` to your public URL (example: `WEBUI_URL=https://ollama.tk`).
2. Keep all alternate URLs/IPs redirected by your reverse proxy to that same canonical host.
3. Recreate the service:

```bash
docker compose up -d --force-recreate open-webui
```

Open WebUI data is persisted in `./open-webui` (mounted to `/app/backend/data`) so server-side settings/accounts survive container recreation.

As a bonus you can access the searxng page at `http://localhost:18081/`

#### Enable SearXng in open-webui

Go to admin settings `Web Search` an select `searxng` and set the url to `http://searxng:8081/search?q=<query>`

#### Enable kokoro-tts 

See: https://www.youtube.com/watch?v=92bjD0kA4GM&t=111s

## More Info

Watch this vid to learn about ollama: https://youtu.be/Wjrdr0NU4Sk?si=0g5PgAFnDbLGJFyO

#### Additional Features:
- **Open-WebUI Interface:** Access at `http://localhost:3000/`.
- **Searxng Page:** Available at `http://localhost:18081/`.
- **Kokoro TTS:** Available at `http://localhost:11435/web/`.


## Notes:

Best test LLM's using Nvidia 20xx series with 8g :
- `networkjohnny/deepseek-coder-v2-lite-base-q4_k_m-gguf:latest` (not good with opencode) 
- `qwen2.5-coder:7b`
- `deepseek-r1:7b`
- https://huggingface.co/unsloth/Qwen3.5-9B-MTP-GGUF

Use the Default Quantization: By default, Ollama downloads the Q4_K_M 4-bit quantization, which compresses the model perfectly so it fits into your 8GB VRAM.

## Using Opencode

https://github.com/p-lemonish/ollama-x-opencode



