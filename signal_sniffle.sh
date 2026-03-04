#!/bin/bash
DATA_PAYLOAD="Pattern detected at $(date)"
echo "{\"status\": \"learning\", \"message\": \"$DATA_PAYLOAD\"}" > fusion_signal.json

git add fusion_signal.json
git commit -m "SIGNAL: Yodel to Sniffle - New Pattern"
git push origin main
