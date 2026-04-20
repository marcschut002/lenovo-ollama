#!/bin/sh
ollama serve &
SERVE_PID=$!

until ollama list > /dev/null 2>&1; do
  sleep 1
done

ollama pull llama3.2:3b

wait $SERVE_PID
