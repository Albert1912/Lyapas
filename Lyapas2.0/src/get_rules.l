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
OQ3 107@>L3 3@>L3 108@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> assign ASSIGNABLEOPERAND EXPR
OQ3 107@>L3 109@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> OPERAND EXPR
OQ3 107@>L3 110@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> COMPLEX EXPR
OQ3 107@>L3 44@>L3 4@>L3 111@>L3 5@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> swap ( SWAPEXPR ) EXPR
OQ3 107@>L3 38@>L3 108@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> zeroing ASSIGNABLEOPERAND EXPR
OQ3 107@>L3 39@>L3 108@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> maximize ASSIGNABLEOPERAND EXPR
OQ3 107@>L3 45@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> lowerone EXPR
OQ3 107@>L3 46@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> inversion EXPR
OQ3 107@>L3 47@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> weighing EXPR
OQ3 107@>L3 112@>L3 109@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> ARITHMETICOP OPERAND EXPR
OQ3 107@>L3 19@>L3 113@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> * STAREXPR EXPR
OQ3 107@>L3 22@>L3 114@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> / SLASHEXPR EXPR
OQ3 107@>L3 31@>L3 108@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> inc ASSIGNABLEOPERAND EXPR
OQ3 107@>L3 32@>L3 108@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> dec ASSIGNABLEOPERAND EXPR
OQ3 107@>L3 115@>L3 2@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> JUMPOP const EXPR
OQ3 107@>L3 7@>L3 4@>L3 109@>L3 116@>L3 109@>L3 5@>L3 2@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> cmp ( OPERAND CONDITIONOP OPERAND ) const EXPR
OQ3 107@>L3 11@>L3 2@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> par const EXPR
OQ3 107@>L3 23@>L3 117@>L3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> at COMPLEXEXPR EXPR
OQ3 107@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** EXPR -> ε
OQ3 113@>L3 24@>L3 4@>L3 118@>L3 22@>L3 119@>L3 5@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** STAREXPR -> name ( CALLINARGS / CALLOUTARGS )
OQ3 113@>L3 109@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** STAREXPR -> OPERAND
OQ3 113@>L3 110@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** STAREXPR -> COMPLEX
OQ3 114@>L3 6@>L3 120@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SLASHEXPR -> complex COMPLEXSLASHEXPR
OQ3 114@>L3 42@>L3 121@>L3 43@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SLASHEXPR -> string CONSOLEACTION console
OQ3 114@>L3 109@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SLASHEXPR -> OPERAND
OQ3 120@>L3 121@>L3 43@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** COMPLEXSLASHEXPR -> CONSOLEACTION console
OQ3 120@>L3 122@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** COMPLEXSLASHEXPR -> INDEX
OQ3 117@>L3 20@>L3 6@>L3 4@>L3 2@>L3 5@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** COMPLEXEXPR -> + complex ( const )
OQ3 117@>L3 38@>L3 6@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** COMPLEXEXPR -> zeroing complex
OQ3 117@>L3 42@>L3 15@>L3 6@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** COMPLEXEXPR -> string g complex
OQ3 111@>L3 1@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPEXPR -> id id
OQ3 111@>L3 6@>L3 123@>L3 124@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPEXPR -> complex SWAPFIRST SWAPSECOND
OQ3 123@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPFIRST -> id
OQ3 123@>L3 18@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPFIRST -> . const
OQ3 124@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPSECOND -> id
OQ3 124@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** SWAPSECOND -> const
OQ3 121@>L3 14@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONSOLEACTION -> l
OQ3 121@>L3 15@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONSOLEACTION -> g
OQ3 115@>L3 10@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** JUMPOP -> jz
OQ3 115@>L3 9@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** JUMPOP -> jnz
OQ3 115@>L3 8@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** JUMPOP -> jump
OQ3 122@>L3 18@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** INDEX -> . const
OQ3 122@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** INDEX -> id
OQ3 112@>L3 20@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> +
OQ3 112@>L3 21@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> -
OQ3 112@>L3 37@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> ;
OQ3 112@>L3 29@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> and
OQ3 112@>L3 28@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> or
OQ3 112@>L3 30@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> xor
OQ3 112@>L3 15@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> g
OQ3 112@>L3 14@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ARITHMETICOP -> l
OQ3 116@>L3 12@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> e
OQ3 116@>L3 13@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> ne
OQ3 116@>L3 15@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> g
OQ3 116@>L3 17@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> ge
OQ3 116@>L3 14@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> l
OQ3 116@>L3 16@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CONDITIONOP -> le
OQ3 109@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> id
OQ3 109@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> const
OQ3 109@>L3 35@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> length
OQ3 109@>L3 36@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> capacity
OQ3 109@>L3 40@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> random
OQ3 109@>L3 48@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> singleconst
OQ3 109@>L3 41@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** OPERAND -> time
OQ3 110@>L3 6@>L3 122@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** COMPLEX -> complex INDEX
OQ3 108@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ASSIGNABLEOPERAND -> id
OQ3 108@>L3 6@>L3 122@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ASSIGNABLEOPERAND -> complex INDEX
OQ3 108@>L3 35@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ASSIGNABLEOPERAND -> length
OQ3 108@>L3 40@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** ASSIGNABLEOPERAND -> random
OQ3 118@>L3 125@>L3 118@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARGS -> CALLINARG CALLINARGS
OQ3 118@>L3 25@>L3 118@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARGS -> , CALLINARGS
OQ3 118@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARGS -> ε
OQ3 125@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARG -> id
OQ3 125@>L3 2@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARG -> const
OQ3 125@>L3 6@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLINARG -> complex
OQ3 119@>L3 126@>L3 119@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLOUTARGS -> CALLOUTARG CALLOUTARGS
OQ3 119@>L3 25@>L3 119@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLOUTARGS -> , CALLOUTARGS
OQ3 119@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLOUTARGS -> ε
OQ3 126@>L3 1@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLOUTARG -> id
OQ3 126@>L3 6@>L3
*add_rule(L1,L2,L3,0/L1,L2) *** CALLOUTARG -> complex
**
#add_rule(L1,L2,L3,i/L1,L2)
#init_rules_array(/L1,L2)