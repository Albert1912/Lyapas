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
    *get_size_fixed_size(L3/e) ∆e
    e⇒L20.2 e⇒L20.3 *** input args
    *get_size_fixed_size(L4/e) ∆e
    e⇒L20.4 e⇒L20.5 *** output args
    x-1⇒v *get_field_fixed_size(L1,v,7/e,t)
    e⇒L20.6 e⇒L20.7 *** variables
    *get_size_fixed_size(L6/e) ∆e
    0⇒L20.8 0⇒L20.9 *** complexes

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
*** get input args end
*** L1 - context
*** i - subprogram index
*** e - input args end
********************************************************************
get_input_args_end(L1,i/e)
    *get_field_fixed_size(L1,i,3/e,r)
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
    *get_field_fixed_size(L1,i,3/e,r)
    *contains(L3,s,e,t,v/r) r↦1

    @+L10(2) 2⇒Q10
    t⇒L10.0 v⇒L10.1
    *add_fixed_size(L3,L10/r)
    ∆e *update_field_fixed_size(L1,i,3,e/r) e⇒j 1⇒r →2
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
~contains(L1,s,e,t,v/r)
    @+L10(2) Or
§1
    ↑(s>e)4
    *get_fixed_size(L1,s/L10,r)
    L10.0⊕t ↦2 L10.1⊕v ↦2 ↪3
§2
    ∆s →1
§3
    ∆r
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