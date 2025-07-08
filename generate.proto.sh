#!/bin/bash

PROTO_DIR="./proto"
OUT_DIR="./go"

# Buat folder go jika belum ada
mkdir -p "$OUT_DIR"

for file in "$PROTO_DIR"/*.proto; do
  filename=$(basename -- "$file")         # auth.proto
  name="${filename%.*}"                   # auth
  target="$OUT_DIR/$name"                 # go/auth

echo "name file $name"
echo "target $target"
  # Buat folder target jika belum ada
  mkdir -p "$target"

  protoc \
    --go_out="$target" \
    --go-grpc_out="$target" \
    --go_opt=paths=source_relative \
    --go-grpc_opt=paths=source_relative \
    "$file"

  echo "✅ Generated for: $name → $target"
done
