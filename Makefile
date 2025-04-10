SRC_DIR = src
OUTPUT = TLC.SH
MINIFIED_DIR = src/minified

all: $(OUTPUT)
	@bash $(SRC_DIR)/compile.sh

minify:
	@bash $(SRC_DIR)/minify.sh

clean:
	@echo "Cleaning up..."
	@rm -f $(OUTPUT)
	@rm -rf $(MINIFIED_DIR)

.PHONY: all clean

