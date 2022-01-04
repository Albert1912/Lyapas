********************************************************************
*** syntax rules handler
*** L1 - metadata
*** F2 - function names
*** L3 - input args
*** L4 - output args
*** F5 - variables
*** L6 - complexes
*** F7 - byte-code
*** L8 - context stack
*** i - applied rule index
********************************************************************
handle_applied_rule(L1,F2,L3,L4,F5,L6,F7,L8,i/)
    *stack_has_values(L8/r) r↪1
    *stack_pop_single(L8/L8,t) ∆t
    *stack_push_single(L8,t/L8)
§1
    *stack_push_single(L8,i/L8)
    *stack_push_single(L8,0/L8)
**
********************************************************************
*** syntax rules handler
*** L1 - metadata
*** F2 - function names
*** L3 - input args
*** L4 - output args
*** F5 - variables
*** L6 - complexes
*** F7 - byte-code
*** L8 - context stack
*** F9 - token array
*** L10 - token array metadata
*** i - accepted terminal index
********************************************************************
handle_accepted_terminal(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)
    *stack_pop_single(L8/L8,t)
    *stack_pop_single(L8/L8,r)
    *stack_push_single(L8,r/L8)
    *stack_push_single(L8,t/L8)
§0 ↑(r≠0)1 *handle_terminal_0(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§1 ↑(r≠1)2 *handle_terminal_1(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§2 ↑(r≠2)3 *handle_terminal_2(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§3 ↑(r≠3)4 *handle_terminal_3(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§4 ↑(r≠4)5 *handle_terminal_4(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§5 ↑(r≠5)6 *handle_terminal_5(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§6 ↑(r≠6)7 *handle_terminal_6(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§7 ↑(r≠7)8 *handle_terminal_7(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§8 ↑(r≠8)9 *handle_terminal_8(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§9 ↑(r≠9)10 *handle_terminal_9(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§10 ↑(r≠10)11 *handle_terminal_10(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§11 ↑(r≠11)12 *handle_terminal_11(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§12 ↑(r≠12)13 *handle_terminal_12(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§13 ↑(r≠13)14 *handle_terminal_13(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§14 ↑(r≠14)15 *handle_terminal_14(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§15 ↑(r≠15)16 *handle_terminal_15(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§16 ↑(r≠16)17 *handle_terminal_16(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§17 ↑(r≠17)18 *handle_terminal_17(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§18 ↑(r≠18)19 *handle_terminal_18(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§19 ↑(r≠19)20 *handle_terminal_19(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§20 ↑(r≠20)21 *handle_terminal_20(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§21 ↑(r≠21)22 *handle_terminal_21(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§22 ↑(r≠22)23 *handle_terminal_22(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§23 ↑(r≠23)24 *handle_terminal_23(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§24 ↑(r≠24)25 *handle_terminal_24(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§25 ↑(r≠25)26 *handle_terminal_25(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§26 ↑(r≠26)27 *handle_terminal_26(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§27 ↑(r≠27)28 *handle_terminal_27(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§28 ↑(r≠28)29 *handle_terminal_28(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§29 ↑(r≠29)30 *handle_terminal_29(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§30 ↑(r≠30)31 *handle_terminal_30(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§31 ↑(r≠31)32 *handle_terminal_31(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§32 ↑(r≠32)33 *handle_terminal_32(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§33 ↑(r≠33)34 *handle_terminal_33(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§34 ↑(r≠34)35 *handle_terminal_34(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§35 ↑(r≠35)36 *handle_terminal_35(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§36 ↑(r≠36)37 *handle_terminal_36(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§37 ↑(r≠37)38 *handle_terminal_37(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§38 ↑(r≠38)39 *handle_terminal_38(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§39 ↑(r≠39)40 *handle_terminal_39(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§40 ↑(r≠40)41 *handle_terminal_40(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§41 ↑(r≠41)42 *handle_terminal_41(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§42 ↑(r≠42)43 *handle_terminal_42(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§43 ↑(r≠43)44 *handle_terminal_43(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§44 ↑(r≠44)45 *handle_terminal_44(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§45 ↑(r≠45)46 *handle_terminal_45(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§46 ↑(r≠46)47 *handle_terminal_46(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§47 ↑(r≠47)48 *handle_terminal_47(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§48 ↑(r≠48)49 *handle_terminal_48(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§49 ↑(r≠49)50 *handle_terminal_49(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§50 ↑(r≠50)51 *handle_terminal_50(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§51 ↑(r≠51)52 *handle_terminal_51(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§52 ↑(r≠52)53 *handle_terminal_52(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§53 ↑(r≠53)54 *handle_terminal_53(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§54 ↑(r≠54)55 *handle_terminal_54(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§55 ↑(r≠55)56 *handle_terminal_55(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§56 ↑(r≠56)57 *handle_terminal_56(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§57 ↑(r≠57)58 *handle_terminal_57(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§58 ↑(r≠58)59 *handle_terminal_58(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§59 ↑(r≠59)60 *handle_terminal_59(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§60 ↑(r≠60)61 *handle_terminal_60(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§61 ↑(r≠61)62 *handle_terminal_61(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§62 ↑(r≠62)63 *handle_terminal_62(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§63 ↑(r≠63)64 *handle_terminal_63(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§64 ↑(r≠64)65 *handle_terminal_64(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§65 ↑(r≠65)66 *handle_terminal_65(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§66 ↑(r≠66)67 *handle_terminal_66(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§67 ↑(r≠67)68 *handle_terminal_67(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§68 ↑(r≠68)69 *handle_terminal_68(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§69 ↑(r≠69)70 *handle_terminal_69(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§70 ↑(r≠70)71 *handle_terminal_70(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§71 ↑(r≠71)72 *handle_terminal_71(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§72 ↑(r≠72)73 *handle_terminal_72(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§73 ↑(r≠73)74 *handle_terminal_73(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§74 ↑(r≠74)75 *handle_terminal_74(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§75 ↑(r≠75)76 *handle_terminal_75(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§76 ↑(r≠76)77 *handle_terminal_76(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§77 ↑(r≠77)78 *handle_terminal_77(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§78 ↑(r≠78)79 *handle_terminal_78(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§79 ↑(r≠79)80 *handle_terminal_79(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§80 ↑(r≠80)81 *handle_terminal_80(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§81 ↑(r≠81)82 *handle_terminal_81(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§82 ↑(r≠82)83 *handle_terminal_82(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§83 ↑(r≠83)84 *handle_terminal_83(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/)→84
§84

**
handle_terminal_0(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** SUBPROGRAM -> HEAD BODY ** SUBPROGRAM
**
handle_terminal_1(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** SUBPROGRAM -> ε
**
handle_terminal_2(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** HEAD -> name ( INARGS / OUTARGS )
**
handle_terminal_3(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** INARGS -> INARG INARGS
**
handle_terminal_4(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** INARGS -> , INARGS
**
handle_terminal_5(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** INARGS -> ε
**
handle_terminal_6(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** INARG -> id
**
handle_terminal_7(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** INARG -> complex
**
handle_terminal_8(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OUTARGS -> OUTARG OUTARGS
**
handle_terminal_9(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OUTARGS -> , OUTARGS
**
handle_terminal_10(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OUTARGS -> ε
**
handle_terminal_11(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OUTARG -> id
**
handle_terminal_12(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OUTARG -> complex
**
handle_terminal_13(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** BODY -> EXPR
**
handle_terminal_14(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> * name ( CALLINARGS / CALLOUTARGS ) EXPR
**
handle_terminal_15(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> OPERAND OPERANDEXPR EXPR
**
handle_terminal_16(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> inc OPERAND EXPR
**
handle_terminal_17(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> dec OPERAND EXPR
**
handle_terminal_18(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> par const EXPR
**
handle_terminal_19(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> jump const EXPR
**
handle_terminal_20(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> cmp ( OPERAND CONDITIONOP OPERAND ) const EXPR
**
handle_terminal_21(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> swap ( SWAPEXPR ) EXPR
**
handle_terminal_22(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> zeroing ASSIGNABLEOPERAND EXPR
**
handle_terminal_23(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> maximize ASSIGNABLEOPERAND EXPR
**
handle_terminal_24(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> / complex CONSOLEACTION console EXPR
**
handle_terminal_25(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> at COMPLEXEXPR EXPR
**
handle_terminal_26(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** EXPR -> ε
**
handle_terminal_27(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** COMPLEXEXPR -> + complex ( const )
**
handle_terminal_28(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** COMPLEXEXPR -> zeroing complex
**
handle_terminal_29(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** COMPLEXEXPR -> string g complex
**
handle_terminal_30(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** SWAPEXPR -> id id
**
handle_terminal_31(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** SWAPEXPR -> complex SWAPFIRST SWAPSECOND
**
handle_terminal_32(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** SWAPFIRST -> id
**
handle_terminal_33(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** SWAPFIRST -> . const
**
handle_terminal_34(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** SWAPSECOND -> id
**
handle_terminal_35(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** SWAPSECOND -> const
**
handle_terminal_36(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CONSOLEACTION -> l
**
handle_terminal_37(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CONSOLEACTION -> g
**
handle_terminal_38(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** JUMPOP -> jz
**
handle_terminal_39(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** JUMPOP -> jnz
**
handle_terminal_40(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OPERANDEXPR -> ARITHMETICEXPR OPERANDEXPR
**
handle_terminal_41(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OPERANDEXPR -> assign ASSIGNABLEOPERAND
**
handle_terminal_42(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OPERANDEXPR -> JUMPOP const
**
handle_terminal_43(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICEXPR -> ARITHMETICOP OPERAND
**
handle_terminal_44(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** INDEX -> . const
**
handle_terminal_45(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** INDEX -> id
**
handle_terminal_46(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICOP -> +
**
handle_terminal_47(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICOP -> -
**
handle_terminal_48(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICOP -> *
**
handle_terminal_49(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICOP -> /
**
handle_terminal_50(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICOP -> ;
**
handle_terminal_51(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICOP -> and
**
handle_terminal_52(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICOP -> or
**
handle_terminal_53(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICOP -> xor
**
handle_terminal_54(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICOP -> g
**
handle_terminal_55(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ARITHMETICOP -> l
**
handle_terminal_56(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CONDITIONOP -> e
**
handle_terminal_57(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CONDITIONOP -> ne
**
handle_terminal_58(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CONDITIONOP -> g
**
handle_terminal_59(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CONDITIONOP -> ge
**
handle_terminal_60(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CONDITIONOP -> l
**
handle_terminal_61(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CONDITIONOP -> le
**
handle_terminal_62(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OPERAND -> id
**
handle_terminal_63(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OPERAND -> const
**
handle_terminal_64(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OPERAND -> complex INDEX
**
handle_terminal_65(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OPERAND -> length
**
handle_terminal_66(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OPERAND -> capacity
**
handle_terminal_67(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OPERAND -> random
**
handle_terminal_68(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** OPERAND -> time
**
handle_terminal_69(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ASSIGNABLEOPERAND -> id
**
handle_terminal_70(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ASSIGNABLEOPERAND -> complex INDEX
**
handle_terminal_71(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ASSIGNABLEOPERAND -> length
**
handle_terminal_72(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** ASSIGNABLEOPERAND -> random
**
handle_terminal_73(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLINARGS -> CALLINARG CALLINARGS
**
handle_terminal_74(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLINARGS -> , CALLINARGS
**
handle_terminal_75(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLINARGS -> ε
**
handle_terminal_76(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLINARG -> id
**
handle_terminal_77(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLINARG -> const
**
handle_terminal_78(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLINARG -> complex
**
handle_terminal_79(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLOUTARGS -> CALLOUTARG CALLOUTARGS
**
handle_terminal_80(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLOUTARGS -> , CALLOUTARGS
**
handle_terminal_81(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLOUTARGS -> ε
**
handle_terminal_82(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLOUTARG -> id
**
handle_terminal_83(L1,F2,L3,L4,F5,L6,F7,L8,F9,L10,i/) *** CALLOUTARG -> complex
**
#stack_push_single(L1,x/L1)
#stack_pop_single(L1/L1,x)
#stack_has_values(L1/r)