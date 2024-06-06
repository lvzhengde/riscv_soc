###############################################################################
## variables
###############################################################################
OUTPUT_DIR ?= verilated
TEST_IMAGE ?= ../core/isa_sim/images/basic.elf
CORE       ?= rv32imsu

###############################################################################
## Makefile
###############################################################################
all: build

build:
	make -C ../core/isa_sim lib
	make -f generate_verilated.mk CORE=$(CORE)
	make -j -C $(OUTPUT_DIR) -f ../build_verilated.mk	
	make -f build_sysc_tb.mk

clean:
	make -C ../core/isa_sim $@
	make -f generate_verilated.mk  CORE=$(CORE) $@
	make -f build_sysc_tb.mk $@
	@rm -rf logs 

run: build
	./build/test.x -f $(TEST_IMAGE)
