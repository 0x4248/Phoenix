; SPDX-License-Identifier: GPL-3.0
; Phoenix
; 
; Main bootloader code
; 
; COPYRIGHT NOTICE
; Copyright (C) 2024 0x4248 and phoenix contributors
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the license is not changed.
; 
; This software is free and open source. Licensed under the GNU general
; public license version 3.0 as published by the Free Software Foundation.

org 0x7C00
bits 16

.start:
    jmp .jump_to_kernel
    
.jump_to_kernel:
    mov ah, 0x2
    mov dl, 0x80
    mov al, 10
    mov cl, 2
    mov bx, 0x8000
    int 0x13

    jmp 0x8000

times 510 - ($ - $$) db 0
dw 0xAA55
