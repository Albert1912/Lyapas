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
llparse(F3,L4,L5,L6,L7,L8/L20,L21,r)
    Oi *** i - tokens pointer
    *** x - top of stack
    @+F80(1000)
    @+L10(1000) *** stack
    @+L11(15) *** temp
    L5.0⇒L11.0 33⇒L11.1 2⇒Q11
    *stack_push(L10,L11/L10)
    @+L22(10000)
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
    *handle_applied_rule(L20,L21,L22,j/L20,L21,L22)
    *stack_pop(L10,1/L10,L11)
    *get_rule_by_id(L5,L6,j/L3,r) r↪2
    *stack_push(L10,L3/L10) →1
§11
    @'accept: '>F80 *write(F80/) OQ80 *writev_line(a/)
    *handle_accepted_terminal(L20,L21,L22,F3,L4,i/L20,L21,L22)
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

#writev_line(a/)
#write(F1/)

#handle_applied_rule(L1,L2,L3,i/L1,L2,L3)
#handle_accepted_terminal(L1,L2,L3,F4,L5,i/L1,L2,L3)