/******************************************************************************
* file: max-min_optimized.s
* author: Parth Sah, CS18M530
******************************************************************************/
@ BSS section
  .bss
  
@ DATA SECTION
  .data  
  data_items    : .word 10, 4, 28, 400, 100, 8, 800, -20, 123
  data_items_end: .word 0
  length        : .word (data_items_end - data_items)/4
  
  
@ TEXT section
  .text

.global _main

	 /* Registers with final output - 
			r0 = Count, 
			r1 = Min value, 
			r2 = Max value 
		For the given input data - r5 = 6, r1 = 0, r2 = 100*/
_main:
      	  
		EOR r2, r2, r2;      	@ max value, initialized to 0
		EOR r1, r1, r1;      	@ min value, initialized to 0
	   
	   
		LDR r4, =length;
		LDR r0, [r4];     		@ using r0 as a counter   
	    MOV r5, r0;       
	   
	   //Initial check for length
	   
		CMP r0, #0;
		BEQ END;	        		@ Terminate if  length is 0 
	    
	   
		LDR r4, =data_items; 	@ load data_items starting address
	   	LDR r1, [r4];		 	@ min value is 1st element
		LDR r2, [r4];		 	@ max value is 1st element
		
		SUBS r0, r0, #1;		@ decrement counter
		
       
loop: 
		ADD r4,r4, #4;
		LDR r3, [r4];
	    
		CMP r3, r2;
		MOVGT r2,r3;			@update MAx element
		
		CMP r3, r1;
		MOVLT r1, r3;			@ min value is updated if it is lesser than or equal to the existing min element
		
		
		
	 			       	
	
		SUBS r0, r0, #1;     	@ Decrement counter till 0
		BNE loop;	        	
	   
       // store length back to r0
END: 	MOV r0, r5;	     
