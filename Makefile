APP_NAME := wheres_the_money

APP_PATH := .

BIN_DIR := bin

.PHONY: all build run clean tidy

build: $(BIN_DIR)/$(APP_NAME)
$(BIN_DIR)/$(APP_NAME):
	@echo "Building $(APP_NAME)..."
	@mkdir -p $(BIN_DIR) # Ensure bin directory exists
	@go build $(BUILD_FLAGS) -o $(BIN_DIR)/$(APP_NAME) $(APP_PATH)
	@echo "Build complete: $(BIN_DIR)/$(APP_NAME)"

run: build
	@echo "Running $(APP_NAME)..."
	@$(BIN_DIR)/$(APP_NAME)

clean:
	@echo "Cleaning up..."
	@rm -rf $(BIN_DIR) # Remove compiled binaries
	@go clean -modcache # Clear module download cache
	@echo "Clean complete."

tidy:
	@echo "Tidying Go modules..."
	@go mod tidy
	@echo "Go modules tidied."
