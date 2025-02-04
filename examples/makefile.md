## Makefile Code Example

```makefile
# This is a demo Makefile showcasing various features and syntax

# Variables and assignments
# := is immediate assignment
CC := gcc
# = is recursive assignment
CFLAGS = -Wall -O2
# ?= assigns only if variable is not already set
DEBUG ?= 0
# += appends to existing variable
CFLAGS += -g

# Special variables
.DEFAULT_GOAL := all
.PHONY: all clean test

# Shell commands in variables
CURRENT_DIR := $(shell pwd)
FILES := $(shell ls *.c 2>/dev/null)

# Pattern substitution
SOURCES := foo.c bar.c baz.c
OBJECTS := $(SOURCES:.c=.o)
HEADERS := $(wildcard *.h)

# Conditional directives
ifeq ($(DEBUG), 1)
    CFLAGS += -DDEBUG -g
else
    CFLAGS += -DNDEBUG
endif

# Define colors for output
BLUE := \033[34m
RESET := \033[0m

# Multi-line variable definition with define
define HELP_TEXT
Available targets:
  all    : Build everything
  clean  : Remove generated files
  test   : Run tests
  help   : Show this help message
endef
export HELP_TEXT

# Default target
all: prepare $(OBJECTS)
    @echo "Building all targets..."
    $(CC) $(CFLAGS) -o program $(OBJECTS)

# Pattern rule for object files
%.o: %.c %.h
    @echo "$(BLUE)Compiling $<$(RESET)"
    @$(CC) $(CFLAGS) -c $< -o $@

# Static pattern rules
$(OBJECTS): %.o: %.c
    $(CC) $(CFLAGS) -c $< -o $@

# Target with multiple prerequisites
prepare: check-env create-dirs
    @echo "Preparation complete"

# Silent target (using @)
create-dirs:
    @mkdir -p build
    @mkdir -p dist

# Target with order-only prerequisites (after |)
dist/program: program | dist
    cp program dist/

# Using automatic variables
check-env:
    @echo "Current directory: $(@D)"
    @echo "Target name: $@"
    @echo "First prerequisite: $<"

# Target-specific variable
test: CFLAGS += -DTESTING
test: $(OBJECTS)
    @echo "Running tests with $(CFLAGS)"

# Include other makefiles
-include config.mk

# Using filter and filter-out
FILTER_EXAMPLE := $(filter %.c,$(FILES))
FILTER_OUT_EXAMPLE := $(filter-out main.c,$(SOURCES))

# Using foreach
paths := $(foreach file,$(FILES),$(CURRENT_DIR)/$(file))

# Clean target with wildcard
clean:
    @echo "Cleaning up..."
    -rm -f *.o program
    -rm -rf build dist

# Help target
help:
    @echo "$$HELP_TEXT"

# Error handling
check-compiler:
    @command -v $(CC) >/dev/null 2>&1 || \
        { echo "Error: $(CC) not found"; exit 1; }

# Secondary expansion example
.SECONDEXPANSION:
SECONDARY_DEPS = $(OBJECTS:.o=.d)
%.d: $$(%.o)
    @echo "Generating dependencies for $<"

# Grouped targets
.PHONY: build-all
build-all: lib app docs

# Pattern rules with multiple targets
%.pdf %.html: %.md
    pandoc $< -o $@

# Silent recipe execution
.SILENT: clean

# Parallel execution control
.NOTPARALLEL: critical-section

# Default pattern rule
%: %.c
    $(CC) $(CFLAGS) $< -o $@
```