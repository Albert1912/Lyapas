********************************************************************
*** produces byte code from syntax tree
*** L1, L2 - tree
*** F3, L4 - token array
*** F5 - byte code
*** r - result (0 - fail, >0 - ok)
*** L11,F12,L13,L14,F15,L16,L17,F18 - context
********************************************************************
produce_byte_code(L1,L2,F3,L4,F5/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    *init_context(L11,F12,L13,L14,F15,L16,L17,F18/)
    *subprogram_node_visitor(L1,L2,F3,L4,F5,0/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
**
********************************************************************
*** subprogram node visitor
*** L1, L2 - tree
*** F3, L4 - token array
*** F5 - byte code
*** n- node
*** r - result (0 - fail, >0 - ok)
********************************************************************
~subprogram_node_visitor(L1,L2,F3,L4,F5,n/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *get_token(F3,L4,v/F90)
    *add_subprogram(L11,F12,L13,L14,F15,L16,F90/i,r) r↪1

    *append_byte_code_2(F5,0,i/F5) i⇒s

    *get_child_node_index(L1,L2,n,1/i)
    *input_args_node_visitor(L1,L2,F3,L4,F5,i,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪2

    *get_child_node_index(L1,L2,n,2/i)
    *output_args_node_visitor(L1,L2,F3,L4,F5,i,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪2

    *get_child_node_index(L1,L2,n,3/i)
    *body_node_visitor(L1,L2,F3,L4,F5,i,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪2

    *append_byte_code_1(F5,1/F5)
    *get_node_child_count(L1,L2,n/c)
    ↑(c≠6)2

    *get_child_node_index(L1,L2,n,5/i)
    *subprogram_node_visitor(L1,L2,F3,L4,F5,i/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    →2
§1
    @+F91(100)
    @'[SYNTAX ERROR] subprogram "'>F91 *write(F91/)  *write(F90/)
    OQ91 @'" already defined '>F91 *write_line(F91/)
§2
**
********************************************************************
~input_args_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_node_child_count(L1,L2,n/c)
    Ok Or
§1
    ↑(k=c)6
    *get_child_node_index(L1,L2,n,k/j)
    *get_node_info(L1,L2,j/i,v)
    i⊕6↪2 i⊕7↪3 →4
§2
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *add_input_arg(L11,L13,s,0,j/z,r) r↪5
    →4 *** id
§3
    *get_token(F3,L4,v/F90)
    F90.0⇒t
    *s2ns(F90,1/d) t⊕76 ↪31
    0⇒t →32
§31
    1⇒t
§32
    *add_complex(L11,L16,s,t,d,0,1/j,r) r↪5
    t+1⇒t
    *add_input_arg(L11,L13,s,t,j/z,r) r↪5
    →4 *** complex
§4
    ∆k →1
§5
    @+F91(100)
    @'[SYNTAX ERROR] input argument "'>F91 *write(F91/)  *write(F90/)
    OQ91 @'" already defined'>F91 *write_line(F91/) →7
§6
    1⇒r
§7
**
********************************************************************
~output_args_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100) @+F91(100)
    *get_node_child_count(L1,L2,n/c)
    Ok Or
§1
    ↑(k=c)6
    *get_child_node_index(L1,L2,n,k/j)
    *get_node_info(L1,L2,j/i,v)
    i⊕6↪2 i⊕7↪3 →4
§2
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *add_output_arg(L11,L14,s,0,j/z,r) r↪5
    →4 *** id
§3
    @'[SYNTAX ERROR] pass complex as output argument make no sense and not supported'>F91
    *write_line(F91/) Or
    →7 *** complex
§4
    ∆k →1
§5
    @'[SYNTAX ERROR] input argument "'>F91 *write(F91/)  *write(F90/)
    OQ91 @'" already defined'>F91 *write_line(F91/) →7
§6
    1⇒r
§7
**
********************************************************************
*** body node visitor
*** L1, L2 - tree
*** F3, L4 - token array
*** F5 - byte code
*** n - body node
*** s - subprogram index
*** r - result (0 - fail, >0 - ok)
********************************************************************
~body_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    *get_node_child_count(L1,L2,n/c)
    Ok Or
§1 ↑(k=c)2
    *get_child_node_index(L1,L2,n,k/j)
    *get_node_info(L1,L2,j/i,v)

    i⊕10 ↦11 *add_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§11 i⊕11 ↦12 *sub_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§12 i⊕12 ↦13 *mul_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§13 i⊕13 ↦14 *div_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§14 i⊕14 ↦15 *mod_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§15 i⊕15 ↦16 *or_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§16 i⊕16 ↦17 *and_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§17 i⊕17 ↦18 *xor_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§18 i⊕18 ↦19 *assign_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§19 i⊕19 ↦20 *swap_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§20 i⊕20 ↦21 *zeroing_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§21 i⊕21 ↦22 *maximize_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§22 i⊕22 ↦23 *lowerone_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§23 i⊕23 ↦24 *inversion_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§24 i⊕24 ↦25 *weighing_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§25 i⊕25 ↦26 *operand_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§26 i⊕26 ↦27 *left_shift_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§27 i⊕27 ↦28 *right_shift_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§28 i⊕28 ↦29 *inc_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§29 i⊕29 ↦30 *dec_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§30 i⊕30 ↦31 *jz_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§31 i⊕31 ↦32 *jnz_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§32 i⊕32 ↦33 *jump_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§33 i⊕33 ↦34 *cmp_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§34 i⊕34 ↦35 *label_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§35 i⊕35 ↦36 *create_complex_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§36 i⊕36 ↦37 *zeroing_complex_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§37 i⊕37 ↦50 *append_string_to_complex_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§50 i⊕50 ↦51 *call_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§51 i⊕51 ↦52 *console_node_visitor(L1,L2,F3,L4,F5,j,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪3
§52
    ∆k →1
§2
    1⇒r
§3
**
********************************************************************
~add_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_2(F5,2,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,2,1/F5)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *append_byte_code_2(F5,2,2/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *append_byte_code_2(F5,2,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_2(F5,2,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,2,5/F5)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_2(F5,2,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_2(F5,2,7/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
********************************************************************
~sub_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_2(F5,3,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,3,1/F5)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *append_byte_code_2(F5,3,2/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *append_byte_code_2(F5,3,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_2(F5,3,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,3,5/F5)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_2(F5,3,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_2(F5,3,7/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
********************************************************************
~mul_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_2(F5,4,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,4,1/F5)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *append_byte_code_2(F5,4,2/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *append_byte_code_2(F5,4,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_2(F5,4,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,4,5/F5)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_2(F5,4,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_2(F5,4,7/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
********************************************************************
~div_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_2(F5,5,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,5,1/F5)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *append_byte_code_2(F5,5,2/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *append_byte_code_2(F5,5,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_2(F5,5,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,5,5/F5)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_2(F5,5,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_2(F5,5,7/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
**
********************************************************************
~mod_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_2(F5,6,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,6,1/F5)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *append_byte_code_2(F5,6,2/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *append_byte_code_2(F5,6,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_2(F5,6,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,6,5/F5)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_2(F5,6,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_2(F5,6,7/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
**
********************************************************************
~or_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_2(F5,7,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,7,1/F5)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *append_byte_code_2(F5,7,2/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *append_byte_code_2(F5,7,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_2(F5,7,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,7,5/F5)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_2(F5,7,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_2(F5,7,7/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
**
********************************************************************
~and_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_2(F5,8,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,8,1/F5)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *append_byte_code_2(F5,8,2/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *append_byte_code_2(F5,8,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_2(F5,8,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,8,5/F5)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_2(F5,8,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_2(F5,8,7/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
**
********************************************************************
~xor_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_2(F5,9,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,9,1/F5)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *append_byte_code_2(F5,9,2/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *append_byte_code_2(F5,9,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_2(F5,9,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,9,5/F5)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_2(F5,9,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_2(F5,9,7/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
**
********************************************************************
~assign_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *append_byte_code_1(F5,10/F5)
    i⊕6↪1 i⊕39↪2 i⊕41↪3 i⊕8↪4 Or →5
§1 *** id
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_1(F5,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5) →5
§2 *** length
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦21
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪22
§21
    *append_byte_code_1(F5,1/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →5
§22
    Or *** error
    →6 *** length
§3 *** random
    *append_byte_code_1(F5,2/F5) →5
§4 *** complex element
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_1(F5,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →6
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →5 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →5 *** const
§82
    Or *** error
    →6 *** complex element
§5
    1⇒r
§6
**
********************************************************************
~swap_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_node_child_count(L1,L2,n/c)
    *append_byte_code_1(F5,11/F5)
    c⊕2↪1 c⊕3↪2 Or →4
§1
    *append_byte_code_1(F5,0/F5)
    *get_child_node_index(L1,L2,n,0/x)
    *get_node_info(L1,L2,x/i,v)
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)

    *get_child_node_index(L1,L2,n,1/x)
    *get_node_info(L1,L2,x/i,v)
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →3 *** id id
§2
    *append_byte_code_1(F5,1/F5)
    *get_child_node_index(L1,L2,n,0/x)
    *get_node_info(L1,L2,x/i,v)
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦21
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪22
§21
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)

    *get_child_node_index(L1,L2,n,1/x)
    *get_node_info(L1,L2,x/i,v)
    i⊕6↪811 i⊕9↪812 →4
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →813 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →813 *** const
§813
    *get_child_node_index(L1,L2,n,2/x)
    *get_node_info(L1,L2,x/i,v)
    i⊕6↪911 i⊕9↪912 →4
§911
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →3 *** id
§912
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →3 *** const
§22
    Or *** error
    →4 *** complex elements
§3
    1⇒r
§4
**
********************************************************************
~zeroing_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *append_byte_code_1(F5,12/F5)
    i⊕6↪1 i⊕39↪2 i⊕41↪3 i⊕8↪4 Or →5
§1 *** id
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_1(F5,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5) →5
§2 *** length
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦21
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪22
§21
    *append_byte_code_1(F5,1/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →5
§22
    Or *** error
    →6 *** length
§3 *** random
    *append_byte_code_1(F5,2/F5) →5
§4 *** complex element
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_1(F5,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →6
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →5 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →5 *** const
§82
    Or *** error
    →6 *** complex element
§5
    1⇒r
§6
**
********************************************************************
~maximize_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *append_byte_code_1(F5,13/F5)
    i⊕6↪1 i⊕39↪2 i⊕41↪3 i⊕8↪4 Or →5
§1 *** id
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_1(F5,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5) →5
§2 *** length
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦21
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪22
§21
    *append_byte_code_1(F5,1/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →5
§22
    Or *** error
    →6 *** length
§3 *** random
    *append_byte_code_1(F5,2/F5) →5
§4 *** complex element
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_1(F5,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →6
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →5 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →5 *** const
§82
    Or *** error
    →6 *** complex element
§5
    1⇒r
§6
**
********************************************************************
~lowerone_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    *append_byte_code_1(F5,14/F5)
**
********************************************************************
~inversion_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    *append_byte_code_1(F5,15/F5)
**
********************************************************************
~weighing_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    *append_byte_code_1(F5,16/F5)
**
********************************************************************
~operand_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *append_byte_code_1(F5,17/F5)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *split_variable(j/z,x,y,w)
    *append_byte_code_5(F5,2,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *split_variable(j/z,x,y,w)
    *append_byte_code_5(F5,3,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_1(F5,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_5(F5,5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_5(F5,5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_1(F5,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *split_variable(j/z,x,y,w)
    *append_byte_code_5(F5,7,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
********************************************************************
~left_shift_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_2(F5,18,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,18,1/F5)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *append_byte_code_2(F5,18,2/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *append_byte_code_2(F5,18,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_2(F5,18,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,18,5/F5)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_2(F5,18,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_2(F5,18,7/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
********************************************************************
~right_shift_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) 1⇒r
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_2(F5,19,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,19,1/F5)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *append_byte_code_2(F5,19,2/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *append_byte_code_2(F5,19,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_2(F5,19,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *append_byte_code_2(F5,19,5/F5)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_4(F5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_2(F5,19,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_2(F5,19,7/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
**
********************************************************************
~inc_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
@+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *append_byte_code_1(F5,20/F5)
    i⊕6↪1 i⊕39↪2 i⊕41↪3 i⊕8↪4 Or →5
§1 *** id
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_1(F5,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5) →5
§2 *** length
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦21
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪22
§21
    *append_byte_code_1(F5,1/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →5
§22
    Or *** error
    →6 *** length
§3 *** random
    *append_byte_code_1(F5,2/F5) →5
§4 *** complex element
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_1(F5,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →6
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →5 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →5 *** const
§82
    Or *** error
    →6 *** complex element
§5
    1⇒r
§6
**
********************************************************************
~dec_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *append_byte_code_1(F5,21/F5)
    i⊕6↪1 i⊕39↪2 i⊕41↪3 i⊕8↪4 Or →5
§1 *** id
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *append_byte_code_1(F5,0/F5)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5) →5
§2 *** length
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦21
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪22
§21
    *append_byte_code_1(F5,1/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    →5
§22
    Or *** error
    →6 *** length
§3 *** random
    *append_byte_code_1(F5,2/F5) →5
§4 *** complex element
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *append_byte_code_1(F5,3/F5)
    *split_variable(j/z,x,y,w)
    *append_byte_code_4(F5,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,0/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →6
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →5 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →5 *** const
§82
    Or *** error
    →6 *** complex element
§5
    1⇒r
§6
**
********************************************************************
~jz_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(30)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)

    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,22,a,b,c,d/F5)
    1⇒r
**
********************************************************************
~jnz_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(30)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)

    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,23,a,b,c,d/F5)
    1⇒r
**
********************************************************************
~jump_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(30)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)

    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,24,a,b,c,d/F5)
    1⇒r
**
********************************************************************
~cmp_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    *append_byte_code_1(F5,25/F5)
    *build_operand_node_visitor(L1,L2,F3,L4,F5,n,s,0/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪1
    *build_operand_node_visitor(L1,L2,F3,L4,F5,n,s,2/F5,r,L11,F12,L13,L14,F15,L16,L17,F18) r↪1

    *get_child_node_index(L1,L2,n,1/c)
    *get_node_info(L1,L2,c/i,v)
    i-44⇒i *append_byte_code_1(F5,i/F5)

    @+F90(100)
    *get_child_node_index(L1,L2,n,3/c)
    *get_node_info(L1,L2,c/i,v)
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
    1⇒r
§1
**
********************************************************************
~build_operand_node_visitor(L1,L2,F3,L4,F5,n,s,q/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_child_node_index(L1,L2,n,q/c)
    *get_node_info(L1,L2,c/i,v)

    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *split_variable(j/z,x,y,w)
    *append_byte_code_5(F5,2,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *split_variable(j/z,x,y,w)
    *append_byte_code_5(F5,3,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_1(F5,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_5(F5,5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_5(F5,5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_1(F5,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *split_variable(j/z,x,y,w)
    *append_byte_code_5(F5,7,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,q/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§9
    1⇒r
§10
**
********************************************************************
~label_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(30)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)

    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,26,a,b,c,d/F5)
    1⇒r
**
********************************************************************
~create_complex_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(30) @+F92(30)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *get_token(F3,L4,v/F90)
    F90.0⇒t
    *s2ns(F90,1/d) t⊕76 ↪31
    0⇒t →32
§31
    1⇒t
§32
    *** t - type
    *** d - index

    *get_child_node_index(L1,L2,n,1/c)
    *get_node_info(L1,L2,c/i,v)
    *get_token(F3,L4,v/F92)
    *s2n(F92/x)
    *** x - capacity
    *add_complex(L11,L16,s,t,d,x,0/j,r) r↪5
    1⇒r →6
§5
    @+F91(100)
    @'[SYNTAX ERROR] complex '>F91 *write(F91/) *write(F90/)
    OQ91 @' already created or passed as argument'>F91 *write_line(F91/) Or→6
§6
**
********************************************************************
~zeroing_complex_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(30) @+F92(30)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *get_token(F3,L4,v/F90)
    F90.0⇒t
    *s2ns(F90,1/d) t⊕76 ↪31
    0⇒t →32
§31
    1⇒t
§32
    *** t - type
    *** d - index

    *get_complex_id_by_name(L11,L16,s,t,d/j,r) r↪5

    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,27,a,b,c,d/F5) →6
§5
    @+F91(100)
    @'[SYNTAX ERROR] complex '>F91 *write(F91/) *write(F90/)
    OQ91 @' not declared'>F91 *write_line(F91/) Or →6
§6
**
********************************************************************
~append_string_to_complex_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(30) @+F92(30)
    *get_child_node_index(L1,L2,n,1/c)
    *get_node_info(L1,L2,c/i,v)
    *get_token(F3,L4,v/F90)
    F90.0⇒t
    *s2ns(F90,1/d) t⊕76 ↪31
    0⇒t →32
§31
    1⇒t
§32
    *** t - type
    *** d - index

    *get_complex_id_by_name(L11,L16,s,t,d/j,r) r↪5

    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,28,a,b,c,d/F5) →6
§5
    @+F91(100)
    @'[SYNTAX ERROR] complex '>F91 *write(F91/) *write(F90/)
    OQ91 @' not declared'>F91 *write_line(F91/) Or →7
§6 *** handle string
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *get_token(F3,L4,v/F90)
    *get_or_add_string(L17,F18,F90/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_4(F5,a,b,c,d/F5)
§7
**
********************************************************************
~call_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(30) @+F91(100)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    *get_token(F3,L4,v/F90)

    *get_subprogram_index_by_name(L11,F12,F90/j,r) r↪1
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,29,a,b,c,d/F5)

    *** input args
    *get_child_node_index(L1,L2,n,1/c)
    *get_node_child_count(L1,L2,c/x)
    *get_input_args_length(L11,j/l)
    x⊕l↦3
    *append_byte_code_1(F5,x/F5)
    *get_child_node_index(L1,L2,n,1/f)
    Op
§11
    ↑(p=x)12
    *build_call_argument_node_visitor(L1,L2,F3,L4,F5,f,s,p/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    r↪2
    ∆p →11
§12

    *** output args
    *get_child_node_index(L1,L2,n,2/c)
    *get_node_child_count(L1,L2,c/x)
    *get_output_args_length(L11,j/l)
    x⊕l↦4
    *append_byte_code_1(F5,x/F5)
    *get_child_node_index(L1,L2,n,2/f)
    Op
§21
    ↑(p=x)22
    *build_call_argument_node_visitor(L1,L2,F3,L4,F5,f,s,p/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    r↪2
    ∆p →21
§22
    1⇒r →2
§1
    OQ91 @'[SYNTAX ERROR] subprogram "'>F91 *write(F91/)  *write(F90/)
    OQ91 @'" not defined'>F91 *write_line(F91/) Or →2
§3
    OQ91 @'[SYNTAX ERROR] Input arguments length mismatch. Required length: '>F91
    *write(F91/) *writev(l/)
    OQ91 @'. Passed arguments length: '>F91 *write(F91/) *writev_line(x/) Or →2
§4
    OQ91 @'[SYNTAX ERROR] Output arguments length mismatch. Required length: '>F91
    *write(F91/) *writev(l/)
    OQ91 @'. Passed arguments length: '>F91 *write(F91/) *writev_line(x/) Or →2
§2
**
********************************************************************
~build_call_argument_node_visitor(L1,L2,F3,L4,F5,n,s,q/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(100)
    *get_child_node_index(L1,L2,n,q/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪1 i⊕9↪2 i⊕39↪3 i⊕40↪4 i⊕41↪5 i⊕42↪6 i⊕43↪7 i⊕8↪8 i⊕7↪100 Or →10
§1
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§2
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§3
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦31
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪32
§31
    *split_variable(j/z,x,y,w)
    *append_byte_code_5(F5,2,z,x,y,w/F5)
    →9
§32
    Or *** error
    →10 *** length
§4
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦41
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪42
§41
    *split_variable(j/z,x,y,w)
    *append_byte_code_5(F5,3,z,x,y,w/F5)
    →9
§42
    Or *** error
    →10 *** capacity
§5
    *append_byte_code_1(F5,4/F5)
    →9 *** random
§6
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/x)
    ↑(x>32)61
    1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_5(F5,5,a,b,c,d/F5)
    *append_byte_code_4(F5,0,0,0,0/F5) →62
§61
    x-32⇒x 1<x⇒z *split_variable(z/a,b,c,d)
    *append_byte_code_5(F5,5,0,0,0,0/F5)
    *append_byte_code_4(F5,a,b,c,d/F5) →62
§62
    →9 *** singleconst
§7
    *append_byte_code_1(F5,6/F5)
    →9 *** time
§8
    *get_token(F3,L4,v/F90)
    *s2ns(F90,1/d)
    *get_complex_id_by_name(L11,L16,s,0,d/j,r) r↦81
    *get_complex_id_by_name(L11,L16,s,1,d/j,r) r↪82
§81
    *split_variable(j/z,x,y,w)
    *append_byte_code_5(F5,7,z,x,y,w/F5)
    *get_child_node_index(L1,L2,n,q/z)
    *get_child_node_index(L1,L2,z,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕6↪811 i⊕9↪812 →10
§811
    *get_token(F3,L4,v/F90)
    *get_or_add_variable(L11,F15,s,F90.0/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,0,a,b,c,d/F5)
    →9 *** id
§812
    *get_token(F3,L4,v/F90)
    *s2n(F90/x)
    *split_variable(x/a,b,c,d)
    *append_byte_code_5(F5,1,a,b,c,d/F5)
    →9 *** const
§82
    Or *** error
    →10 *** complex element
§100
    *get_token(F3,L4,v/F90)
    F90.0⇒t
    *s2ns(F90,1/d) t⊕76 ↪131
    0⇒t →132
§131
    1⇒t
§132
    *** t - type
    *** d - index

    *get_complex_id_by_name(L11,L16,s,t,d/j,r) r↪115

    *split_variable(j/a,b,c,d)
    *append_byte_code_5(F5,8,a,b,c,d/F5) →9
§115
    @+F91(100)
    @'[SYNTAX ERROR] complex '>F91 *write(F91/) *write(F90/)
    OQ91 @' not declared'>F91 *write_line(F91/) Or →10 *** complex
§9
    1⇒r
§10
**
********************************************************************
~console_node_visitor(L1,L2,F3,L4,F5,n,s/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    @+F90(30) @+F92(30)
    *get_child_node_index(L1,L2,n,0/c)
    *get_node_info(L1,L2,c/i,v)
    i⊕7↪1 i⊕38↪2 Or →6
§1 *** complex
    *get_token(F3,L4,v/F90)
    F90.0⇒t
    *s2ns(F90,1/d) t⊕76 ↪31
    0⇒t →32
§31
    1⇒t
§32
    *** t - type
    *** d - index

    *get_complex_id_by_name(L11,L16,s,t,d/j,r) r↪5

    *split_variable(j/a,b,c,d)
    *append_byte_code_6(F5,30,0,a,b,c,d/F5) →6
§2 *** string
    *get_token(F3,L4,v/F90)
    *get_or_add_string(L17,F18,F90/j)
    *split_variable(j/a,b,c,d)
    *append_byte_code_6(F5,30,1,a,b,c,d/F5)
    →6
§5
    @+F91(100)
    @'[SYNTAX ERROR] complex '>F91 *write(F91/) *write(F90/)
    OQ91 @' not declared'>F91 *write_line(F91/) Or →7
§6 *** console action
    *get_child_node_index(L1,L2,n,1/c)
    *get_node_info(L1,L2,c/i,v)
    i-52⇒i
    *writev_line(i/)
    *append_byte_code_1(F5,i/F5)
    1⇒r
§7
**
********************************************************************
~split_variable(x/a,b,c,d)
    x&ffh⇒a
    x>8&ffh⇒b
    x>16&ffh⇒c
    x>24&ffh⇒d
**
********************************************************************
*** write byte code
*** F1 - byte code
*** a-h - byte code for append
********************************************************************
~append_byte_code_1(F1,a/F1)
    a@>F1
**
~append_byte_code_2(F1,a,b/F1)
    a@>F1 b@>F1
**
~append_byte_code_3(F1,a,b,c/F1)
    a@>F1 b@>F1 c@>F1
**
~append_byte_code_4(F1,a,b,c,d/F1)
    a@>F1 b@>F1 c@>F1 d@>F1
**
~append_byte_code_5(F1,a,b,c,d,e/F1)
    a@>F1 b@>F1 c@>F1 d@>F1 e@>F1
**
~append_byte_code_6(F1,a,b,c,d,e,f/F1)
    a@>F1 b@>F1 c@>F1 d@>F1 e@>F1 f@>F1
**
~append_byte_code_7(F1,a,b,c,d,e,f,g/F1)
    a@>F1 b@>F1 c@>F1 d@>F1 e@>F1 f@>F1 g@>F1
**
~append_byte_code_8(F1,a,b,c,d,e,f,g,h/F1)
    a@>F1 b@>F1 c@>F1 d@>F1 e@>F1 f@>F1 g@>F1 h@>F1
**
********************************************************************
#get_node_info(L1,L2,n/i,v)
#get_node_child_count(L1,L2,n/c)
#get_child_node_index(L1,L2,p,j/i)

#s2n(F1/a)
#s2ns(F1,s/a)

#get_token(F1,L2,i/F3)

#write(F1/)
#write_line(F1/)
#writev(a/)
#writev_line(a/)

#get_token(F1,L2,i/F3)

#init_context(L1,F2,L3,L4,F5,L6,L7,F8/)
#add_subprogram(L1,F2,L3,L4,F5,L6,F7/i,r)
#get_subprogram_index_by_name(L1,F2,F3/i,r)
#get_input_args_start(L1,i/s)
#get_input_args_length(L1,i/l)
#add_input_arg(L1,L3,i,t,v/j,r)
#get_input_arg(L3,i/t,v)
#get_output_args_start(L1,i/s)
#get_output_args_length(L1,i/l)
#add_output_arg(L1,L4,i,t,v/j,r)
#get_output_arg(L4,i/t,v)
#get_variables_start(L1,i/s)
#get_variables_length(L1,i/l)
#get_or_add_variable(L1,F5,i,v/j)
#get_complexes_start(L1,i/s)
#get_complexes_length(L1,i/l)
#add_complex(L1,L6,i,t,d,c,a/j,r)
#get_complex(L6,i/t,d,c,a)
#get_complex_id_by_name(L1,L6,i,t,d/j,r)
#get_or_add_string(L7,F8,F10/j)
#get_string_by_id(L7,F8,i/F10)
