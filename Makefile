SRC_DIR = src
MINIFIED_DIR = src/minified
OUTPUT = TLC.SH

all: minify $(OUTPUT)

# Target to run the minify script
minify:
	@echo "Running minification..."
	@bash $(SRC_DIR)/01_minify.sh
	@echo "Minification completed!"

# Target to generate TLC.SH from minified content
$(OUTPUT): $(MINIFIED_DIR)/00_compile.sh
	@echo "Running compile script..."
	@bash $(SRC_DIR)/00_compile.sh
	@echo "Compilation completed"

# Clean up minified files and output
clean:
	@echo "Cleaning up..."
	@rm -rf $(MINIFIED_DIR) $(OUTPUT)

.PHONY: all minify clean

