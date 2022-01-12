********************************************************************
*** init context
********************************************************************
init_context(L1,F2,L3,L4,F5,L6,L7,F8/)
    *init_fixed_size(10/L1)
    *init_fixed_size(2/L3)
    *init_fixed_size(2/L4)
    *init_fixed_size(3/L6)
    *init_fixed_size(2/L7)
**
********************************************************************
*** add subprogram
*** L1,F2,L3,L4,F5,L6 - context
*** F7 - subprogram name
*** i - index added subprogram
*** r - result (1 - added, 0 - subprogram already exists)
********************************************************************
add_subprogram(L1,F2,L3,L4,F5,L6,F7/i,r)
    Oj
    *get_size_fixed_size(L1/x) x↦1
    *add_first_subprogram(L1,F2,L3,L4,F5,L6,F7/i,r) →4

§1 *** check if subprogram already declared
    *get_subprogram_start_end(L1,j/s,e)
    e-s+1⇒l *compare_strings(F2,F7,s,l/t)
    t↦3 ∆j j⊕x ↦1
§2
    @+L20(10) 10⇒Q20 ∇x
    *get_field_fixed_size(L1,x,1/e,t) ∆e
    *append_string(F2,F7,e/)
    e⇒L20.0 e+Q7-1⇒L20.1 *** subprogram name
    *get_size_fixed_size(L3/e)
    e⇒L20.2 0⇒L20.3 *** input args
    *get_size_fixed_size(L4/e)
    e⇒L20.4 0⇒L20.5 *** output args
    *get_field_fixed_size(L1,x,7/e,t)
    e⇒L20.6 0⇒L20.7 *** variables
    *get_size_fixed_size(L6/e)
    e⇒L20.8 0⇒L20.9 *** complexes

    *add_fixed_size(L1,L20/t)
    ∆x⇒i ∆r →4
§3
    Or
§4
**
********************************************************************
~add_first_subprogram(L1,F2,L3,L4,F5,L6,F7/i,r)
    @+L20(10) 10⇒Q20
    0⇒L20.0 Q7-1⇒L20.1 *** subprogram name
    0⇒L20.2 0⇒L20.3 *** input args
    0⇒L20.4 0⇒L20.5 *** output args
    0⇒L20.6 0⇒L20.7 *** variables
    0⇒L20.8 0⇒L20.9 *** complexes

    *add_fixed_size(L1,L20/x)
    *append_string(F2,F7,0/)
    Oi 1⇒r
**
********************************************************************
~append_string(F1,F2,s/)
    Oi s⇒x
§1
    F2i⇒F1x ∆i ∆x i⊕Q2↦1
**
********************************************************************
*** returns subprogram start and end name pointers
*** L1 - context(metadata)
*** i - subprogram index
*** s - start pointer
*** e - end pointer
********************************************************************
~get_subprogram_start_end(L1,i/s,e)
    *get_field_fixed_size(L1,i,0/s,r)
    *get_field_fixed_size(L1,i,1/e,r)
**
********************************************************************
*** get subprogram index by name
*** L1,F2 - context
*** F3 - name
*** i - index
*** r - result
********************************************************************
get_subprogram_index_by_name(L1,F2,F3/i,r)
    Or *get_size_fixed_size(L1/x) x↪3 Oi
§1
    *get_subprogram_start_end(L1,i/s,e)
    e-s+1⇒l *compare_strings(F2,F3,s,l/t)
    t↦2 ∆i i⊕x ↦1 ↪3
§2
    ∆r
§3
**
********************************************************************
*** get input args start
*** L1 - context
*** i - subprogram index
*** x - input args start
********************************************************************
get_input_args_start(L1,i/s)
    *get_field_fixed_size(L1,i,2/s,r)
**
********************************************************************
*** get input args length
*** L1 - context
*** i - subprogram index
*** l - input args length
********************************************************************
get_input_args_length(L1,i/l)
    *get_field_fixed_size(L1,i,3/l,r)
**
********************************************************************
*** add input arg
*** L1,L3 - context (input args)
*** i - subprogram index
*** t - arg type
*** v - value
*** j - added input arg index
*** r - result
********************************************************************
add_input_arg(L1,L3,i,t,v/j,r)
    *get_field_fixed_size(L1,i,2/s,r)
    *get_field_fixed_size(L1,i,3/l,r) l↪11 *** input args empty
    s+l-1⇒e
    *contains(L3,s,e,t,v/r) r↦1
§11
    @+L10(2) 2⇒Q10
    t⇒L10.0 v⇒L10.1
    *add_fixed_size(L3,L10/r)
    *get_field_fixed_size(L1,i,3/l,r) ∆l
    *update_field_fixed_size(L1,i,3,l/r)
    *get_size_fixed_size(L3/j) ∇j
    1⇒r →2
§1
    Or
§2
**
********************************************************************
*** get input arg
*** L3 - context (input args)
*** i - arg index
*** t - type
*** v - value
********************************************************************
get_input_arg(L3,i/t,v)
    *get_field_fixed_size(L3,i,0/t,r)
    *get_field_fixed_size(L3,i,1/v,r)
**
********************************************************************
*** get output args start
*** L1 - context
*** i - subprogram index
*** x - output args start
********************************************************************
get_output_args_start(L1,i/s)
    *get_field_fixed_size(L1,i,4/s,r)
**
********************************************************************
*** get output args length
*** L1 - context
*** i - subprogram index
*** l - output args length
********************************************************************
get_output_args_length(L1,i/l)
    *get_field_fixed_size(L1,i,5/l,r)
**
********************************************************************
*** add output arg
*** L1,L3 - context (output args)
*** i - subprogram index
*** t - arg type
*** v - value
*** j - added output arg index
*** r - result
********************************************************************
add_output_arg(L1,L4,i,t,v/j,r)
    *get_field_fixed_size(L1,i,4/s,r)
    *get_field_fixed_size(L1,i,5/l,r) l↪11 *** output args empty
    s+l-1⇒e
    *contains(L4,s,e,t,v/r) r↦1
§11
    @+L10(2) 2⇒Q10
    t⇒L10.0 v⇒L10.1
    *add_fixed_size(L4,L10/r)
    *get_field_fixed_size(L1,i,5/l,r) ∆l
    *update_field_fixed_size(L1,i,5,l/r)
    *get_size_fixed_size(L4/j) ∇j
    1⇒r →2
§1
    Or
§2
**
********************************************************************
*** get output arg
*** L4 - context (output args)
*** i - arg index
*** t - type
*** v - value
********************************************************************
get_output_arg(L4,i/t,v)
    *get_field_fixed_size(L4,i,0/t,r)
    *get_field_fixed_size(L4,i,1/v,r)
**
********************************************************************
*** get variables start
*** L1 - context
*** i - subprogram index
*** s - start
********************************************************************
get_variables_start(L1,i/s)
    *get_field_fixed_size(L1,i,6/s,r)
**
********************************************************************
*** get variables length
*** L1 - context
*** i - subprogram index
*** l - length
********************************************************************
get_variables_length(L1,i/l)
    *get_field_fixed_size(L1,i,7/l,r)
**
********************************************************************
*** get or add variable
*** L1,F5 - context (variables)
*** i - subprogram index
*** v - variable
*** j - variable index
********************************************************************
get_or_add_variable(L1,F5,i,v/j)
    *get_field_fixed_size(L1,i,6/s,r)
    *get_field_fixed_size(L1,i,7/l,r) l↪12
    s+l-1⇒e
    *contains_single(F5,s,e,v/r,j) r↦1
§11
    ∆e
§12
    v⇒F5e ∆l
    *update_field_fixed_size(L1,i,7,l/r)
    e⇒j
§1
**
********************************************************************
*** get complexes start
*** L1 - context
*** i - subprogram index
*** s - start
********************************************************************
get_complexes_start(L1,i/s)
    *get_field_fixed_size(L1,i,8/s,r)
**
********************************************************************
*** get complexes length
*** L1 - context
*** i - subprogram index
*** l - length
********************************************************************
get_complexes_length(L1,i/l)
    *get_field_fixed_size(L1,i,9/l,r)
**
********************************************************************
*** add complex
*** L1,L6 - context (complexes)
*** i - subprogram index
*** t - type
*** d - index
*** c - capacity
*** j - added complex index
*** r - result
********************************************************************
add_complex(L1,L6,i,t,d,c/j,r)
    *get_field_fixed_size(L1,i,8/s,r)
    *get_field_fixed_size(L1,i,9/l,r) l↪11 *** complexes empty
    s+l-1⇒e
    *contains(L6,s,e,t,d/r) r↦1
§11
    @+L10(3) 3⇒Q10
    t⇒L10.0 d⇒L10.1 c⇒L10.2
    *add_fixed_size(L6,L10/r)
    *get_field_fixed_size(L1,i,9/l,r) ∆l
    *update_field_fixed_size(L1,i,9,l/r)
    *get_size_fixed_size(L6/j) ∇j
    1⇒r →2
§1
    Or
§2
**
********************************************************************
*** get output arg
*** L6 - context (complexes)
*** i - complex index
*** t - type
*** d - index
*** c - capacity
********************************************************************
get_complex(L6,i/t,d,c)
    *get_field_fixed_size(L6,i,0/t,r)
    *get_field_fixed_size(L6,i,1/d,r)
    *get_field_fixed_size(L6,i,2/c,r)
**
********************************************************************
*** get complex id by name
*** L1, L6 - context (complexes)
*** i - subprogram index
*** t - type
*** d - index
*** j - complex index
*** r - result
********************************************************************
get_complex_id_by_name(L1,L6,i,t,d/j,r)
    @+L10(3) Or
    *get_field_fixed_size(L1,i,8/s,z)
    *get_field_fixed_size(L1,i,9/l,z) l↪4
    s+l-1⇒e
§1
    ↑(s>e)4
    *get_fixed_size(L6,s/L10,z)
    L10.0⊕t ↦2 L10.1⊕d ↦2 ↪3
§2
    ∆s →1
§3
    ∆r s⇒j
§4
**
********************************************************************
~contains(L1,s,e,t,v/r)
    @+L10(3) Or
§1
    ↑(s>e)4
    *get_fixed_size(L1,s/L10,z)
    L10.0⊕t ↦2 L10.1⊕v ↦2 ↪3
§2
    ∆s →1
§3
    ∆r
§4
**
********************************************************************
~contains_single(F1,s,e,v/r,i)
    Or
§1
    ↑(s>e)4
    F1s⊕v ↦2 ↪3
§2
    ∆s →1
§3
    ∆r s⇒i
§4
**
********************************************************************
*** compare strings
*** F1 - first string
*** F2 - second string
*** s - start first string
*** l - length
*** r - result (0 - not equals, 1 - equals)
********************************************************************
~compare_strings(F1,F2,s,l/r)
    Or l⊕Q2↦3 Oj s⇒x
§1
    ↑(j=l)2
    F1x⊕F2j↦3 ∆x ∆j →1
§2
   ∆r
§3
**
********************************************************************
*** trim
********************************************************************
~trim(a/b)
    a⇒b
    ↑(b=0)2
§1
    ∇b
§2
**
********************************************************************
#init_fixed_size(n/L1)
#add_fixed_size(L1,L2/r)
#remove_fixed_size(L1,i/r)
#get_fixed_size(L1,i/L2,r)
#get_field_fixed_size(L1,i,j/f,r)
#update_fixed_size(L1,i,L2/r)
#update_field_fixed_size(L1,i,j,f/r)
#clear_fixed_size(L1/)
#get_size_fixed_size(L1/n)

#writev_line(a/)