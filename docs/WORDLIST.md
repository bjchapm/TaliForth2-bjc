# Tali Forth 2 native words
This file is automatically generated by a script in `tools`.
Note these are not all the words in Tali Forth 2, the high-level
and user-defined words coded in Forth are in `forth_code`.
The size in bytes includes any underflow checks, but not the
RTS instruction at the end of each word.

| NAME | FORTH WORD | SOURCE | BYTES | STATUS |
| :--- | :--------- | :---   | ----: | :----  |
| COLD | `cold` | Tali Forth | 197 | tested |
| ABORT | `abort` | ANS core | 68 | tested |
| QUIT | `quit` | ANS core | 66 | tested |
| ABORT_QUOTE | `abort"` | ANS core | 10 | tested |
| ABS | `abs` | ANS core | 20 | **auto** |
| ACCEPT | `accept` | ANS core | 248 | **auto** |
| ACTION_OF | `action-of` | ANS core ext | 24 | **auto** |
| AGAIN | `again` | ANS core ext | 32 | tested |
| ALIGN | `align` | ANS core | 0 | **auto** |
| ALIGNED | `aligned` | ANS core | 0 | **auto** |
| ALLOT | `allot` | ANS core | 104 | **auto** |
| ALLOW_NATIVE | `allow-native` | Tali Forth | 11 | **auto** |
| ALSO | `also` | ANS search ext | 15 | **auto** |
| ALWAYS_NATIVE | `always-native` | Tali Forth | 13 | **auto** |
| AND | `and` | ANS core | 17 | **auto** |
| ASSEMBLER_WORDLIST | `assembler-wordlist` | Tali Assembler | 8 | tested |
| AT_XY | `at-xy` | ANS facility | 45 | tested |
| BACKSLASH | `\` | ANS core ext | 8 | **auto** |
| BASE | `base` | ANS core | 8 | **auto** |
| BEGIN | `begin` | ANS core | 3 | **auto** |
| BELL | `bell` | Tali Forth | 5 | tested |
| BL | `bl` | ANS core | 8 | **auto** |
| BLK | `block` | ANS block | 15 | **auto** |
| BLKBUFFER | `blkbuffer` | Tali block | 13 | **auto** |
| BLOCK | `block` | ANS block | 82 | **auto** |
| BLOCK_RAMDRIVE_INIT | `block-ramdrive-init` | Tali block | 296 | **auto** |
| BLOCK_READ | `block-read` | Tali block | 14 | **auto** |
| BLOCK_READ_VECTOR | `block-read-vector` | Tali block | 15 | **auto** |
| BLOCK_WRITE | `block-write` | Tali block | 14 | **auto** |
| BLOCK_WRITE_VECTOR | `block-write-vector` | Tali block | 15 | **auto** |
| BOUNDS | `bounds` | Gforth | 24 | **auto** |
| BRACKET_CHAR | `[char]` | ANS core | 6 | **auto** |
| BRACKET_TICK | `[']` | ANS core | 6 | **auto** |
| BUFFBLOCKNUM | `buffblocknum` | Tali block | 15 | **auto** |
| BUFFER | `buffer` | ANS block | 48 | **auto** |
| BUFFER_COLON | `buffer:` | ANS core ext | 6 | **auto** |
| BUFFSTATUS | `buffstatus` | Tali block | 15 | **auto** |
| BYE | `bye` | ANS tools ext | 3 | tested |
| C_COMMA | `c,` | ANS core | 10 | **auto** |
| C_FETCH | `c@` | ANS core | 9 | **auto** |
| C_STORE | `c!` | ANS core | 11 | **auto** |
| CASE | `case` | ANS core ext | 6 | **auto** |
| CELL_PLUS | `cell+` | ANS core | 15 | **auto** |
| CELLS | `cells` | ANS core | 7 | **auto** |
| CHAR | `char` | ANS core | 22 | **auto** |
| CHAR_PLUS | `char+` | ANS core | 9 | **auto** |
| CHARS | `chars` | ANS core | 3 | **auto** |
| CLEAVE | `cleave` | Tali Forth | 76 | **auto** |
| CMOVE | `cmove` | ANS string | 58 | **auto** |
| CMOVE_UP | `cmove>` | ANS string | 58 | **auto** |
| COLON | `:` | ANS core | 66 | **auto** |
| COLON_NONAME | `:NONAME` | ANS core | 27 | **auto** |
| COMMA | `,` | ANS core | 25 | **auto** |
| COMPARE | `compare` | ANS string | 100 | **auto** |
| COMPILE_COMMA | `compile,` | ANS core ext | 279 | **auto** |
| COMPILE_ONLY | `compile-only` | Tali Forth | 11 | tested |
| CONSTANT | `constant` | ANS core | 61 | **auto** |
| COUNT | `count` | ANS core | 19 | **auto** |
| CR | `cr` | ANS core | 5 | **auto** |
| CREATE | `create` | ANS core | 212 | **auto** |
| D_MINUS | `d-` | ANS double | 32 | **auto** |
| D_PLUS | `d+` | ANS double | 32 | **auto** |
| D_TO_S | `d>s` | ANS double | 5 | **auto** |
| DABS | `dabs` | ANS double | 30 | **auto** |
| DECIMAL | `decimal` | ANS core | 6 | **auto** |
| DEFER | `defer` | ANS core ext | 50 | **auto** |
| DEFER_FETCH | `defer@` | ANS core ext | 6 | **auto** |
| DEFER_STORE | `defer!` | ANS core ext | 6 | **auto** |
| DEFINITIONS | `definitions` | ANS search | 8 | **auto** |
| DEPTH | `depth` | ANS core | 14 | **auto** |
| DIGIT_QUESTION | `digit?` | Tali Forth | 52 | **auto** |
| DISASM | `disasm` | Tali Forth | 6 | tested |
| DNEGATE | `dnegate` | ANS double | 26 | **auto** |
| QUESTION_DO | `?do` | ANS core ext | 96 | **auto** |
| DO | `do` | ANS core | 90 | **auto** |
| DOES | `does>` | ANS core | 14 | **auto** |
| DOT | `.` | ANS core | 33 | **auto** |
| DOT_PAREN | `.(` | ANS core | 14 | **auto** |
| DOT_QUOTE | `."` | ANS core ext | 10 | **auto** |
| DOT_R | `.r` | ANS core ext | 45 | tested |
| DOT_S | `.s` | ANS tools | 67 | tested |
| D_DOT | `d.` | ANS double | 30 | tested |
| D_DOT_R | `d.r` | ANS double | 42 | tested |
| DROP | `drop` | ANS core | 5 | **auto** |
| DUMP | `dump` | ANS tools | 102 | tested |
| DUP | `dup` | ANS core | 13 | **auto** |
| ED | `ed` | Tali Forth | 3 | *fragment* |
| EDITOR_WORDLIST | `editor-wordlist` | Tali Editor | 8 | tested |
| ELSE | `else` | ANS core | 25 | **auto** |
| EMIT | `emit` | ANS core | 10 | **auto** |
| EMPTY_BUFFERS | `empty-buffers` | ANS block ext | 6 | tested |
| ENDCASE | `endcase` | ANS core ext | 20 | **auto** |
| ENDOF | `endof` | ANS core ext | 25 | **auto** |
| ENVIRONMENT_Q | `environment?` | ANS core | 124 | **auto** |
| EQUAL | `=` | ANS core | 27 | **auto** |
| BLANK | `blank` | ANS string | 82 | **auto** |
| ERASE | `erase` | ANS core ext | 72 | **auto** |
| FILL | `fill` | ANS core | 66 | **auto** |
| EXECUTE | `execute` | ANS core | 6 | **auto** |
| EXECUTE_PARSING | `execute-parsing` | Gforth | 38 | **auto** |
| EXIT | `exit` | ANS core | 1 | **auto** |
| FALSE | `false` | ANS core ext | 6 | **auto** |
| FETCH | `@` | ANS core | 18 | **auto** |
| FIND | `find` | ANS core | 71 | **auto** |
| FIND_NAME | `find-name` | Gforth | 171 | **auto** |
| FLUSH | `flush` | ANS block | 9 | **auto** |
| FM_SLASH_MOD | `fm/mod` | ANS core | 54 | **auto** |
| FORTH | `forth` | ANS search ext | 6 | **auto** |
| EVALUATE | `evaluate` | ANS core | 83 | **auto** |
| FORTH_WORDLIST | `forth-wordlist` | ANS search | 6 | **auto** |
| GET_CURRENT | `get-current` | ANS search | 10 | **auto** |
| GET_ORDER | `get-order` | ANS search | 40 | **auto** |
| GREATER_THAN | `>` | ANS core | 20 | **auto** |
| HERE | `here` | ANS core | 10 | **auto** |
| HEX | `hex` | ANS core ext | 6 | **auto** |
| HEXSTORE | `hexstore` | Tali | 82 | **auto** |
| HOLD | `hold` | ANS core | 17 | **auto** |
| I | `i` | ANS core | 25 | **auto** |
| IF | `if` | ANS core | 16 | **auto** |
| IMMEDIATE | `immediate` | ANS core | 11 | **auto** |
| INPUT | `input` | Tali Forth | 10 | tested |
| INPUT_TO_R | `input>r` | Tali Forth | 21 | tested |
| INT_TO_NAME | `int>name` | Tali Forth | 114 | **auto** |
| INVERT | `invert` | ANS core | 15 | **auto** |
| IS | `is` | ANS core ext | 24 | **auto** |
| J | `j` | ANS core | 25 | **auto** |
| KEY | `key` | ANS core | 9 | tested |
| LATESTNT | `latestnt` | Tali Forth | 13 | **auto** |
| LATESTXT | `latestxt` | Gforth | 6 | **auto** |
| LEAVE | `leave` | ANS core | 5 | **auto** |
| LEFT_BRACKET | `[` | ANS core | 4 | **auto** |
| LESS_NUMBER_SIGN | `<#` | ANS core | 13 | **auto** |
| LESS_THAN | `<` | ANS core | 20 | **auto** |
| LIST | `list` | ANS block ext | 12 | tested |
| LITERAL | `literal` | ANS core | 13 | **auto** |
| LOAD | `load` | ANS block | 67 | **auto** |
| LOOP | `loop` | ANS core | 109 | **auto** |
| PLUS_LOOP | `+loop` | ANS core | 102 | **auto** |
| LSHIFT | `lshift` | ANS core | 19 | **auto** |
| M_STAR | `m*` | ANS core | 26 | **auto** |
| MARKER | `marker` | ANS core ext | 61 | **auto** |
| MAX | `max` | ANS core | 27 | **auto** |
| MIN | `min` | ANS core | 27 | **auto** |
| MINUS | `-` | ANS core | 18 | **auto** |
| MINUS_LEADING | `-leading` | Tali String | 24 | **auto** |
| MINUS_TRAILING | `-trailing` | ANS string | 60 | **auto** |
| MOD | `mod` | ANS core | 8 | **auto** |
| MOVE | `move` | ANS core | 30 | **auto** |
| NAME_TO_INT | `name>int` | Gforth | 28 | tested |
| NAME_TO_STRING | `name>string` | Gforth | 25 | tested |
| NC_LIMIT | `nc-limit` | Tali Forth | 10 | tested |
| NEGATE | `negate` | ANS core | 16 | **auto** |
| NEVER_NATIVE | `never-native` | Tali Forth | 13 | **auto** |
| NIP | `nip` | ANS core ext | 13 | **auto** |
| NOT_EQUALS | `<>` | ANS core ext | 29 | **auto** |
| NOT_ROTE | `-rot` | Gforth | 27 | **auto** |
| NUMBER | `number` | Tali Forth | 252 | **auto** |
| NUMBER_SIGN | `#` | ANS core | 52 | **auto** |
| NUMBER_SIGN_GREATER | `#>` | ANS core | 33 | **auto** |
| NUMBER_SIGN_S | `#s` | ANS core | 16 | **auto** |
| OF | `of` | ANS core ext | 24 | **auto** |
| ONE | `1` | Tali Forth | 8 | **auto** |
| ONE_MINUS | `1-` | ANS core | 11 | **auto** |
| ONE_PLUS | `1+` | ANS core | 9 | **auto** |
| ONLY | `only` | ANS search ext | 11 | **auto** |
| OR | `or` | ANS core | 17 | **auto** |
| ORDER | `order` | ANS core | 42 | **auto** |
| OUTPUT | `output` | Tali Forth | 10 | tested |
| OVER | `over` | ANS core | 13 | **auto** |
| PAD | `pad` | ANS core ext | 15 | **auto** |
| PAGE | `page` | ANS facility | 29 | tested |
| PAREN | `(` | ANS core | 15 | **auto** |
| PARSE_NAME | `parse-name` | ANS core ext | 242 | **auto** |
| PARSE | `parse` | ANS core ext | 151 | tested |
| PICK | `pick` | ANS core ext | 16 | **auto** |
| PLUS | `+` | ANS core | 18 | **auto** |
| PLUS_STORE | `+!` | ANS core | 31 | **auto** |
| POSTPONE | `postpone` | ANS core | 62 | **auto** |
| PREVIOUS | `previous` | ANS search ext | 12 | **auto** |
| QUESTION | `?` | ANS tools | 6 | tested |
| QUESTION_DUP | `?dup` | ANS core | 19 | **auto** |
| R_FETCH | `r@` | ANS core | 20 | **auto** |
| R_FROM | `r>` | ANS core | 16 | **auto** |
| R_TO_INPUT | `r>input` | Tali Forth | 23 | tested |
| RECURSE | `recurse` | ANS core | 60 | **auto** |
| REFILL | `refill` | ANS core ext | 65 | tested |
| REPEAT | `repeat` | ANS core | 12 | **auto** |
| RIGHT_BRACKET | `]` | ANS core | 6 | **auto** |
| ROOT_WORDLIST | `root-wordlist` | Tali Editor | 8 | tested |
| ROT | `rot` | ANS core | 27 | **auto** |
| RSHIFT | `rshift` | ANS core | 19 | **auto** |
| S_BACKSLASH_QUOTE | `s\"` | ANS core | 9 | **auto** |
| SEARCH_WORDLIST | `search-wordlist` | ANS search | 224 | **auto** |
| SEE | `see` | ANS tools | 141 | tested |
| SET_CURRENT | `set-current` | ANS search | 11 | **auto** |
| SET_ORDER | `set-order` | ANS search | 51 | **auto** |
| S_QUOTE | `s"` | ANS core | 348 | **auto** |
| S_TO_D | `s>d` | ANS core | 17 | **auto** |
| SAVE_BUFFERS | `save-buffers` | ANS block | 26 | tested |
| SCR | `scr` | ANS block ext | 15 | **auto** |
| SEARCH | `search` | ANS string | 158 | **auto** |
| SEMICOLON | `;` | ANS core | 94 | **auto** |
| SIGN | `sign` | ANS core | 20 | **auto** |
| SLASH | `/` | ANS core | 28 | **auto** |
| SLASH_MOD | `/mod` | ANS core | 23 | **auto** |
| SLASH_STRING | `/string` | ANS string | 31 | **auto** |
| SLITERAL | `sliteral` | ANS string | 111 | **auto** |
| SM_SLASH_REM | `sm/rem` | ANS core | 40 | **auto** |
| SOURCE | `source` | ANS core | 20 | **auto** |
| SOURCE_ID | `source-id` | ANS core ext | 10 | tested |
| SPACE | `space` | ANS core | 5 | **auto** |
| SPACES | `spaces` | ANS core | 59 | **auto** |
| STAR | `*` | ANS core | 8 | **auto** |
| STAR_SLASH | `*/` | ANS core | 8 | **auto** |
| STAR_SLASH_MOD | `*/mod` | ANS core | 15 | **auto** |
| STATE | `state` | ANS core | 10 | **auto** |
| STORE | `!` | ANS core | 21 | **auto** |
| STRIP_UNDERFLOW | `strip-underflow` | Tali Forth | 10 | tested |
| SWAP | `swap` | ANS core | 19 | **auto** |
| THEN | `then` | ANS core | 9 | **auto** |
| THRU | `thru` | ANS block ext | 68 | tested |
| TICK | `'` | ANS core | 31 | **auto** |
| TO | `to` | ANS core ext | 91 | **auto** |
| TO_BODY | `>body` | ANS core | 36 | **auto** |
| TO_IN | `>in` | ANS core | 10 | **auto** |
| TO_NUMBER | `>number` | ANS core | 159 | **auto** |
| TO_ORDER | `>order` | Gforth search | 18 | tested |
| TO_R | `>r` | ANS core | 19 | **auto** |
| TRUE | `true` | ANS core ext | 8 | **auto** |
| TUCK | `tuck` | ANS core ext | 25 | **auto** |
| TWO | `2` | Tali Forth | 8 | **auto** |
| TWO_DROP | `2drop` | ANS core | 7 | **auto** |
| TWO_DUP | `2dup` | ANS core | 23 | **auto** |
| TWO_FETCH | `2@` | ANS core | 33 | **auto** |
| TWO_OVER | `2over` | ANS core | 23 | **auto** |
| TWO_R_FETCH | `2r@` | ANS core ext | 29 | **auto** |
| TWO_R_FROM | `2r>` | ANS core ext | 28 | **auto** |
| TWO_SLASH | `2/` | ANS core | 10 | **auto** |
| TWO_STAR | `2*` | ANS core | 7 | **auto** |
| TWO_STORE | `2!` | ANS core | 37 | **auto** |
| TWO_SWAP | `2swap` | ANS core | 35 | **auto** |
| TWO_TO_R | `2>r` | ANS core ext | 31 | **auto** |
| TWO_CONSTANT | `2constant` | ANS double | 36 | **auto** |
| TWO_LITERAL | `2literal` | ANS double | 12 | **auto** |
| TWO_VARIABLE | `2variable` | ANS double | 14 | **auto** |
| TYPE | `type` | ANS core | 42 | **auto** |
| U_DOT | `u.` | ANS core | 11 | tested |
| U_DOT_R | `u.r` | ANS core ext | 33 | tested |
| U_GREATER_THAN | `u>` | ANS core ext | 21 | **auto** |
| U_LESS_THAN | `u<` | ANS core | 21 | **auto** |
| UD_DOT | `ud.` | Tali double | 18 | **auto** |
| UD_DOT_R | `ud.r` | Tali double | 30 | **auto** |
| UM_SLASH_MOD | `um/mod` | ANS core | 65 | **auto** |
| UM_STAR | `um*` | ANS core | 69 | **auto** |
| UNLOOP | `unloop` | ANS core | 6 | **auto** |
| UNTIL | `until` | ANS core | 10 | **auto** |
| UNUSED | `unused` | ANS core ext | 15 | **auto** |
| UPDATE | `update` | ANS block | 8 | **auto** |
| USERADDR | `useraddr` | Tali Forth | 10 | tested |
| VALUE | `value` | ANS core | 61 | **auto** |
| VARIABLE | `variable` | ANS core | 24 | **auto** |
| WHILE | `while` | ANS core | 19 | **auto** |
| WITHIN | `within` | ANS core ext | 21 | **auto** |
| WORD | `word` | ANS core | 69 | **auto** |
| WORDLIST | `wordlist` | ANS search | 22 | **auto** |
| WORDS | `words` | ANS tools | 92 | tested |
| WORDSIZE | `wordsize` | Tali Forth | 32 | **auto** |
| XOR | `xor` | ANS core | 17 | **auto** |
| ZERO | `0` | Tali Forth | 6 | **auto** |
| ZERO_EQUAL | `0=` | ANS core | 19 | **auto** |
| ZERO_GREATER | `0>` | ANS core ext | 19 | **auto** |
| ZERO_LESS | `0<` | ANS core | 15 | **auto** |
| ZERO_UNEQUAL | `0<>` | ANS core ext | 17 | **auto** |
| EDITOR_ENTER_SCREEN | `enter-screen` | Tali Editor | 27 | **auto** |
| EDITOR_ERASE_SCREEN | `erase-screen` | Tali Editor | 17 | tested |
| EDITOR_EL | `el` | Tali Editor | 17 | tested |
| EDITOR_L | `l` | Tali Editor | 123 | tested |
| EDITOR_LINE | `line` | Tali Editor | 24 | tested |
| EDITOR_O | `o` | Tali Editor | 69 | tested |

Found **279** native words in `native_words.asm`.
Of those, **231** were automatically tested and
          **1** are not marked as tested at all.

