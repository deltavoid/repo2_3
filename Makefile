

PACKAGE_NAME=repo2_3



ifdef USE_USER_LIB

    REPO2_1_PATH=$(PWD)/../repo2_1
	REPO2_2_PATH=$(PWD)/../repo2_2

    CMAKE_PREFIX_PATH="$(REPO2_1_PATH)/build;$(REPO2_2_PATH)/build"
    CMAKE_MODULE_PATH="test"
else
    CMAKE_PREFIX_PATH=""
    CMAKE_MODULE_PATH=""
endif





BUILD_DIR ?= build
.PHONY: build clean
# default: run




build: $(BUILD_DIR)/Makefile
	cd $(BUILD_DIR) && make

$(BUILD_DIR)/Makefile: Makefile
	mkdir -p $(BUILD_DIR) \
	&& cmake -S . -B $(BUILD_DIR) \
	    -DCMAKE_PREFIX_PATH=$(CMAKE_PREFIX_PATH) \
		-DCMAKE_MODULE_PATH=$(CMAKE_MODULE_PATH)

clean:	
	rm -rf $(BUILD_DIR)


install: $(BUILD_DIR)/Makefile
	cd $(BUILD_DIR) && make install

uninstall:
	-rm -rf /usr/local/lib/$(PACKAGE_NAME)
	-rm -rf /usr/local/lib/cmake/$(PACKAGE_NAME)
	-rm -rf /usr/local/include/$(PACKAGE_NAME)



run: build
	$(BUILD_DIR)/binary1/binary1
