#!/bin/bash

# Get current git branch
BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo "📦 Current Git branch: $BRANCH"

# Map branch to environment
case "$BRANCH" in
  main)
    ENV_FILE="scripts/environments/prod.env"
    ENV_NAME="Production"
    ;;
  develop)
    ENV_FILE="scripts/environments/staging.env"
    ENV_NAME="Staging"
    ;;
  *)
    ENV_FILE="scripts/environments/dev.env"
    ENV_NAME="Development"
    ;;
esac

# Load environment variables
if [ -f "$ENV_FILE" ]; then
  echo "🔧 Loading $ENV_NAME environment from $ENV_FILE"
  source "$ENV_FILE"
else
  echo "❌ Environment file $ENV_FILE not found!"
  exit 1
fi

# Simulate deployment
echo "🚀 Deploying to $ENV_NAME environment..."
echo "➡️ APP_NAME: $APP_NAME"
echo "➡️ DEPLOY_TARGET: $DEPLOY_TARGET"
echo "✅ Deployment complete."
