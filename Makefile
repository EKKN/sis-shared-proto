PROTO_DIR=proto
GEN_DIR=go

generate:
    protoc --go_out=$(GEN_DIR) --go_opt=paths=source_relative \
           --go-grpc_out=$(GEN_DIR) --go-grpc_opt=paths=source_relative \
           $(PROTO_DIR)/*.proto
