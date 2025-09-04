# #!/bin/bash
# rasa run --enable-api --cors "*" --host 0.0.0.0 &
# rasa run actions --cors "*" --host 0.0.0.0 &
# wait -n


#!/bin/bash
set -e

# Start Rasa server
rasa run --enable-api --cors "*" --host 0.0.0.0 --port 5005 &

# Start Action server
rasa run actions --cors "*" --host 0.0.0.0 --port 5055 &

# Wait for any process to exit
wait -n
