#!/usr/bin/env bash
set -euo pipefail

PLUGIN_JSON=".claude-plugin/plugin.json"
MARKETPLACE_JSON=".claude-plugin/marketplace.json"

# Get current version from plugin.json
CURRENT=$(grep -oP '"version":\s*"\K[^"]+' "$PLUGIN_JSON" | head -1)

IFS='.' read -r MAJOR MINOR PATCH <<< "$CURRENT"

BUMP="${1:-patch}"

case "$BUMP" in
  major) MAJOR=$((MAJOR + 1)); MINOR=0; PATCH=0 ;;
  minor) MINOR=$((MINOR + 1)); PATCH=0 ;;
  patch) PATCH=$((PATCH + 1)) ;;
  *)
    echo "Usage: $0 [major|minor|patch]" >&2
    exit 1
    ;;
esac

NEW="$MAJOR.$MINOR.$PATCH"

echo "$CURRENT -> $NEW"

# Update both files
sed -i "s/\"version\": \"$CURRENT\"/\"version\": \"$NEW\"/g" "$PLUGIN_JSON"
sed -i "s/\"version\": \"$CURRENT\"/\"version\": \"$NEW\"/g" "$MARKETPLACE_JSON"

echo "Updated $PLUGIN_JSON and $MARKETPLACE_JSON"
