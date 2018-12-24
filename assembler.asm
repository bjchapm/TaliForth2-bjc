; Assembler for Tali Forth 2 
; Scot W. Stevenson <scot.stevenson@gmail.com>
; First version: 07. Nov 2014 (as tasm65c02)
; This version: 18. Dez 2018

; This is the built-in assembler for Tali Forth 2. Once the assembler wordlist
; is included with

;       assembler-wordlist >order

; , the opcodes are available as normal Forth words. The format
; is Simpler Assembler Notation (SAN) which separates the opcode completely
; from the operand. In this case, the operand is entered before the opcode in
; the postfix Forth notation (for example, "2000 lda.#"). See the
; assembler documenation in the manual for more detail.

; The code here was originally used in A Typist's Assembler for the 65c02
; (tasm65c02), see https://github.com/scotws/tasm65c02 for the standalone
; version. Tasm65c02 is in the public domain.

; This code makes use of the opcode tables stored as part of the disassembler.

; ==========================================================
; MNEMONICS

; The assembler instructions are realized as individual Forth words with
; entries in the assembler wordlist (see header.asm). We pass the opcode in A.
; Note an alterantive method would be along the lines of

;               jsr asm_common
;               .byte $EA

; where the asm_common then uses the address on the Return Stack to pick up the
; opcode and the length. Though this uses fewer resources, the current version
; makes up for this by simplifying the code of asm_common.

; The routines are organized alphabetically by SAN mnemonic, not by opcode. The
; SAN and traditional mnemonics are listed after the opcode load instruction.
; This list was generated by a Python script in the tools folder, see there
; for more detail

assembler:              ; used to calculate size of assembler code

xt_asm_adc_h:   ; adc.# \ ADC #nn
                lda #$69
                jmp asm_common
z_asm_adc_h:

xt_asm_adc_x:   ; adc.x \ ADC nnnn,X
                lda #$7D
                jmp asm_common
z_asm_adc_x:

xt_asm_adc_y:   ; adc.y \ ADC nnnn,Y
                lda #$79
                jmp asm_common
z_asm_adc_y:

xt_asm_adc_z:   ; adc.z \ ADC nn
                lda #$65
                jmp asm_common
z_asm_adc_z:

xt_asm_adc_zi:  ; adc.zi \ ADC (nn)
                lda #$72
                jmp asm_common
z_asm_adc_zi:

xt_asm_adc_ziy: ; adc.ziy \ ADC (nn),Y
                lda #$71
                jmp asm_common
z_asm_adc_ziy:

xt_asm_adc_zx:  ; adc.zx \ ADC nn,X
                lda #$75
                jmp asm_common
z_asm_adc_zx:

xt_asm_adc_zxi: ; adc.zxi \ ADC (nn,X)
                lda #$61
                jmp asm_common
z_asm_adc_zxi:

xt_asm_and:     ; and. \ AND nnnn
                lda #$2D
                jmp asm_common
z_asm_and:

xt_asm_and_h:   ; and.# \ AND #nn
                lda #$29
                jmp asm_common
z_asm_and_h:

xt_asm_and_x:   ; and.x \ AND nnnn,X
                lda #$3D
                jmp asm_common
z_asm_and_x:

xt_asm_and_y:   ; and.y \ AND nnnn,Y
                lda #$39
                jmp asm_common
z_asm_and_y:

xt_asm_and_z:   ; and.z \ AND nn
                lda #$25
                jmp asm_common
z_asm_and_z:

xt_asm_and_zi:  ; and.zi \ AND (nn)
                lda #$32
                jmp asm_common
z_asm_and_zi:

xt_asm_and_ziy: ; and.ziy \ AND (nn),Y
                lda #$31
                jmp asm_common
z_asm_and_ziy:

xt_asm_and_zx:  ; and.zx \ AND nn,X
                lda #$35
                jmp asm_common
z_asm_and_zx:

xt_asm_and_zxi: ; and.zxi \ AND (nn,X)
                lda #$21
                jmp asm_common
z_asm_and_zxi:

xt_asm_asl:     ; asl \ ASL nnnn
                lda #$0E
                jmp asm_common
z_asm_asl:

xt_asm_asl_a:   ; asl.a \ ASL
                lda #$0A
                jmp asm_common
z_asm_asl_a:

xt_asm_asl_x:   ; asl.x \ ASL nnnn,X
                lda #$1E
                jmp asm_common
z_asm_asl_x:

xt_asm_asl_z:   ; asl.z \ ASL nn
                lda #$06
                jmp asm_common
z_asm_asl_z:

xt_asm_asl_zx:  ; asl.zx \ ASL nn,X
                lda #$16
                jmp asm_common
z_asm_asl_zx:

xt_asm_bcc:     ; bcc \ BCC
                lda #$90
                jmp asm_common
z_asm_bcc:

xt_asm_bcs:     ; bcs \ BCS
                lda #$B0
                ldy #2
                jmp asm_common
z_asm_bcs:

xt_asm_beq:     ; beq \ BEQ
                lda #$F0
                jmp asm_common
z_asm_beq:

xt_asm_bit:     ; bit \ BIT nnnn
                lda #$2C
                jmp asm_common
z_asm_bit:

xt_asm_bit_h:   ; bit.# \ BIT #nn
                lda #$89
                jmp asm_common
z_asm_bit_h:

xt_asm_bit_x:   ; bit.x \ BIT nnnn,X
                lda #$3C
                jmp asm_common
z_asm_bit_x:

xt_asm_bit_z:   ; bit.z \ BIT nn
                lda #$24
                jmp asm_common
z_asm_bit_z:

xt_asm_bit_zx:  ; bit.zx \ BIT nn,X
                lda #$34
                jmp asm_common
z_asm_bit_zx:

xt_asm_bmi:     ; bmi \ BMI
                lda #$30
                jmp asm_common
z_asm_bmi:

xt_asm_bne:     ; bne \ BNE
                lda #$D0
                jmp asm_common
z_asm_bne:

xt_asm_bpl:     ; bpl \ BPL
                lda #$10
                jmp asm_common
z_asm_bpl:

xt_asm_bra:     ; bra \ BRA
                lda #$80
                jmp asm_common
z_asm_bra:

xt_asm_brk:     ; brk \ BRK
                lda #$00
                jmp asm_common
z_asm_brk:

xt_asm_bvc:     ; bvc \ BVC
                lda #$50
                jmp asm_common
z_asm_bvc:

xt_asm_bvs:     ; bvs \ BVS
                lda #$70
                jmp asm_common
z_asm_bvs:

xt_asm_clc:     ; clc \ CLC
                lda #$18
                jmp asm_common
z_asm_clc:

xt_asm_cld:     ; cld \ CLD
                lda #$D8
                jmp asm_common
z_asm_cld:

xt_asm_cli:     ; cli \ CLI
                lda #$58
                jmp asm_common
z_asm_cli:

xt_asm_clv:     ; clv \ CLV
                lda #$B8
                jmp asm_common
z_asm_clv:

xt_asm_cmp:     ; cmp \ CMP nnnn
                lda #$CD
                jmp asm_common
z_asm_cmp:

xt_asm_cmp_h:   ; cmp.# \ CMP #nn
                lda #$C9
                jmp asm_common
z_asm_cmp_h:

xt_asm_cmp_x:   ; cmp.x \ CMP nnnn,X
                lda #$DD
                jmp asm_common
z_asm_cmp_x:

xt_asm_cmp_y:   ; cmp.y \ CMP nnnn,Y
                lda #$D9
                jmp asm_common
z_asm_cmp_y:

xt_asm_cmp_z:   ; cmp.z \ CMP nn
                lda #$C5
                jmp asm_common
z_asm_cmp_z:

xt_asm_cmp_zi:  ; cmp.zi \ CMP (nn)
                lda #$D2
                jmp asm_common
z_asm_cmp_zi:

xt_asm_cmp_ziy: ; cmp.ziy \ CMP (nn),Y
                lda #$D1
                jmp asm_common
z_asm_cmp_ziy:

xt_asm_cmp_zx:  ; cmp.zx \ CMP nn,X
                lda #$D5
                jmp asm_common
z_asm_cmp_zx:

xt_asm_cmp_zxi: ; cmp.zxi \ CMP (nn,X)
                lda #$C1
                jmp asm_common
z_asm_cmp_zxi:

xt_asm_cpx:     ; cpx \ CPX nnnn
                lda #$EC
                jmp asm_common
z_asm_cpx:

xt_asm_cpx_h:   ; cpx.# \ CPX #nn
                lda #$E0
                jmp asm_common
z_asm_cpx_h:

xt_asm_cpx_z:   ; cpx.z \ CPX nn
                lda #$E4
                jmp asm_common
z_asm_cpx_z:

xt_asm_cpy:     ; cpy \ CPY
                lda #$CC
                ldy #3
                jmp asm_common
z_asm_cpy:

xt_asm_cpy_h:   ; cpy.# \ CPY #nn
                lda #$C0
                jmp asm_common
z_asm_cpy_h:

xt_asm_cpy_z:   ; cpy.z \ CPY nn
                lda #$C4
                jmp asm_common
z_asm_cpy_z:

xt_asm_dec:     ; dec \ DEC nnnn
                lda #$CE
                jmp asm_common
z_asm_dec:

xt_asm_dec_a:   ; dec.a \ DEC
                lda #$3A
                jmp asm_common
z_asm_dec_a:

xt_asm_dec_x:   ; dec.x \ DEC nnnn,X
                lda #$DE
                jmp asm_common
z_asm_dec_x:

xt_asm_dec_z:   ; dec.z \ DEC nn
                lda #$C6
                jmp asm_common
z_asm_dec_z:

xt_asm_dec_zx:  ; dec.zx \ DEC nn,X
                lda #$D6
                jmp asm_common
z_asm_dec_zx:

xt_asm_dex:     ; dex \ DEX
                lda #$CA
                jmp asm_common
z_asm_dex:

xt_asm_dey:     ; dey \ DEY
                lda #$88
                jmp asm_common
z_asm_dey:

xt_asm_eor:     ; eor \ EOR nnnn
                lda #$4D
                jmp asm_common
z_asm_eor:

xt_asm_eor_h:   ; eor.# \ EOR #nn
                lda #$49
                jmp asm_common
z_asm_eor_h:

xt_asm_eor_x:   ; eor.x \ EOR nnnn,X
                lda #$5D
                jmp asm_common
z_asm_eor_x:

xt_asm_eor_y:   ; eor.y \ EOR nnnn,Y
                lda #$59
                jmp asm_common
z_asm_eor_y:

xt_asm_eor_z:   ; eor.z \ EOR nn
                lda #$45
                jmp asm_common
z_asm_eor_z:

xt_asm_eor_zi:  ; eor.zi \ EOR (nn)
                lda #$52
                jmp asm_common
z_asm_eor_zi:

xt_asm_eor_ziy: ; eor.ziy \ EOR (nn),Y
                lda #$51
                jmp asm_common
z_asm_eor_ziy:

xt_asm_eor_zx:  ; eor.zx \ EOR nn,X
                lda #$55
                jmp asm_common
z_asm_eor_zx:

xt_asm_eor_zxi: ; eor.zxi \ EOR (nn,X)
                lda #$41
                jmp asm_common
z_asm_eor_zxi:

xt_asm_inc:     ; inc \ INC nnnn
                lda #$EE
                jmp asm_common
z_asm_inc:

xt_asm_inc_a:   ; inc.a \ INC
                lda #$1A
                jmp asm_common
z_asm_inc_a:

xt_asm_inc_x:   ; inc.x \ INC nnnn,X
                lda #$FE
                jmp asm_common
z_asm_inc_x:

xt_asm_inc_z:   ; inc.z \ INC nn
                lda #$E6
                jmp asm_common
z_asm_inc_z:

xt_asm_inc_zx:  ; inc.zx \ INC nn,X
                lda #$F6
                jmp asm_common
z_asm_inc_zx:

xt_asm_inx:     ; inx \ INX
                lda #$E8
                jmp asm_common
z_asm_inx:

xt_asm_iny:     ; iny \ INY
                lda #$C8
                jmp asm_common
z_asm_iny:

xt_asm_jmp:     ; jmp \ JMP nnnn
                lda #$4C
                jmp asm_common
z_asm_jmp:

xt_asm_jmp_i:   ; jmp.i \ JMP (nnnn)
                lda #$6C
                jmp asm_common
z_asm_jmp_i:

xt_asm_jmp_xi:  ; jmp.xi \ JMP (nnnn,X)
                lda #$7C
                jmp asm_common
z_asm_jmp_xi:

xt_asm_jsr:     ; jsr \ JSR nnnn
                lda #$20
                jmp asm_common
z_asm_jsr:

xt_asm_lda:     ; lda \ LDA nnnn
                lda #$AD
                jmp asm_common
z_asm_lda:

xt_asm_lda_h:   ; lda.# \ LDA #nn
                lda #$A9
                jmp asm_common
z_asm_lda_h:

xt_asm_lda_x:   ; lda.x \ LDA nnnn,X
                lda #$BD
                jmp asm_common
z_asm_lda_x:

xt_asm_lda_y:   ; lda.y \ LDA nnnn,Y
                lda #$B9
                jmp asm_common
z_asm_lda_y:

xt_asm_lda_z:   ; lda.z \ LDA nn
                lda #$A5
                jmp asm_common
z_asm_lda_z:

xt_asm_lda_zi:  ; lda.zi \ LDA (nn)
                lda #$B2
                jmp asm_common
z_asm_lda_zi:

xt_asm_lda_ziy: ; lda.ziy \ LDA (nn),Y
                lda #$B1
                jmp asm_common
z_asm_lda_ziy:

xt_asm_lda_zx:  ; lda.zx \ LDA nn,X
                lda #$B5
                jmp asm_common
z_asm_lda_zx:

xt_asm_lda_zxi: ; lda.zxi \ LDA (nn,X)
                lda #$A1
                jmp asm_common
z_asm_lda_zxi:

xt_asm_ldx:     ; ldx \ LDX nnnn
                lda #$AE
                jmp asm_common
z_asm_ldx:

xt_asm_ldx_h:   ; ldx.# \ LDX #nn
                lda #$A2
                jmp asm_common
z_asm_ldx_h:

xt_asm_ldx_y:   ; ldx.y \ LDX nnnn,Y
                lda #$BE
                jmp asm_common
z_asm_ldx_y:

xt_asm_ldx_z:   ; ldx.z \ LDX nn
                lda #$A6
                jmp asm_common
z_asm_ldx_z:

xt_asm_ldx_zy:  ; ldx.zy \ LDX nn,Y
                lda #$B6
                jmp asm_common
z_asm_ldx_zy:

xt_asm_ldy:     ; ldy \ LDY nnnn
                lda #$AC
                jmp asm_common
z_asm_ldy:

xt_asm_ldy_h:   ; ldy.# \ LDY #nn
                lda #$A0
                jmp asm_common
z_asm_ldy_h:

xt_asm_ldy_x:   ; ldy.x \ LDY nnnn,X
                lda #$BC
                jmp asm_common
z_asm_ldy_x:

xt_asm_ldy_z:   ; ldy.z \ LDY nn
                lda #$A4
                jmp asm_common
z_asm_ldy_z:

xt_asm_ldy_zx:  ; ldy.zx \ LDY nn,X
                lda #$B4
                jmp asm_common
z_asm_ldy_zx:

xt_asm_lsr:     ; lsr \ LSR nnnn
                lda #$4E
                jmp asm_common
z_asm_lsr:

xt_asm_lsr_a:   ; lsr.a \ LSR
                lda #$4A
                jmp asm_common
z_asm_lsr_a:

xt_asm_lsr_x:   ; lsr.x \ LSR nnnn,X
                lda #$5E
                jmp asm_common
z_asm_lsr_x:

xt_asm_lsr_z:   ; lsr.z \ LSR nn
                lda #$46
                jmp asm_common
z_asm_lsr_z:

xt_asm_lsr_zx:  ; lsr.zx \ LSR nn,X
                lda #$56
                jmp asm_common
z_asm_lsr_zx:

xt_asm_nop:     ; nop \ NOP
                lda #$EA
                jmp asm_common
z_asm_nop:

xt_asm_ora:     ; ora \ ORA nnnn
                lda #$0D
                jmp asm_common
z_asm_ora:

xt_asm_ora_h:   ; ora.# \ ORA #nn
                lda #$09
                jmp asm_common
z_asm_ora_h:

xt_asm_ora_x:   ; ora.x \ ORA nnnn,X
                lda #$1D
                jmp asm_common
z_asm_ora_x:

xt_asm_ora_y:   ; ora.y \ ORA nnnn,Y
                lda #$19
                jmp asm_common
z_asm_ora_y:

xt_asm_ora_z:   ; ora.z \ ORA nn
                lda #$05
                jmp asm_common
z_asm_ora_z:

xt_asm_ora_zi:  ; ora.zi \ ORA.ZI
                lda #$12
                ldy #2
                jmp asm_common
z_asm_ora_zi:

xt_asm_ora_ziy: ; ora.ziy \ ORA (nn),Y
                lda #$11
                jmp asm_common
z_asm_ora_ziy:

xt_asm_ora_zx:  ; ora.zx \ ORA nn,X
                lda #$15
                jmp asm_common
z_asm_ora_zx:

xt_asm_ora_zxi: ; ora.zxi \ ORA (nn,X)
                lda #$01
                jmp asm_common
z_asm_ora_zxi:

xt_asm_pha:     ; pha \ PHA
                lda #$48
                jmp asm_common
z_asm_pha:

xt_asm_php:     ; php \ PHP
                lda #$08
                jmp asm_common
z_asm_php:

xt_asm_phx:     ; phx \ PHX
                lda #$DA
                jmp asm_common
z_asm_phx:

xt_asm_phy:     ; phy \ PHY
                lda #$5A
                jmp asm_common
z_asm_phy:

xt_asm_pla:     ; pla \ PLA
                lda #$68
                jmp asm_common
z_asm_pla:

xt_asm_plp:     ; plp \ PLP
                lda #$28
                jmp asm_common
z_asm_plp:

xt_asm_plx:     ; plx \ PLX
                lda #$FA
                jmp asm_common
z_asm_plx:

xt_asm_ply:     ; ply \ PLY
                lda #$7A
                jmp asm_common
z_asm_ply:

xt_asm_rol:     ; rol \ ROL nnnn
                lda #$2E
                jmp asm_common
z_asm_rol:

xt_asm_rol_a:   ; rol.a \ ROL
                lda #$2A
                jmp asm_common
z_asm_rol_a:

xt_asm_rol_x:   ; rol.x \ ROL nnnn,X
                lda #$3E
                jmp asm_common
z_asm_rol_x:

xt_asm_rol_z:   ; rol.z \ ROL nn
                lda #$26
                jmp asm_common
z_asm_rol_z:

xt_asm_rol_zx:  ; rol.zx \ ROL nn,X
                lda #$36
                jmp asm_common
z_asm_rol_zx:

xt_asm_ror:     ; ror \ ROR nnnn
                lda #$6E
                jmp asm_common
z_asm_ror:

xt_asm_ror_a:   ; ror.a \ ROR
                lda #$6A
                jmp asm_common
z_asm_ror_a:

xt_asm_ror_x:   ; ror.x \ ROR nnnn,X
                lda #$7E
                jmp asm_common
z_asm_ror_x:

xt_asm_ror_z:   ; ror.z \ ROR nn
                lda #$66
                jmp asm_common
z_asm_ror_z:

xt_asm_ror_zx:  ; ror.zx \ ROR nn,X
                lda #$76
                jmp asm_common
z_asm_ror_zx:

xt_asm_rti:     ; rti \ RTI
                lda #$40
                jmp asm_common
z_asm_rti:

xt_asm_rts:     ; rts \ RTS
                lda #$60
                jmp asm_common
z_asm_rts:

xt_asm_sbc:     ; sbc \ SBC nnnn
                lda #$ED
                jmp asm_common
z_asm_sbc:

xt_asm_sbc_h:   ; sbc.# \ SBC #nn
                lda #$E9
                jmp asm_common
z_asm_sbc_h:

xt_asm_sbc_x:   ; sbc.x \ SBC nnnn,X
                lda #$FD
                jmp asm_common
z_asm_sbc_x:

xt_asm_sbc_y:   ; sbc.y \ SBC nnnn,Y
                lda #$F9
                jmp asm_common
z_asm_sbc_y:

xt_asm_sbc_z:   ; sbc.z \ SBC nn
                lda #$E5
                jmp asm_common
z_asm_sbc_z:

xt_asm_sbc_zi:  ; sbc.zi \ SBC (nn)
                lda #$F2
                jmp asm_common
z_asm_sbc_zi:

xt_asm_sbc_ziy: ; sbc.ziy \ SBC (nn),Y
                lda #$F1
                jmp asm_common
z_asm_sbc_ziy:

xt_asm_sbc_zx:  ; sbc.zx \ SBC nn,X
                lda #$F5
                jmp asm_common
z_asm_sbc_zx:

xt_asm_sbc_zxi: ; sbc.zxi \ SBC (nn,X)
                lda #$E1
                bra asm_common          ; <-- limit for BRA instead of JMP
z_asm_sbc_zxi:

xt_asm_sec:     ; sec \ SEC
                lda #$38
                bra asm_common
z_asm_sec:

xt_asm_sed:     ; sed \ SED
                lda #$F8
                bra asm_common
z_asm_sed:

xt_asm_sei:     ; sei \ SEI
                lda #$78
                bra asm_common
z_asm_sei:

xt_asm_sta:     ; sta \ STA nnnn
                lda #$8D
                bra asm_common
z_asm_sta:

xt_asm_sta_x:   ; sta.x \ STA nnnn,X
                lda #$9D
                bra asm_common
z_asm_sta_x:

xt_asm_sta_y:   ; sta.y \ STA nnnn,Y
                lda #$99
                bra asm_common
z_asm_sta_y:

xt_asm_sta_z:   ; sta.z \ STA nn
                lda #$85
                bra asm_common
z_asm_sta_z:

xt_asm_sta_zi:  ; sta.zi \ STA (nn)
                lda #$92
                bra asm_common
z_asm_sta_zi:

xt_asm_sta_ziy: ; sta.ziy \ STA (nn),Y
                lda #$91
                bra asm_common
z_asm_sta_ziy:

xt_asm_sta_zx:  ; sta.zx \ STA nn,X
                lda #$95
                bra asm_common
z_asm_sta_zx:

xt_asm_sta_zxi: ; sta.zxi \ STA (nn,X)
                lda #$81
                bra asm_common
z_asm_sta_zxi:

xt_asm_stx:     ; stx \ STX nnnn
                lda #$8E
                bra asm_common
z_asm_stx:

xt_asm_stx_z:   ; stx.z \ STX nn
                lda #$86
                bra asm_common
z_asm_stx_z:

xt_asm_stx_zy:  ; stx.zy \ STX nn,Y
                lda #$96
                bra asm_common
z_asm_stx_zy:

xt_asm_sty:     ; sty \ STY nnnn
                lda #$8C
                bra asm_common
z_asm_sty:

xt_asm_sty_z:   ; sty.z \ STY nn
                lda #$84
                bra asm_common
z_asm_sty_z:

xt_asm_sty_zx:  ; sty.zx \ STY nn,X
                lda #$94
                bra asm_common
z_asm_sty_zx:

xt_asm_stz:     ; stz \ STZ nnnn
                lda #$9C
                bra asm_common
z_asm_stz:

xt_asm_stz_x:   ; stz.x \ STZ nnnn,X
                lda #$9E
                bra asm_common
z_asm_stz_x:

xt_asm_stz_z:   ; stz.z \ STZ nn
                lda #$64
                bra asm_common
z_asm_stz_z:

xt_asm_stz_zx:  ; stz.zx \ STZ nn,X
                lda #$74
                bra asm_common
z_asm_stz_zx:

xt_asm_tax:     ; tax \ TAX
                lda #$AA
                bra asm_common
z_asm_tax:

xt_asm_tay:     ; tay \ TAY
                lda #$A8
                bra asm_common
z_asm_tay:

xt_asm_trb:     ; trb \ TRB nnnn
                lda #$1C
                bra asm_common
z_asm_trb:

xt_asm_trb_z:   ; trb.z \ TRB nn
                lda #$14
                bra asm_common
z_asm_trb_z:

xt_asm_tsb:     ; tsb \ TSB nnnn
                lda #$0C
                bra asm_common
z_asm_tsb:

xt_asm_tsb_z:   ; tsb.z \ TSB nn
                lda #$04
                bra asm_common
z_asm_tsb_z:

xt_asm_tsx:     ; tsx \ TSX
                lda #$BA
                bra asm_common
z_asm_tsx:

xt_asm_txa:     ; txa \ TXA
                lda #$8A
                bra asm_common
z_asm_txa:

xt_asm_txs:     ; txs \ TXS
                lda #$9A
                bra asm_common
z_asm_txs:

xt_asm_tya:     ; tya \ TYA
                lda #$98
                bra asm_common
z_asm_tya:


; ==========================================================
; ASSEMBLER HELPER FUNCTIONS

asm_common:
.scope
        
        ; """Common routine for all opcodes. We arrive here with the opcode in
        ; A. We do not need to check for the correct values because we are
        ; coming from the assembler Dictionary and trust our external test
        ; suite.
        ; """
                ; Compile opcode. Note cmpl_a does not use Y, so we can save
                ; the opcode there
                tay
                jsr cmpl_a

                ; We get the length of the opcode from the table included in
                ; the disassembler. We use the opcode value as the offset in
                ; the oc_index_table. We have 256 entries, each two bytes
                ; long, so we can't just use an index with Y. We use tmp2 for
                ; this.
                lda #<oc_index_table
                sta tmp2
                lda #>oc_index_table
                sta tmp2+1

                tya             ; retrieve opcode
                asl             ; times two for offset
                bcc+
                inc tmp2+1
*
                tay             ; use Y as the index

                ; Get address of the entry in the opcode table. We put it in
                ; tmp3 and push a copy of it to the stack to be able to print
                ; the opcode later
                lda (tmp2),y    ; LSB
                sta tmp3
                iny
                lda (tmp2),y    ; MSB
                sta tmp3+1

                lda (tmp3)      ; get "lengths byte"

                ; The length of the instruction is stored in bits 7 and 6.
                ; rotate them through the carry flag and mask the rest
                rol
                rol
                rol             ; Three times because we go through Carry
                and #%00000011
                tay

                cpy #1          ; One byte means no operand, we're done
                beq _done

                ; We have an operand which must be TOS
                jsr underflow_1

                ; We compile the LSB of TOS as the operand we definitely have
                ; before we even test if this is a two- or three-byte
                ; instruction. Little endian CPU means we store this byte first
                lda 0,x
                jsr cmpl_a

                ; If this is a two-byte instruction, we're done
                cpy #2
                beq _done_drop

                ; This must be a three-byte instruction, get the MSB. 
                lda 1,x
                jsr cmpl_a      ; Fall through to _done_drop

_done_drop:
                inx
                inx             ; Fall through to _done
_done:
                rts             ; Returns to original caller
.scend  


; ==========================================================
; PSEUDO-INSTRUCTIONS AND MACROS

xt_asm_push_a:
        ; """push-a puts the content of the 65c02 Accumulator on the Forth
        ; data stack as the TOS. This is a convience routine that encodes the
        ; instructions  DEX  DEX  STA 0,X  STZ 1,X
        ; """
        ; TODO if we have more than one pseudo-instruction like this, consider
        ; using a common loop for the various byte sequences
.scope
                ldy #0
_loop:
                lda _data,y
                cmp #$FF
                beq _done

                jsr cmpl_a      ; does not change Y
                iny
                bra _loop
_done:
z_asm_push_a:
                rts
_data:
        ; We can't use 00 as a terminator because STA 0,X assembles to 95 00
        .byte $CA, $CA, $95, 00, $74, $01 
        .byte $FF               ; terminator 
.scend


; ==========================================================
; DIRECTIVES

; The "<J" directive (back jump) is a dummy instruction (syntactic sugar) to
; make clear that the JMP or JSR instructions are using the address that had
; been placed on the stack by "->" (the "arrow" directive).
xt_asm_back_jump:
z_asm_back_jump:
                rts
      
; The "<B" directive (back branch) takes an address that was placed on the Data
; Stack by the anonymous label directive "->" (the "arrow") and the current
; address (via HERE) to calculate a backward branch offset. This is then stored
; by a following branch instruction. 
xt_asm_back_branch:
                ; We arrive here with ( addr-l ) of the label on the stack and
                ; then subtract the current address
                jsr xt_here             ; ( addr-l addr-h )
                jsr xt_minus            ; ( offset )

                ; We subtract two more because of the branch instruction itself
                dec
                dec

z_asm_back_branch:
                rts

assembler_end:

; END
