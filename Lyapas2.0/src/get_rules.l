get_rules(/L1,L2)
@+L3(20)
*init_rules_array(/L1,L2)
OQ3 100@>L3 101@>L3 102@>L3 34@>L3 100@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SUBPROGRAM -> HEAD BODY ** SUBPROGRAM
OQ3 100@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SUBPROGRAM -> ε
OQ3 101@>L3 24@>L3 4@>L3 103@>L3 22@>L3 104@>L3 5@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** HEAD -> name ( INARGS / OUTARGS )
OQ3 103@>L3 105@>L3 103@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** INARGS -> INARG INARGS
OQ3 103@>L3 25@>L3 103@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** INARGS -> , INARGS
OQ3 103@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** INARGS -> ε
OQ3 105@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** INARG -> id
OQ3 105@>L3 6@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** INARG -> complex
OQ3 104@>L3 106@>L3 104@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OUTARGS -> OUTARG OUTARGS
OQ3 104@>L3 25@>L3 104@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OUTARGS -> , OUTARGS
OQ3 104@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OUTARGS -> ε
OQ3 106@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OUTARG -> id
OQ3 106@>L3 6@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OUTARG -> complex
OQ3 102@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** BODY -> EXPR
OQ3 107@>L3 19@>L3 24@>L3 4@>L3 108@>L3 22@>L3 109@>L3 5@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> * name ( CALLINARGS / CALLOUTARGS ) EXPR
OQ3 107@>L3 110@>L3 111@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> OPERAND OPERANDEXPR EXPR
OQ3 107@>L3 31@>L3 110@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> inc OPERAND EXPR
OQ3 107@>L3 32@>L3 110@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> dec OPERAND EXPR
OQ3 107@>L3 11@>L3 2@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> par const EXPR
OQ3 107@>L3 8@>L3 2@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> jump const EXPR
OQ3 107@>L3 7@>L3 4@>L3 110@>L3 112@>L3 110@>L3 5@>L3 2@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> cmp ( OPERAND CONDITIONOP OPERAND ) const EXPR
OQ3 107@>L3 101@>L3 4@>L3 113@>L3 5@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> swap ( SWAPEXPR ) EXPR
OQ3 107@>L3 38@>L3 114@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> zeroing ASSIGNABLEOPERAND EXPR
OQ3 107@>L3 39@>L3 114@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> maximize ASSIGNABLEOPERAND EXPR
OQ3 107@>L3 22@>L3 6@>L3 115@>L3 100@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> / complex CONSOLEACTION console EXPR
OQ3 107@>L3 23@>L3 116@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> at COMPLEXEXPR EXPR
OQ3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> ε
OQ3 116@>L3 20@>L3 6@>L3 4@>L3 2@>L3 5@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** COMPLEXEXPR -> + complex ( const )
OQ3 116@>L3 38@>L3 6@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** COMPLEXEXPR -> zeroing complex
OQ3 116@>L3 42@>L3 15@>L3 6@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** COMPLEXEXPR -> string g complex
OQ3 113@>L3 1@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPEXPR -> id id
OQ3 113@>L3 6@>L3 117@>L3 118@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPEXPR -> complex SWAPFIRST SWAPSECOND
OQ3 117@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPFIRST -> id
OQ3 117@>L3 18@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPFIRST -> . const
OQ3 118@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPSECOND -> id
OQ3 118@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPSECOND -> const
OQ3 115@>L3 14@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONSOLEACTION -> l
OQ3 115@>L3 15@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONSOLEACTION -> g
OQ3 119@>L3 10@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** JUMPOP -> jz
OQ3 119@>L3 9@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** JUMPOP -> jnz
OQ3 111@>L3 120@>L3 111@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERANDEXPR -> ARITHMETICEXPR OPERANDEXPR
OQ3 111@>L3 3@>L3 114@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERANDEXPR -> assign ASSIGNABLEOPERAND
OQ3 111@>L3 119@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERANDEXPR -> JUMPOP const
OQ3 120@>L3 121@>L3 110@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICEXPR -> ARITHMETICOP OPERAND
OQ3 122@>L3 18@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** INDEX -> . const
OQ3 122@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** INDEX -> id
OQ3 121@>L3 20@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> +
OQ3 121@>L3 21@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> -
OQ3 121@>L3 19@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> *
OQ3 121@>L3 22@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> /
OQ3 121@>L3 37@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> ;
OQ3 121@>L3 29@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> and
OQ3 121@>L3 28@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> or
OQ3 121@>L3 30@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> xor
OQ3 121@>L3 15@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> g
OQ3 121@>L3 14@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> l
OQ3 112@>L3 12@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> e
OQ3 112@>L3 13@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> ne
OQ3 112@>L3 15@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> g
OQ3 112@>L3 17@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> ge
OQ3 112@>L3 14@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> l
OQ3 112@>L3 16@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> le
OQ3 110@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> id
OQ3 110@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> const
OQ3 110@>L3 6@>L3 122@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> complex INDEX
OQ3 110@>L3 35@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> length
OQ3 110@>L3 36@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> capacity
OQ3 110@>L3 40@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> random
OQ3 110@>L3 41@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> time
OQ3 114@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ASSIGNABLEOPERAND -> id
OQ3 114@>L3 6@>L3 122@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ASSIGNABLEOPERAND -> complex INDEX
OQ3 114@>L3 35@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ASSIGNABLEOPERAND -> length
OQ3 114@>L3 40@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ASSIGNABLEOPERAND -> random
OQ3 108@>L3 123@>L3 108@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARGS -> CALLINARG CALLINARGS
OQ3 108@>L3 25@>L3 108@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARGS -> , CALLINARGS
OQ3 108@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARGS -> ε
OQ3 123@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARG -> id
OQ3 123@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARG -> const
OQ3 123@>L3 6@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARG -> complex
OQ3 109@>L3 124@>L3 109@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLOUTARGS -> CALLOUTARG CALLOUTARGS
OQ3 109@>L3 25@>L3 109@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLOUTARGS -> , CALLOUTARGS
OQ3 109@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLOUTARGS -> ε
OQ3 124@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLOUTARG -> id
OQ3 124@>L3 6@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLOUTARG -> complex
**
#add_rule(L1,L2,L3,i/L1,L2)
#init_rules_array(/L1,L2)