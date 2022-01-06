********************************************************************
*** fill test data
*** L1 - metadata
*** L2 - tree nodes
********************************************************************
fill_test_data(/L1,L2)
    *init_tree(L1,L2/L1,L2)
    *add_node(L1,L2,0,1,1/L1,L2,n) n⇒x⇒y
    *add_node(L1,L2,x,2,2/L1,L2,n) n⇒a
    *add_node(L1,L2,y,3,3/L1,L2,n) n⇒b
    *add_node(L1,L2,a,4,4/L1,L2,n)
    *add_node(L1,L2,b,5,5/L1,L2,n)
**
***⇒ ¬ % ∨ & ⊕ ∆ ∇ § → ↪ ↦ ↑ ≠ > < ≥ ≤ @ \
********************************************************************
*** left output
*** L1 - metadata
*** L2 - tree nodes
*** n - node
********************************************************************
left_output(L1,L2,n/)
    *get_node_child_count(L1,L2,n/c)
    Oj
§1
    ↑(j≥c)2
    *get_child_node_index(L1,L2,n,j/i)
    ***/'Current node: '>C *writev_line(n/)
    ***/'Child count: '>C *writev_line(c/)
    ***/'Child index: '>C *writev_line(i/)
    *left_output(L1,L2,i/)
    ∆j →1
§2
    *get_node_info(L1,L2,n/i,v)
    *writev_line(i/)
    *writev_line(v/)
**
***⇒ ¬ % ∨ & ⊕ ∆ ∇ § → ↪ ↦ ↑ ≠ > < ≥ ≤ @ \
********************************************************************
#get_node_info(L1,L2,n/i,v)
#get_node_child_count(L1,L2,n/c)
#get_child_node_index(L1,L2,p,j/i)

#init_tree(L1,L2/L1,L2)
#add_node(L1,L2,p,i,v/L1,L2,n)
#writev_line(a/)
#writev(a/)