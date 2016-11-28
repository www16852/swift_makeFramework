PWD=$(shell pwd)
LIB_PATH = HelloString
LIBNAME = HelloString
APP_NAME = printhello
LIB_BUILD_PATH=$(BUILD_PATH)
BUILD_PATH=$(PWD)/build
SOURCES = hello.swift

build:	clean
	mkdir -p build
	swiftc \
		-emit-library \
		-o $(LIB_BUILD_PATH)/lib$(LIBNAME).dylib \
		-Xlinker -install_name \
		-Xlinker @rpath/lib$(LIBNAME).dylib \
		-emit-module \
		-emit-module-path $(LIB_BUILD_PATH)/$(LIBNAME).swiftmodule \
		-module-name $(LIBNAME) \
		-module-link-name $(LIBNAME) \
		-v \
		$(LIBNAME)/*.swift

	
	swiftc $(SOURCES) \
		-o $(BUILD_PATH)/$(APP_NAME) \
		-I $(LIB_BUILD_PATH) \
		-L $(LIB_BUILD_PATH) \
		-Xlinker -rpath \
		-Xlinker @executable_path/ \
		-v


clean:
	rm -rf build