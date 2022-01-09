********************************************************************
*** lexical parser
*** F1 - input text
*** F2 - token array
*** L3 - token array metadata
********************************************************************
lex(F1/F2,L3)
    Q1-1⇒n Oj *** eof
    @+F4(100)
    *init_token_array(/F2,L3)
§1
    *** i - token id
    ↑(j≥n)4
    ↑(F1j=32)2
    ↑(F1j=10)2
    ↑(F1j=13)2
    *get_length(F1,j/r,l,F4) 35⇒i r↦3
    *get_capacity(F1,j/r,l,F4) 36⇒i r↦3
    *get_name(F1,j/r,l,F4) 24⇒i r↦3
    *get_ret(F1,j/r,l,F4) 34⇒i r↦3
    *get_variable(F1,j/r,l,F4) 1⇒i r↦3
    *get_constant(F1,j/r,l,F4) 2⇒i r↦3
    *get_assign(F1,j/r,l,F4) 3⇒i r↦3
    *get_lpar(F1,j/r,l,F4) 4⇒i r↦3
    *get_rpar(F1,j/r,l,F4) 5⇒i r↦3
    *get_complex(F1,j/r,l,F4) 6⇒i r↦3
    *get_up_arrow(F1,j/r,l,F4) 7⇒i r↦3
    *get_jump(F1,j/r,l,F4) 8⇒i r↦3
    *get_jump_not_zero(F1,j/r,l,F4) 9⇒i r↦3
    *get_jump_zero(F1,j/r,l,F4) 10⇒i r↦3
    *get_mark(F1,j/r,l,F4) 11⇒i r↦3
    *get_equal(F1,j/r,l,F4) 12⇒i r↦3
    *get_not_equal(F1,j/r,l,F4) 13⇒i r↦3
    *get_less(F1,j/r,l,F4) 14⇒i r↦3
    *get_greater(F1,j/r,l,F4) 15⇒i r↦3
    *get_less_or_equal(F1,j/r,l,F4) 16⇒i r↦3
    *get_greater_or_equal(F1,j/r,l,F4) 17⇒i r↦3
    *get_dot(F1,j/r,l,F4) 18⇒i r↦3
    *get_star(F1,j/r,l,F4) 19⇒i r↦3
    *get_plus(F1,j/r,l,F4) 20⇒i r↦3
    *get_minus(F1,j/r,l,F4) 21⇒i r↦3
    *get_slash(F1,j/r,l,F4) 22⇒i r↦3
    *get_at(F1,j/r,l,F4) 23⇒i r↦3
    *get_comma(F1,j/r,l,F4) 25⇒i r↦3
    *get_inversion(F1,j/r,l,F4) 26⇒i r↦3
    *get_percent(F1,j/r,l,F4) 27⇒i r↦3
    *get_or(F1,j/r,l,F4) 28⇒i r↦3
    *get_and(F1,j/r,l,F4) 29⇒i r↦3
    *get_xor(F1,j/r,l,F4) 30⇒i r↦3
    *get_inc(F1,j/r,l,F4) 31⇒i r↦3
    *get_dec(F1,j/r,l,F4) 32⇒i r↦3
    *get_semicolon(F1,j/r,l,F4) 37⇒i r↦3
    *get_zeroing(F1,j/r,l,F4) 38⇒i r↦3
    *get_maximize(F1,j/r,l,F4) 39⇒i r↦3
    *get_random(F1,j/r,l,F4) 40⇒i r↦3
    *get_time(F1,j/r,l,F4) 41⇒i r↦3
    *get_string(F1,j/r,l,F4) 42⇒i r↦3
    *get_swap(F1,j/r,l,F4) 44⇒i r↦3

    @+F5(50) @'[LEXICAL ERROR] Unexpected token at position '>F5 *write(F5/)
    *writev_line(j/) →4
§2
    ∆j →1 *** skip space, LF, CR
§3
    *add_token(F2,L3,F4,i,j/F2,L3)

    j+l⇒j →1
§4
    3⇒Q4 101⇒F4.0 111⇒F4.1 102⇒F4.2
    *add_token(F2,L3,F4,33,j/F2,L3)
    **
********************************************************************
*** try get constant token from text (bytes with value from 48 to 57)
*** F1 - text
*** p - start position
*** r - result (0 - failed, > 0 - success)
*** l - length of constant
*** F2 - constant value
********************************************************************
~get_constant(F1,p/r,l,F2)
    p⇒j Q1⇒n OQ2
§1
    ↑(j=n)2
    ↑(F1j<48)2
    ↑(F1j>57)2
    F1j@>F2
    ∆j →1
§2
    Q2⇒r⇒l
    **
********************************************************************
*** try get variable token from text (bytes with value from 97 to 122)
*** F1 - text
*** p - start position
*** r - result (0 - failed, > 0 - success)
*** l - length of constant
*** F2 - variable name
********************************************************************
~get_variable(F1,p/r,l,F2)
    Q1⇒n OQ2
    ↑(F1p<97)1
    ↑(F1p>122)1
    F1p@>F2
§1
    Q2⇒r⇒l
    **
********************************************************************
*** try get plus token from text
*** F1 - text
*** p - start position
*** r - result (0 - failed, > 0 - success)
*** l - length of constant
*** F2 - variable name
********************************************************************
~get_assign(F1,p/r,l,F2)
    @+F3(4) @'⇒'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_lpar(F1,p/r,l,F2)
    40⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_rpar(F1,p/r,l,F2)
    41⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_complex(F1,p/r,l,F2)
    @+F3(1)
    70⇒v *get_single(F1,p,v/r,l,F3) r↪2
    ∆p *get_constant(F1,p/r,l,F2) r↪4 →5
§2
    76⇒v *get_single(F1,p,v/r,l,F3) r↪4
    ∆p *get_constant(F1,p/r,l,F2) r↪4 →5
§4
    0⇒l⇒r →6
§5
    F3.0@>F2.0 ∆l⇒r
§6
    **
********************************************************************
~get_up_arrow(F1,p/r,l,F2)
    @+F3(4) @'↑'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_jump(F1,p/r,l,F2)
    @+F3(4) @'→'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_jump_not_zero(F1,p/r,l,F2)
    @+F3(4) @'↦'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_jump_zero(F1,p/r,l,F2)
    @+F3(4) @'↪'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_equal(F1,p/r,l,F2)
    61⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_not_equal(F1,p/r,l,F2)
    @+F3(4) @'≠'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_less(F1,p/r,l,F2)
    60⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_greater(F1,p/r,l,F2)
    62⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_less_or_equal(F1,p/r,l,F2)
    @+F3(4) @'≤'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_greater_or_equal(F1,p/r,l,F2)
    @+F3(4) @'≥'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_dot(F1,p/r,l,F2)
    46⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_star(F1,p/r,l,F2)
    42⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_plus(F1,p/r,l,F2)
    43⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_mark(F1,p/r,l,F2)
    @+F3(4) @'§'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_minus(F1,p/r,l,F2)
    @+F3(4) @'-'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_slash(F1,p/r,l,F2)
    @+F3(4) @'/'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_at(F1,p/r,l,F2)
    64⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_semicolon(F1,p/r,l,F2)
    59⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_zeroing(F1,p/r,l,F2)
    79⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_maximize(F1,p/r,l,F2)
    @+F3(4) @'⁻'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_random(F1,p/r,l,F2)
    88⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_time(F1,p/r,l,F2)
    84⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_string(F1,p/r,l,F2)
    @+F3(1000) OQ2 Oz Or
    39⇒v *get_single(F1,p,v/t,x,F3) t↪3
§1
     ∆p *get_single(F1,p,v/t,x,F3) t↦2 F1p⇒F2z ∆z ∆Q2 →1
§2
    z+2⇒r⇒l
§3
    **
********************************************************************
*** todo: length, capacity and other constructions can be parsed incorrect
~get_name(F1,p/r,l,F2)
    p⇒j Q1⇒n OQ2 Or
§1
    ↑(j=n)2
    ↑(F1j<48)4
    ↑(F1j>57)2
    F1j@>F2
    ∆j →1
§2
    ↑(F1j<65)4
    ↑(F1j>90)3
    F1j@>F2
    ∆j →1
§3
    ↑(F1j<97)4
    ↑(F1j>122)4
    F1j@>F2
    ∆j →1
§4
    ↑(Q2=1)7
    @+F3(1000)
    *** check name is complex name
    *get_complex(F1,p/t,m,F3)
    t↪5 *** can't parse complex
    m⊕Q2↪7 *** can parse complex, but length of name not equals length of complex
§5
    *** check name is not constant
    *get_constant(F1,p/t,m,F3)
    t↪6 *** can't parse constant
    m⊕Q2↪7 *** can parse constant, but length of name not equals length of constant
§6
    Q2⇒r⇒l
§7
    **
********************************************************************
~get_comma(F1,p/r,l,F2)
    44⇒v *get_single(F1,p,v/r,l,F2)
    **
********************************************************************
~get_inversion(F1,p/r,l,F2)
    @+F3(4) @'¬'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_percent(F1,p/r,l,F2)
    @+F3(4) @'%'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_or(F1,p/r,l,F2)
    @+F3(4) @'∨'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_and(F1,p/r,l,F2)
    @+F3(4) @'&'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_xor(F1,p/r,l,F2)
    @+F3(4) @'⊕'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_inc(F1,p/r,l,F2)
    @+F3(4) @'∆'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_dec(F1,p/r,l,F2)
    @+F3(4) @'∇'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_ret(F1,p/r,l,F2)
    @+F3(4) @'**'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_swap(F1,p/r,l,F2)
    @+F3(4) @'⇔'>F3 *get_entry(F1,p,F3/r,l,F2)
    **
********************************************************************
~get_length(F1,p/r,l,F2)
    @+F3(1)
    81⇒v *get_single(F1,p,v/r,l,F3) r↪4
    ∆p *get_constant(F1,p/r,l,F2) r↪4 →5
§4
    0⇒l⇒r →6
§5
    F3.0@>F2.0 ∆l⇒r
§6
    **
********************************************************************
~get_capacity(F1,p/r,l,F2)
    @+F3(1)
    67⇒v *get_single(F1,p,v/r,l,F3) r↪4
    ∆p *get_constant(F1,p/r,l,F2) r↪4 →5
§4
    0⇒l⇒r →6
§5
    F3.0@>F2.0 ∆l⇒r
§6
    **
********************************************************************
*** try get single value from text
*** F1 - text
*** p - start position
*** v - value
*** r - result (0 - failed, > 0 - success)
*** l - length (always 1 if success)
*** F2 - value (always equal char(v) if success)
********************************************************************
~get_single(F1,p,v/r,l,F2)
    OQ2
    ↑(F1p≠v)1
    F1p@>F2
§1
    Q2⇒r⇒l
    **
********************************************************************
*** try get entry value from text
*** F1 - text
*** p - start position
*** F2 - value
*** r - result (0 - failed, > 0 - success)
*** l - length
*** F3 - value
********************************************************************
~get_entry(F1,p,F2/r,l,F3)
    OQ3
    Oj Q1⇒n p⇒i
§1
    ↑(i=n)2
    ↑(j=Q2)2
    ↑(F1i≠F2j)2
    F1i@>F3
    ∆j∆i→1
§2
    ↑(Q2=Q3)3 0⇒r →4
§3
    Q2⇒r⇒l
§4
    **
********************************************************************
#init_token_array(/F1,L2)
#add_token(F1,L2,F3,i,p/F1,L2)
#write_line(F1/)
#write(F1/)
#writev_line(a/)
