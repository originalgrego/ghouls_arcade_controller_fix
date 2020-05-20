 org  0
   incbin  "ghouls.bin"

 org $00B964
   jmp hijack_jump_tests
 
 org $00B81A
   jmp hijack_up_test
 
 org $00BACE
  ; jmp hijack_right_left_test ; Need to look at this again later
 
 org $00C020
   andi.w  #$3, D0
 
 org $061B8A
   NOP
   NOP

 org $061B9E
   NOP
   NOP

 org $061BB2
   NOP
   NOP

 org $061BC6
   NOP
   NOP
 
 org $0000A0 ; Free space
 
;---------------------------------------
hijack_jump_tests:
   move.b  (-$778a,A5), D0
   btst    #$3, D0
   beq     hijack_jump_tests_check_down

   jmp $00b9a8 ; Handle up

hijack_jump_tests_check_down:
   btst    #$2, D0
   beq  hijack_jump_tests_exit
   
   jmp $00b9d4 ; Handle down
   
hijack_jump_tests_exit:
   jmp  $00B97C
;---------------------------------------
   
;---------------------------------------
hijack_up_test:
   move.b  (-$778a,A5), D7
   btst    #$3, D7
   beq     hijack_up_test_exit
  
   jmp $00b83c
  
hijack_up_test_exit:
   jmp $00B82A
;---------------------------------------

;--------------------------------------
hijack_right_left_test:
   move.b  (-$778a,A5), D0
   btst    #$0, D0 ; test right
   bne     hijack_right_left_test_continue

   jmp $00baf8 ; Handle right

hijack_right_left_test_continue:
   btst    #$7, ($9,A1)
   bne     hijack_right_left_test_exit

   btst    #$1, D0 ; test left 
   bne     hijack_right_left_test_exit

   jmp $00BAFE
   
hijack_right_left_test_exit:
   jmp $00BB18
;--------------------------------------












 