\ Example 1 - basics

\ Words consume all of their parameters (e.g., .).  If there is a
\ convention on the order of parameters (e.g., from mathematics or
\ another programming language), stick with it (e.g., -).  If one
\ parameter usually requires only a short computation (e.g., it is a
\ constant), pass it on the top of the stack. Conversely, parameters
\ that usually require a long sequence of code to compute should be
\ passed as the bottom (i.e., first) parameter. This makes the code
\ easier to read, because the reader does not need to keep track of
\ the bottom item through a long sequence of code (or,
\ alternatively, through stack manipulations). E.g., ! (store, see
\ Memory) expects the address on top of the stack because it is
\ usually simpler to compute than the stored value (often the
\ address is just a variable).  Similarly, results that are usually
\ consumed quickly should be returned on the top of stack, whereas a
\ result that is often used in long computations should be passed as
\ bottom result. E.g., the file words like open-file return the
\ error code on the top of stack, because it is usually consumed
\ quickly by throw; moreover, the error code has to be checked
\ before doing anything with the other results.

\ 2 3 4 + ( stack )
\ 3 2 1 swap ( swap 1 and 2 -> 3 1 2 ) 


: sww negate + ;  ( function/procedure definition )


\ .s CR ( show stack and print carrige return )

: abs ( n -- n )
    dup 0 < if
	negate
    endif ;
CR

\ -3 abs 2 > . CR

\ any non-zero value is treated as true flag

\ bitwise operations
\ 2 1 xor . CR
\ 1 -1 and . CR
\ 1 invert . CR

\ 5  -> 5 4 3 2 1 * * * * * (2 loops); 5 4 * 3 * 2 * 1 * (1 loop)
\ 5  -> 5 1 * 2 * 3 * 4 * (current implementation)
: factoriel ( n -- n)
    dup 1 ?do
	i *
    loop ;

\ 4 3 -> 4 4 * 4 *
: ** ( n1 n2 -- n1**n2)
    over swap
    2 ?do
	over *
    loop * ;

\ 64 factoriel
32 factoriel 8 factoriel 2 factoriel

\ 5 -> 0 1 2 3 4
: produce ( n -- 1..n)
    0 begin
	over 0> while
    repeat ;


2 10 ** . CR

\ 5 produce



\ / .

." Hello!" CR ( printing strings )


: threes ( n n -- ) ?do i . 3 +loop ;
15 3 threes CR

variable a
21 a !
a ? CR

." Array operations:" CR
variable mynumbers 2 cells allot \ You can use `2 cells allot` to create an array 
mynumbers 3 cells erase \ Initialize all the values to 0
mynumbers 3 cells 1 fill \ Alternatively we could use `fill`:
\ create mynumbers 64 , 9001 , 1337 , \ manually assign each word
32 mynumbers 0 cells + ! \ access
0 cells mynumbers + ? CR

\ s" My File With Spaces.fs" included
