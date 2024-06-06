###############################################################################
# Variables
###############################################################################
OUTPUT_DIR       ?= verilated
NAME             ?= riscv_soc

RTL_INCLUDE       = ../core/core/$(CORE)
RTL_INCLUDE      += ../soc

VERILATOR_INPUT  = -f input.vc 

# Verilator options
VERILATOR_OPTS   ?= --pins-sc-uint
VERILATOR_OPTS   += --trace
VERILATOR_OPTS   += -Wno-fatal

TARGETS          ?= $(OUTPUT_DIR)/V$(NAME)

###############################################################################
# Rules
###############################################################################
all: $(TARGETS)

$(TARGETS): 
	verilator --sc --top $(NAME) $(VERILATOR_INPUT) --Mdir $(OUTPUT_DIR) $(patsubst %,-I%,$(RTL_INCLUDE)) $(VERILATOR_OPTS) 

clean:
	@rm -rf  $(OUTPUT_DIR)
