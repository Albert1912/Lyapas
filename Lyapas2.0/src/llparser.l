********************************************************************
*** syntax parser
*** F3 - token array
*** L4 - token array metadata
*** L5 - rules array
*** L6 - rules array metadata
*** L7 - terminals
*** L8 - syntax table
*** r - result (0 - fail, >0 - ok)
********************************************************************
llparse(F3,L4,L5,L6,L7,L8/r)
    Oi *** i - tokens pointer
    x *** x - top of stack
    @+F80(1000)
    @+L10(1000) *** stack
    @+L11(15) *** temp
    @+L20(10000) @+F21(10000) @+L22(10000) *** context
    @+L23(10000) @+F24(10000) @+L25(10000) @+F26(10000)
    L5.0⇒x⇒L11.0 1⇒Q11
    *stack_push(L10,L11/L10)

§1
    *stack_has_values(L10/r) r↪3
    *stack_peek(L10/x)
    @'stack top: '>F80 *write(F80/) OQ80 *writev_line(x/)
    *get_token_id(L4,i/a)
    @'current terminal: '>F80 *write(F80/) OQ80 *writev_line(a/)
    a⊕x↪11 *** a - current token
    *is_terminal(L7,x/r) r↦2
    *try_get_syntax_table_transition(L8,x,a/j,r) r↪2
    @'apply: '>F80 *write(F80/) OQ80 *writev_line(j/)
    *handle_applied_rule(L20,F21,L22,L23,F24,L25,F26,j/)
    *stack_pop(L10,1/L10,L11)
    *get_rule_by_id(L5,L6,j/L3,r) r↪2
    *stack_push(L10,L3/L10) →1
§11
    @'accept: '>F80 *write(F80/) OQ80 *writev_line(a/)
    *handle_accepted_terminal(L20,F21,L22,L23,F24,L25,F26,F3,L4,i/)
    ∆i *stack_pop(L10,1/L10,L11) →1 *** X == a
§2
    *** error
    *get_token_position(L4,i/p)
    @'[SYNTAX ERROR] Unexpected token at position: '>F80 *write(F80/)
    *writev_line(p/)
    0⇒r →4
§3
    *** ok
    1⇒r
§4
**
********************************************************************
*** check if symbol is terminal
*** x - element
*** L1 - list of terminals
*** r - result (>0 - ok, 0 - failed)
********************************************************************
~is_terminal(L1,x/r)
    Q1⇒n Oj
§1
    ↑(j=n)2
    ↑(L1j=x)3
    ∆j →1
§2
	0⇒r→4
§3
	1⇒r
§4
	**
********************************************************************
#try_get_syntax_table_transition(L1,n,t/i,r)
#get_rule_by_id(L1,L2,i/L3,r)
#stack_push(L1,L2/L1)
#stack_pop(L1,k/L1,L2)
#stack_peek(L1/x)
#stack_has_values(L1/r)
#get_token_id(L1,i/d)
#get_token_position(L1,i/p)
#write_line(F1/)
#write(F1/)
#writev_line(a/)
#handle_applied_rule(L1,F2,L3,L4,F5,L6,F7,i/)
#handle_accepted_terminal(L1,F2,L3,L4,F5,L6,F7,F8,L9,i/)
