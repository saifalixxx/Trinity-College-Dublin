  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:
  LDR R0, =0                      // Initialisation {
  LDR R5, =0                     //  }

While :                          @ {
  CMP R5, #32                    @ x >= ' '
  BHS EndWhile          
  MOVS R1, R1, LSL #1            @ bit value = bit value logical shift left by 1
  BLO NotOne
  ADD R0, R0, #1                 @  result = result + 1
   
NotOne :
  ADD R5, R5, #1                 @ x = x + 1 
   B While                       // Loop 
   
EndWhile :                       @ }
  CMP R0, #15                    @ result == 15
  BEQ IfExit                    
   B  End_Main

IfExit :
  MOV R0, #6                     @ result = 6
                                 
        

End_Main:
  BX    lr

.end
