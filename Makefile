SRC_DIR = src
OUTPUT = TLC.sh

build:
	@echo "Minifying files..."
	@awk '!/^\s*#/ && !/^\s*$$/' $(SRC_DIR)/script.sh > $(OUTPUT)
	@echo "Build completed !"

deploy:
	@echo "Starting deploy proccess..."
	@$(SRC_DIR)/build.sh
	@rm -rf $(SRC_DIR)
	@echo "Deploy finished !"
	@git status

clean:
	@echo "Cleaning up..."
	@rm -f $(OUTPUT)
	@echo "Cleaning completed!"

.PHONY: all clean



