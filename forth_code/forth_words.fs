\ List of high-level Forth words for Tali Forth 2 for the 65c02
\ Scot W. Stevenson <scot.stevenson@gmail.com>
\ This version: 25. June 2018

\ When changing these words, edit them here and then use the 
\ forth_to_dotbyte.py tool to convert them to the required format
\ for inclusion in Ophis. See forth_words/README.md for details

\ Output and comment. Because it still blows my mind that we can
\ define this stuff this simply 
        : ( [char] ) parse 2drop ; immediate
        : .( [char] ) parse type ; immediate

\ Flow control. Some of these could be realized with CS-ROLL and
\ CS-PICK instead, which seems to be all the rage these days.
        : if postpone 0branch here 0 , ; immediate compile-only
        : then here swap ! ; immediate compile-only
        : else postpone branch here 0 , here rot ! ; immediate compile-only
        : repeat postpone again here swap ! ; immediate compile-only
        : until postpone 0branch , ; immediate compile-only
        : while postpone 0branch here 0 , swap ; immediate compile-only
        : case 0 ; immediate compile-only 
        : of postpone over postpone = postpone if postpone drop ; immediate compile-only 
        : endof postpone else ; immediate compile-only 
        : endcase postpone drop begin ?dup while postpone then repeat ; immediate compile-only 

\ DEFER and friends. Code taken from ANS Forth specification. Some of
\ these will be moved to assembler code in due course
        : defer! >body ! ;
        : defer@ >body @ ;
        : is state @ if postpone ['] postpone defer! else ' defer! then ; immediate
        : action-of state @ if postpone ['] postpone defer@ else ' defer@ then ; immediate

\ High level math definitions. The should be moved to actual 65c02 code
\ for speed at some point. Note we use SM/REM instead of FM/MOD for most
\ stuff
        : / >r s>d r> sm/rem swap drop ;
        : /mod >r s>d r> sm/rem ;
        : mod /mod drop ;
        : */ >r m* r> sm/rem swap drop ;
        : */mod >r m* r> sm/rem ;

\ Output definitions. Since these usually involve the user, and humans
\ are slow, these can stay high-level for the moment. However, in this
\ state they don't check for underflow. Based on
\ https://github.com/philburk/pforth/blob/master/fth/numberio.fth
        : u.r >r 0 <# #s #> r> over - spaces type ;
        : .r >r dup abs 0 <# #s rot sign #> r> over - spaces type ;
        : ud. <# #s #> type space ;
        : ud.r >r <# #s #> r> over - spaces type ;
        : d. tuck dabs <# #s rot sign #> type space ;
        : d.r >r tuck dabs <# #s rot sign #> r> over - spaces type ;

\ Temporary high-level words. TODO convert these to assembler
        \ An optional version of WITHIN is ROT TUCK > -ROT > INVERT AND  - this
        \ is from the Forth Standard, see
        \ https://forth-standard.org/standard/core/WITHIN
        : within ( n1 n2 n3 -- f )  over - >r - r> u< ;
        : 2constant ( d -- ) create swap , , does> dup @ swap cell+ @ ;
        : 2literal ( d -- ) swap postpone literal postpone literal ; immediate

\ String search and comparison words. TODO convert these to assembler
( Source pforth ) 
\ : compare   ( c-addr1 u1 c-addr2 u2 -- n )
\    rot 2swap 2over min               ( no. of characters to check )
\    dup 0> if                         ( if strings not both length 0 )
\       0 do                           ( for each character )
\          over c@  over c@            ( get the characters )
\          <> if                       ( if they're unequal )
\             c@ swap  c@              ( retrieve the characters )
\             < 2* invert              ( construct the return code )
\             nip nip unloop exit      ( and exit )
\          then
\          char+ swap  char+ swap      ( increment addresses )
\       loop
\    ( Modified 2018-07-07 for ANS compatibility )      
\    else                              ( One of the strings is length 0 )
\        drop                          ( remove min from stack )
\    then
\    2drop                             ( get rid of addresses )
\    2dup <> -rot < 2* invert and ;    ( construct return code )
\ 
( Source pforth ) 
: search   ( c-addr1 u1 c-addr2 u2 -- c-addr3 u3 f )
    rot
    ( Modified 2018-07-07 for ANS compatibility )
    over 0= if                       ( check for u2=0 )
       nip nip true                  ( leave c-addr1 u1 true )
    then    
    2dup                          ( copy lengths )
    ( This next line used to use u> for comparison of string lengths )
    ( but Tali doesn't have the word yet - SamCo 2018-07-06 )
    \   over swap >  swap 0=  or if      ( if u2>u1 or u2=0 )
    > if 
      nip nip  false exit            ( exit with false flag )
   then
   -rot 2over                        ( save c-addr1 u1 )
   2swap tuck 2>r                    ( save c-addr2 u2 )
   - 1+ over +  swap                 ( make c-addr1 c-addr1+u1-u2 )
   2r> 2swap                         ( retrieve c-addr2 u2 )
   do
      2dup i over compare 0= if      ( if we find the string )
         2drop +  i tuck -           ( calculate c-addr3 u3 )
         true unloop exit            ( exit with true flag )
      then
   loop
   2drop false ;                     ( leave c-addr1 u1 false )

\ ENVIRONMENT? for Tali Forth 2
\ Make a string version of "OF"
\ Note that endcase will only drop one item (the length) off the stack
\ in the event none of the string_of paths are taken.  You can add
\ a "drop" to the default section to compensate for this.
: string_of postpone 2over postpone compare postpone 0=
    postpone if postpone 2drop ; immediate compile-only
hex
: ENVIRONMENT? ( c-addr u -- false | i*x true )
    case
    s" /COUNTED-STRING"    string_of  7FFF true endof
    s" /HOLD"              string_of    FF true endof
    s" /PAD"               string_of    54 true endof ( 84 decimal )
    s" ADDRESS-UNIT-BITS"  string_of     8 true endof
\ The following words are OBSOLETE in the 2012 ANS standard.
\    s" CORE"               string_of  true true endof
\    s" CORE-EXT"           string_of false true endof ( don't have all of it )
    s" FLOORED"            string_of false true endof ( we have symmetric )
    s" MAX-CHAR"           string_of   255 true endof
    s" MAX-D"              string_of 
                                 7FFFFFFF. true endof
    s" MAX-N"              string_of  7FFF true endof
    s" MAX-U"              string_of  FFFF true endof
    s" MAX-UD"             string_of 
                                 FFFFFFFF. true endof
    s" RETURN-STACK-CELLS" string_of    80 true endof
    s" STACK-CELLS"        string_of    20 true endof ( from definitions.asm )
    ( default ) 2drop false false ( one false will dropped by endcase )
    endcase ;
decimal        

\ Splash strings. We leave these as high-level words because they are
\ generated at the end of the boot process and signal that the other
\ high-level definitions worked (or at least didn't crash)
        .( Tali Forth 2 for the 65c02)
        cr .( Version BETA 04. July 2018 )
        cr .( Copyright 2014-2018 Scot W. Stevenson)
        cr .( Tali Forth 2 comes with absolutely NO WARRANTY)
        cr .( Type 'bye' to exit) cr
\ END
