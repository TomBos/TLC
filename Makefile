SRC_DIR = src
OUTPUT = TLC.sh

all:
	@awk '!/^\s*#/ && !/^\s*$$/' $(SRC_DIR)/script.sh > $(OUTPUT)

clean:
	@echo "Cleaning up..."
	@rm -f $(OUTPUT)
	@echo "Cleaning completed!"

.PHONY: all clean



