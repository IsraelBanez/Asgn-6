; Recursively computes Fibonacci numbers.
; CSC 225, Assignment 6
; Given code, Winter '20

        .ORIG x4000

; int fib(int)
; TODO: Implement this function.
FIBFN   ADD R6, R6, #-1     ; Push space for the return value.
        ADD R6, R6, #-1     ; Push the return address.
        STR R7, R6, #0
        ADD R6, R6, #-1     ; Push the dynamic link.
        STR R5, R6, #0
        ADD R5, R6, #-1     ; Set the frame pointer.
                            
                            ; Local Varaiables
        ADD R6, R6, #-1     ; Push space for 'a'
        ADD R6, R6, #-1     ; Push space fpr 'b'
        
        LDR R0, R5, #4      ; Load 'n' into R0
        BRp FIBIF           ; If 'n <= 0'
        AND R0, R0, #0      ; Return 0.
        STR R0, R5, #3
        BRnzp FIBRET        ; END
        
FIBIF   AND R4, R4, #0      ; Clear R4
        ADD R4, R4, #-1     ; Set R4 to -1
        ADD R0, R0, R4      ; Check if n is 1
        BRp FIBELSE         ; IF 'n==1' 
        ADD R0, R0, #1      ; Return 1
        STR R0, R5, #3      
        BRnzp FIBRET        ; END
        
FIBELSE LDR R0, R5, #4
        ADD R0, R0, #-1     ; Compute 'n-1'
        ADD R6, R6, #-1     ; Push 'n-1'
        STR R0, R6, #0
        JSR FIBFN           ; Recurse
        
        LDR R1, R6, #0      ; Pop fib(n-1)
        ADD R6, R6, #1
        ADD R6, R6, #1      ; Pop 'n-1'
        STR R0, R5, #0      ; Set a to fib(n-1)
        
        LDR R0, R5, #4      
        ADD R0, R0, #-2     ; Compute 'n-2'
        ADD R6, R6, #-1     ; Push 'n-2' 
        STR R0, R6, #0
        JSR FIBFN           ; Recurse 
        
        LDR R1, R6, #0      ; Pop fib(n-2)
        ADD R6, R6, #1
        ADD R6, R6, #1      ; Pop 'n-2'
        STR R0, R5, #-1     ; Set b to fib(n-2)
        
        LDR R3, R5, #0      ; Load b into R3
        LDR R4, R5, #-1     ; Load a into R4
        
        AND R0, R0, #0      ; Clear R0
        ADD R0, R4, R3      ; 'a+b'
        STR R0, R5, #3
        
FIBRET  ADD R6, R6, #1      ; Pop a and b
        ADD R6, R6, #1      ;
        LDR R5, R6, #0      ; Pop the dynamic link.
        ADD R6, R6, #1
        LDR R7, R6, #0      ; Pop the return address.
        ADD R6, R6, #1
        RET                 ; Return.
        
        .END
