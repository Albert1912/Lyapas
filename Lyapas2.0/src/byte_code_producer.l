********************************************************************
*** produces byte code from syntax tree
*** L1, L2 - tree
*** F3, L4 - token array
*** F5 - byte code
*** r - result (0 - fail, >0 - ok)
*** L11,F12,L13,L14,F15,L16,L17,F18 - context
********************************************************************
produce_byte_code(L1,L2,F3,L4,F5/F5,r,L11,F12,L13,L14,F15,L16,L17,F18)
    *subprogram_node_visitor(L1,L2,F3,L4,F5,0/F5,r)
**
********************************************************************
*** subprogram node visitor
*** L1, L2 - tree
*** F3, L4 - token array
*** F5 - byte code
*** n- node
*** r - result (0 - fail, >0 - ok)
********************************************************************
~subprogram_node_visitor(L1,L2,F3,L4,F5,n/F5,r)
    *append_byte_code_2(F5,17,n/F5)
    *get_child_node_index(L1,L2,n,3/i)
    *body_node_visitor(L1,L2,F3,L4,F5,i/F5,r) r↪1

    *append_byte_code_1(F5,18/F5)
    *get_node_child_count(L1,L2,n/c)
    ↑(c≠6)1

    *get_child_node_index(L1,L2,n,5/i)
    *subprogram_node_visitor(L1,L2,F3,L4,F5,i/F5,r)
§1
**
********************************************************************
*** body node visitor
*** L1, L2 - tree
*** F3, L4 - token array
*** F5 - byte code
*** n - body node
*** r - result (0 - fail, >0 - ok)
********************************************************************
~body_node_visitor(L1,L2,F3,L4,F5,n/F5,r)
    *get_node_child_count(L1,L2,n/c)
    Ok Or
§1 ↑(k=c)2
    *get_child_node_index(L1,L2,n,k/j)
    *get_node_info(L1,L2,j/i,v)

    i⊕10 ↦11 *add_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§11 i⊕11 ↦12 *sub_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§12 i⊕12 ↦13 *mul_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§13 i⊕13 ↦14 *div_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§14 i⊕14 ↦15 *mod_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§15 i⊕15 ↦16 *or_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§16 i⊕16 ↦17 *and_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§17 i⊕17 ↦18 *xor_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§18 i⊕18 ↦19 *assign_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§19 i⊕19 ↦20 *swap_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§20 i⊕20 ↦21 *zeroing_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§21 i⊕21 ↦22 *maximize_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§22 i⊕22 ↦23 *lowerone_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§23 i⊕23 ↦24 *inversion_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§24 i⊕24 ↦25 *weighing_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§25 i⊕25 ↦26 *operand_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§26 i⊕26 ↦27 *left_shift_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§27 i⊕27 ↦28 *right_shift_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§28 i⊕28 ↦29 *inc_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§29 i⊕29 ↦30 *dec_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§30 i⊕30 ↦31 *jz_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§31 i⊕31 ↦32 *jnz_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§32 i⊕32 ↦33 *jump_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§33 i⊕33 ↦34 *cmp_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§34 i⊕34 ↦35 *label_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§35 i⊕35 ↦36 *create_complex_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§36 i⊕36 ↦37 *zeroing_complex_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§37 i⊕37 ↦50 *append_string_to_complex_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§50 i⊕50 ↦51 *call_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§51 i⊕51 ↦52 *console_node_visitor(L1,L2,F3,L4,F5,j/F5,r) r↪3
§52
    ∆k →1
§2
    1⇒r
§3
**
********************************************************************
~add_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~sub_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~mul_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~div_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~mod_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~or_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~and_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~xor_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~assign_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~swap_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~zeroing_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~maximize_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~lowerone_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~inversion_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~weighing_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~operand_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~left_shift_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~right_shift_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~inc_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~dec_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~jz_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~jnz_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~jump_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~cmp_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~label_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~create_complex_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~zeroing_complex_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~append_string_to_complex_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~call_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
**
********************************************************************
~console_node_visitor(L1,L2,F3,L4,F5,n/F5,r) 1⇒r
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

#get_token(F1,L2,i/F3)

#write(F1/)
#write_line(F1/)
#writev(a/)
#writev_line(a/)