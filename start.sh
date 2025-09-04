#!/bin/bash
rasa run --enable-api --cors "*" --host 0.0.0.0 &
rasa run actions --cors "*" --host 0.0.0.0 &
wait -n
