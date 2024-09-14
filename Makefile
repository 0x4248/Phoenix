# SPDX-License-Identifier: GPL-3.0
# Phoenix
#
# Main Makefile
#
# COPYRIGHT NOTICE
# Copyright (C) 2024 0x4248 and phoenix contributors
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the license is not changed.
# 
# This software is free and open source. Licensed under the GNU general
# public license version 3.0 as published by the Free Software Foundation.

# Directories
SRC = src
BIN = bin
CLEAN = $(BIN)

# Programs
NASM = nasm

# Targets
all: init build

init:
	mkdir -p $(BIN)wwwww
	
build:
	$(NASM) $(SRC)/boot.s -o $(BIN)/boot.bin

clean:
	rm -rf $(CLEAN)
	
run:
	qemu-system-x86_64 -fda $(BIN)/boot.bin