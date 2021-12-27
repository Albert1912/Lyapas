********************************************************************
*** init syntax table
*** L1 - empty struct array
********************************************************************
init_syntax_table(/L1)
    *init_fixed_size(3/L1)
**
********************************************************************
*** add syntax table transition
*** L1 - syntax table
*** n - non terminal
*** t - terminal
*** i - rule id
*** r - result (1 - ok, 0 - failed)
********************************************************************
add_syntax_table_item(L1,n,t,i/r)
    @+L2(4)
    n⇒L2.0 t⇒L2.1 i⇒L2.2 3⇒Q2
    *add_fixed_size(L1,L2/r)
**
********************************************************************
*** try get transition
*** L1 - syntax table
*** n - non terminal
*** t - terminal
*** i - rule id
*** r - result (1 - has rule, 0 - error)
********************************************************************
try_get_syntax_table_transition(L1,n,t/i,r)
   *get_size_fixed_size(L1/s)
    Oj Or
§1
    *get_field_fixed_size(L1,j,0/x,z) z↪3 ↑(x≠n)2
    *get_field_fixed_size(L1,j,1/x,z) z↪3 ↑(x≠t)2
    *get_field_fixed_size(L1,j,2/i,z) ∆r →3
§2
    ∆j j⊕s ↦1
§3
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
