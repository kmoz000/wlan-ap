.PHONY: all purge

all:
	@echo "Running: ./dock-run.sh ./build.sh $(TARGET)"
	./dock-run.sh ./build.sh  $(TARGET)

purge:
	cd openwrt && rm -rf * && rm -rf .*
	@echo Done
