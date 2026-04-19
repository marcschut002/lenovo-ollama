#!/bin/sh
ollama serve &
SERVE_PID=$!

until ollama list > /dev/null 2>&1; do
  sleep 1
done

ollama pull gemma3:4b

wait $SERVE_PID
