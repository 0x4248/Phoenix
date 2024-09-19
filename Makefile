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
	mkdir -p $(BIN)
	
build:
	$(NASM) $(SRC)/boot.s -o $(BIN)/boot.bin
	$(NASM) $(SRC)/kernel.s -o $(BIN)/kenrel.bin

	dd if=/dev/zero of=$(BIN)/floppy.img bs=512 count=2880
	dd if=$(BIN)/boot.bin of=$(BIN)/floppy.img conv=notrunc bs=512 count=1 seek=0
	dd if=$(BIN)/kenrel.bin of=$(BIN)/floppy.img conv=notrunc bs=512 count=2048 seek=1

clean:
	rm -rf $(CLEAN)
	
run:
	qemu-system-x86_64 -fda $(BIN)/floppy.img