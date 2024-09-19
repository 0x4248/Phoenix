; SPDX-License-Identifier: GPL-3.0
; Phoenix
; 
; Kernel entry point
; 
; COPYRIGHT NOTICE
; Copyright (C) 2024 0x4248 and phoenix contributors
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the license is not changed.
; 
; This software is free and open source. Licensed under the GNU general
; public license version 3.0 as published by the Free Software Foundation.


bits 16

.start:
    cli
	; clear the registers
	xor ax, ax
	xor bx, bx
	xor cx, cx
	xor dx, dx
	; set the data segment to 0x0000

	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax
	; set the stack pointer to 0x9000
	mov sp, 0x9000
	sti
	
    jmp .main

.print_string:
    .print_char:
        lodsb
        or al, al
        jz .done
        mov ah, 0x0E
        int 0x10
        jmp .print_string
    .done:
        call .new_line
        ret

.new_line:
    mov ah, 0x0E
    mov al, 0x0A
    int 0x10
    mov al, 0x0D
    int 0x10
    ret

.wait_key:
    mov ah, 0
    int 0x16
    ret

.reboot:
    ; Clearing the screen first before rebooting
    ; Sometimes calling reboot (escpecially in QEMU) will not clear the screen
    mov ah, 0
    mov al, 3
    int 0x10
    
    int 0x19
    hlt

.main:
    mov si, msg0
    call .print_string
    mov si, msg1
    call .print_string
    call .new_line
    call .loop

.loop:
    mov si, msg2
    call .print_string
    call .wait_key
    cmp al, 'r'
    jne .loop
    call .reboot

msg0 db "Welcome to Phoenix system 1!", 0
msg1 db "Copyright (C) 2024 0x4248 GNU GPL v3", 0
msg2 db "System running, press r to reboot", 0