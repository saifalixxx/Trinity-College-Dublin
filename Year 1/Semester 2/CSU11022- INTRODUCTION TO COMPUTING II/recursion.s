  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  
  .global   quicksort
  .global   partition
  .global   swap

quicksort:
  PUSH    {R7, R8, R9, R10,LR}          @ Push registers R7, R8, R9, R10
                                        @ int quicksort (array, lo, hi)
  MOV R7, R0                            @ {
  MOV R8, R1
  MOV R9, R2

  CMP R8, R9                            @ if (lo < hi)
  BGE quickGreater                      @ {
  MOV R0, R7                            @ p = partition (array, lo, hi);
  MOV R1, R8                            
  MOV R2, R9                           

  BL partition

  MOV R10, R0                           @ quick sort (array, lo, p−1);
  MOV R0, R7
  MOV R1, R8
  SUB R2, R10, #1

  BL quicksort

  MOV R0, R7                            @ quicksort(array , p+1, hi);
  ADD R1, R10, #1
  MOV R2, R9                            

  BL quicksort                         

quickGreater :
  POP     {R7, R8, R9, R10, PC}         @ Pop registers R7, R8, R9, R10                 


partition:
  PUSH    {R6-R9, R10-R11, LR}          @ Pop regisers R6-R11  
                                        @ int partition    (array, lo, hi)
  MOV R10, R0                           @ {   
  MOV R7, R1
  MOV R11, R2
  LDR R6, [R10, R11, LSL #2]            @ pivot = array [hi];
  MOV R8, R7                            @ i = lo;

partLoop :         
  CMP R8, R11                           @ for(j = lo; j <= hi; j ++)
  BGT partTerminate                     @ {
  LDR R9, [R10, R8, LSL #2]             

  CMP R9, R6                            @ if (array [j]< pivot)
  BGE partLoop2                         @ {
  MOV R0, R10                           
  MOV R1, R7
  MOV R2, R8
  BL swap                               @ swap (array, i, j);
  ADD R7, R7, #1                        @ i = i + 1 

partLoop2 :
  ADD R8, R8, #1
   B partLoop

partTerminate :                         @ }
  MOV R0, R10
  MOV R1, R7
  MOV R2, R11
  BL swap                               @ swap (array, i, hi) 
  MOV R0, R7                            @ }

  POP     {R6-R9, R10-R11, PC}          @ Push regisers R6-R11                  


swap:
  PUSH    {R10, LR}                     @ Push register R10

  LDR R9, [R0, R1, LSL #2]              @ address = [addres + location]
  LDR R10, [R0, R2, LSL #2]             @ address = [addres + location]
  STR R10, [R0, R1, LSL #2]             @ address = [addres + location]
  STR R9, [R0, R2, LSL #2]              @ address = [addres + location]

  POP     {R10, PC}                     @ Pop register R10


.end