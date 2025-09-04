#!/bin/bash
# Start Rasa server in the background
rasa run --enable-api --cors "*" &

# Start Action server in the background
rasa run actions --cors "*" &

# Wait for any process to exit
wait -n
