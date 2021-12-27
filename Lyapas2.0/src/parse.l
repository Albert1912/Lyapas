********************************************************************
*** syntax parser
*** F3 - token array
*** L4 - token array metadata
*** L5 - rules array
*** L6 - rules array metadata
*** L7 - terminals
*** L8 - used rules
*** r - result (0 - fail, >0 - ok)
********************************************************************
parse(F3,L4,L5,L6,L7/L8,r)
    @+L1(500) *** stack L1
    @+L2(500) *** stack L2
    0⇒i *** i - token array pointer
    0⇒s *** s - state (0 - Q, 1 - B, 2 - T(not used))

    @+L9(100) @+L10(100) @+L11(100)
    L5.0@>L9 *** L9 - L11 - temp for stacks
    OQ8
    *stack_push(L2,L9/L2)

    @+F90(1000) *** *n2s(r/F90) *log(F90/)
§1 *** main loop
    s↪3 ↦4
§3 *** state Q
    *** tree extension
    *stack_peek(L2/x)
    *is_terminal(L7,x/r) r↦32
    *stack_pop(L2,1/L2,L9)
    L9.0⇒t OQ10 t@>L10
    *get_rule(L5,L6,t,1/L9,r) @<L9.0
    *stack_push(L2,L9/L2)
    *pack_alternative(L10.0,1/L10.0) 1⇒Q10
    *stack_push(L1,L10/L1)
§32
    *** compare
    *stack_peek(L2/x)
    *is_terminal(L7,x/r) r↪33
    *get_token_id(L4,i/d) d⊕x↦321
    ∆i *stack_pop(L2,1/L2,L10) OQ10 x@>L10 *stack_push(L1,L10/L1)
    →33
§321
    1⇒s→33

§33
    *** end
    Q2↦331
    ↑(i≠L4.0)332
    →5 *** T state
§331 *** L2 not empty
    ↑(i≤L4.0)333
§332
    1⇒s
§333    
    →1

§4 *** state B
    *stack_peek(L1/p)
    *unpack_alternative(p/x,a,r) r↦42
§41 *** terminal
    ∇i *stack_pop(L1,1/L1,L10)
    OQ10 p@>L10 *stack_push(L2,L10/L2)
    →1
§42 *** non terminal
    a+1⇒b
    *get_rule(L5,L6,x,b/L10,r) r↪43

    *** has alternatives
    *stack_pop(L1,1/L1,L9)
    *pack_alternative(x,b/L9.0)
    *stack_push(L1,L9/L1)
    *get_rule(L5,L6,x,a/L11,r) @<L11.0
    *stack_pop(L2,Q11/L2,L9) @<L10.0
    *stack_push(L2,L10/L2)
    0⇒s→1

§43 *** no alternatives
    ↑(i≠0)431
    ↑(x=L5.0)6 *** fatal
§431
    *get_rule(L5,L6,x,a/L10,r) Q10-1⇒Q10
    *stack_pop(L2,Q10/L2,L9) 1⇒Q10
    *stack_push(L2,L10/L2)
    *stack_pop(L1,1/L1,L9)
    →1

§5 *** state T
    1⇒r ↑(Q1=0)7
    *stack_pop(L1,1/L1,L9)
    *unpack_alternative(L9.0/x,a,r) r↪5
    x@>L8 a@>L8 →5
§6
    /'Fatal!\n'>C
    0⇒r
§7
    **
********************************************************************
*** check if symbol is terminal
*** x - element
*** L1 - list of terminals
*** r - result (>0 - ok, 0 - failed)
********************************************************************
is_terminal(L1,x/r)
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
*** pack alternative
*** x - left rule part
*** a - alternative index
*** r - result
********************************************************************
pack_alternative(x,a/r)
    x<16+a⇒r
	**
********************************************************************
*** unpack alternative
*** p - packed alternative
*** x - left rule part
*** a - alternative index
*** r - result (>1 - ok, 0 - failed)
********************************************************************
unpack_alternative(p/x,a,r)
    p>16⇒x
    p&FFh⇒a x⇒r
	**
********************************************************************
#stack_push(L1,L2/L1)
#stack_pop(L1,k/L1,L2)
#stack_peek(L1/x)

#get_token_id(L1,i/d)
#get_rule(L1,L2,l,i/L3,r)
#add_rule(L1,L2,L3,i/L1,L2)
