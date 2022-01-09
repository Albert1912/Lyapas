********************************************************************
*** init tree
*** L1 - metadata
*** L2 - tree nodes
********************************************************************
init_tree(L1,L2/L1,L2)
    *init_fixed_size(3/L1) OQ2
**
********************************************************************
*** add node
*** L1 - metadata
*** L2 - tree nodes
*** p - parent
*** i - node id
*** v - value
*** n - node index
********************************************************************
add_node(L1,L2,p,i,v/L1,L2,n)
    Q2⇒m⇒k+2⇒Q2 i⇒L2k ∆k v⇒L2k *** add node
    @+L3(3) 3⇒Q3 m⇒L3.0 0⇒L3.1 p⇒L3.2
    *add_fixed_size(L1,L3/r)  *** add node metadata
    ↑(m=0)1

    *** fix metadata
    *get_field_fixed_size(L1,p,0/s,r) *** s - start
    *get_field_fixed_size(L1,p,1/c,r) c+1⇒f *** c - child nodes count
    *update_field_fixed_size(L1,p,1,f/r)
    *get_size_fixed_size(L1/n) ∇n
    s+c+2⇒j n@>L2j ∆p
    *fix_starts(L1,L2,p/L1,L2)
§1
    *** return node index
    *get_size_fixed_size(L1/n) ∇n
**
********************************************************************
*** get node info
*** L1 - metadata
*** L2 - tree nodes
*** n - node index
*** i - id
*** v - value
********************************************************************
get_node_info(L1,L2,n/i,v)
    *get_field_fixed_size(L1,n,0/s,r)
    L2s⇒i ∆s L2s⇒v
**
********************************************************************
*** update node info
*** L1 - metadata
*** L2 - tree nodes
*** n - node index
*** i - id
*** v - value
********************************************************************
update_node_info(L1,L2,n,i,v/)
    *get_field_fixed_size(L1,n,0/s,r)
    i⇒L2s ∆s v⇒L2s
**
********************************************************************
*** get node child count
*** L1 - metadata
*** L2 - tree nodes
*** n - node index
*** c - child count
********************************************************************
get_node_child_count(L1,L2,n/c)
    *get_field_fixed_size(L1,n,1/c,r)
**
********************************************************************
*** get child node index
*** L1 - metadata
*** L2 - tree nodes
*** p - parent
*** j - child index in list
*** i - child node index
********************************************************************
get_child_node_index(L1,L2,p,j/i)
    *get_field_fixed_size(L1,p,1/c,r)
    ↑(j>c)1
    *get_field_fixed_size(L1,p,0/s,r)
    s+2+j⇒s L2s⇒i
§1
**
********************************************************************
*** get parent node index
*** L1 - metadata
*** L2 - tree nodes
*** n - node
*** p - parent index
********************************************************************
get_parent_node_index(L1,L2,n/p)
    *get_field_fixed_size(L1,n,2/p,r)
**
********************************************************************
*** fix starts after append node
*** L1 - metadata
*** L2 - tree nodes
*** i - start
********************************************************************
~fix_starts(L1,L2,i/L1,L2)
    *get_size_fixed_size(L1/n)
    ↑(i≥n)2 i⇒j
§1
    *get_field_fixed_size(L1,j,0/f,r) ∆f
    *update_field_fixed_size(L1,j,0,f/r)
    ∆j⊕n↦1
§2
**
********************************************************************
#init_fixed_size(n/L1)
#get_field_fixed_size(L1,i,j/f,r)
#update_field_fixed_size(L1,i,j,f/r)
#get_size_fixed_size(L1/n)
#add_fixed_size(L1,L2/r)