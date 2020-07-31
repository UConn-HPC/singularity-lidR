SINGULARITY = /opt/singularity-2.6/bin/singularity
TIME = command time -v
SHELL = /bin/bash
SOURCE = Singularity
TARGET = lidr.simg
BUILD_LOG = build.log

$(TARGET) : $(SOURCE)
	$(TIME) sudo $(SINGULARITY) build $@ $< | tee $(BUILD_LOG)
