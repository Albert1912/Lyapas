********************************************************************
*** init context
********************************************************************
init_context(L1,F2,L3,L4,F5,L6/)
    *init_fixed_size(10/L1)
    *init_fixed_size(2/L3)
    *init_fixed_size(2/L4)
    *init_fixed_size(3/L6)
**
********************************************************************
*** add function
*** L1,F2,L3,L4,F5,L6 - context
*** F7 - function name
********************************************************************
add_function(L1,F2,L3,L4,F5,L6,F7/)
    *get_size_fixed_size(L1/z) *trim(z/n)
    *get_field_fixed_size(L1,n,0/s,r) *** s - start
    *get_field_fixed_size(L1,n,1/l,r) *** l - length
    s+l⇒x Oi
§3 F7i⇒F2x ∆x ∆i ↑(i<Q7)3 Q2+Q7⇒Q2
    @+L10(10) 10⇒Q10
    s+l⇒L10.0 Q7⇒L10.1 *** functions
    *get_size_fixed_size(L3/L10.2) 0⇒L10.3 *** input args
    *get_size_fixed_size(L4/L10.4) 0⇒L10.5 *** output args
    Q5⇒L10.6 0⇒L10.7 *** variables
    *get_size_fixed_size(L6/L10.8) 0⇒L10.9 *** complexes
    *add_fixed_size(L1,L10/r)
**
********************************************************************
*** get function index by name
*** L1,F2,L3,L4,F5,L6 - context
*** F7 - function name
*** i - index
*** r - result (r=0 - not found)
********************************************************************
get_function_index(L1,F2,L3,L4,F5,L6,F7/i,r)
    *get_size_fixed_size(L1/n) Oi Or
§1
    *get_field_fixed_size(L1,i,0/s,r) *** s - start
    *get_field_fixed_size(L1,i,1/l,r) *** l - length
    l⊕Q7↦2 Oj
§11
    ↑(F2s≠F7j)2 ∆j ∆s s⊕l↦11 ∆r →3
§2
    ∆i i⊕n ↦1
§3
**
********************************************************************
*** get input args count
*** i - function index
*** c - count
********************************************************************
get_input_args_count(L1,F2,L3,L4,F5,L6,i/c)
    *get_field_fixed_size(L1,i,3/c,r)
**
********************************************************************
*** get output args count
*** i - function index
*** c - count
********************************************************************
get_output_args_count(L1,F2,L3,L4,F5,L6,i/c)
    *get_field_fixed_size(L1,i,5/c,r)
**
********************************************************************
*** get input args start index
*** i - function index
*** s - start
********************************************************************
get_input_args_start(L1,F2,L3,L4,F5,L6,i/s)
    *get_field_fixed_size(L1,i,2/s,r)
**
********************************************************************
*** get output args start index
*** i - function index
*** s - start
********************************************************************
get_output_args_start(L1,F2,L3,L4,F5,L6,i/s)
    *get_field_fixed_size(L1,i,4/s,r)
**
********************************************************************
*** get input arg
*** j - arg index
*** t - type
*** v - value
********************************************************************
get_input_arg(L1,F2,L3,L4,F5,L6,j/t,v)
    *get_field_fixed_size(L3,j,0/t,r)
    *get_field_fixed_size(L3,j,1/v,r)
**
********************************************************************
*** get output arg
*** j - arg index
*** t - type
*** v - value
********************************************************************
get_output_arg(L1,F2,L3,L4,F5,L6,i,j/t,v)
    *get_field_fixed_size(L4,j,0/t,r)
    *get_field_fixed_size(L4,j,1/v,r)
**
********************************************************************
*** add input arg
*** i - function index
*** t - type
*** v - value
********************************************************************
add_input_arg(L1,F2,L3,L4,F5,L6,i,t,v/)
    *get_field_fixed_size(L1,i,3/l,r)
    @+L10(2) 2⇒Q10 t⇒L10.0 v⇒L10.1
    *add_fixed_size(L3,L10/r)
    ∆l *update_field_fixed_size(L1,i,3,l/r)
**
********************************************************************
*** add output arg
*** i - function index
*** t - type
*** v - value
********************************************************************
add_output_arg(L1,F2,L3,L4,F5,L6,i,t,v/)
    *get_field_fixed_size(L1,i,5/l,r)
    @+L10(2) 2⇒Q10 t⇒L10.0 v⇒L10.1
    *add_fixed_size(L4,L10/r)
    ∆l *update_field_fixed_size(L1,i,5,l/r)
**
********************************************************************
*** add variable
*** i - function index
*** v - value
********************************************************************
add_variable(L1,F2,L3,L4,F5,L6,i,v/)
    *get_field_fixed_size(L1,i,7/l,r)
    Q5⇒n v⇒F5n ∆Q5
    ∆l *update_field_fixed_size(L1,i,7,l/r)
**
********************************************************************
*** add complex
*** i - function index
*** t - type
*** c - complex index
*** s - capacity
********************************************************************
add_complex(L1,F2,L3,L4,F5,L6,i,t,c,s/)
    *get_field_fixed_size(L1,i,9/l,r)
    @+L10(3) 3⇒Q10 t⇒L10.0 c⇒L10.1 s⇒L10.1
    *add_fixed_size(L6,L10/r)
    ∆l *update_field_fixed_size(L1,i,9,l/r)
**
********************************************************************
*** get variables start index
*** i - function index
*** s - start
********************************************************************
get_variables_start(L1,F2,L3,L4,F5,L6,i/s)
    *get_field_fixed_size(L1,i,6/s,r)
**
********************************************************************
*** get variables count
*** i - function index
*** c - count
********************************************************************
get_variables_count(L1,F2,L3,L4,F5,L6,i/c)
    *get_field_fixed_size(L1,i,7/c,r)
**
********************************************************************
*** check has variable
*** i - function index
*** v - variable
*** r - result
********************************************************************
has_variable(L1,F2,L3,L4,F5,L6,i,v/r)
    *get_variables_start(L1,F2,L3,L4,F5,L6,i/s)
    *get_variables_count(L1,F2,L3,L4,F5,L6,i/c)
    s+c⇒b
§1 ↑(s=b)3
    *get_variable_ctx(L1,F2,L3,L4,F5,L6,s/x)
    ∆s v⊕x↦1
§2 1⇒r
§3
**
********************************************************************
*** get complexes start index
*** i - function index
*** s - start
********************************************************************
get_complexes_start(L1,F2,L3,L4,F5,L6,i/s)
    *get_field_fixed_size(L1,i,8/s,r)
**
********************************************************************
*** get variable
*** j - var index
*** v - value
********************************************************************
get_variable_ctx(L1,F2,L3,L4,F5,L6,j/v)
    F5j⇒v
**
********************************************************************
*** get complex
*** j - complex index
*** t - type
*** i - index
*** s - capacity
********************************************************************
get_complex_ctx(L1,F2,L3,L4,F5,L6,j/t,i,s)
    *get_field_fixed_size(L6,j,0/t,r)
    *get_field_fixed_size(L6,j,1/i,r)
    *get_field_fixed_size(L6,j,2/s,r)
**
***  ⇒ ¬ % ∨ & ⊕ ∆ ∇ § → ↪ ↦ ↑ ≠ > < ≥ ≤ @ \
********************************************************************
*** trim
********************************************************************
trim(a/b)
a⇒b ↑(b=0)2 §1 ∇b §2
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