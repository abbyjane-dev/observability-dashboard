#!/bin/bash

set -e

echo

echo "$(date +"%Y-%m-%d %H:%M:%S.%3N")"

# Move to this script’s directory (so cron works anywhere)
cd "$(dirname "$0")"

# Always sync with remote first (handle Actions updates)
git pull --rebase origin main

# Activate venv
source venv/bin/activate

# Generate the dashboard
<<<<<<< HEAD
/Users/abby/Projects/dashboard/venv/bin/python3 /Users/abby/Projects/dashboard/generate_dashboard.py
=======
/home/abby/Projects/observability/venv/bin/python3 /home/abby/Projects/observability/generate_dashboard.py
>>>>>>> f55e9fd (Updates and new computers)

# Stage changes if any
git add index.html

# Only commit & push if there are actual changes
if ! git diff --cached --quiet; then
    git commit -m "Local automated dashboard update"
    git push origin main
fi
