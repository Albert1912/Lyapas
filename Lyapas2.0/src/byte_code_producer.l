********************************************************************
*** produces byte code from syntax tree
*** L1, L2 - tree
*** F3, L4 - token array
*** F5 - byte code
*** r - result (0 - fail, >0 - ok)
********************************************************************
produce_byte_code(L1,L2,F3,L4/F5,r)
    *subprogram_node_visitor(L1,L2,F3,L4,0/F3,r)
**
********************************************************************
*** subprogram node visitor
*** L1, L2 - tree
*** F3, L4 - token array
*** F5 - byte code
*** n- node
*** r - result (0 - fail, >0 - ok)
********************************************************************
~subprogram_node_visitor(L1,L2,F3,L4,n/F5,r)
    *get_child_node_index(L1,L2,n,3/i)
    *body_node_visitor(L1,L2,F3,L4,i/F5,r) r↪1

    *get_node_child_count(L1,L2,n/c)
    ↑(c≠5)1

    *get_child_node_index(L1,L2,p,4/i)
    *subprogram_node_visitor(L1,L2,F3,L4,i/F5,r)
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
~body_node_visitor(L1,L2,F3,L4,n/F5,r)
    1⇒r
**
********************************************************************
#get_node_info(L1,L2,n/i,v)
#get_node_child_count(L1,L2,n/c)
#get_child_node_index(L1,L2,p,j/i)