********************************************************************
*** init fixed size array
*** n - struct size (dword)
*** L1 - empty struct array
********************************************************************
init_fixed_size(n/L1)
    OQ1 0⇒L1.0 n⇒L1.1
**
********************************************************************
*** add struct
*** L1 - struct array
*** L2 - struct representaion
*** r - result (1 - ok, 0 - failed)
********************************************************************
add_fixed_size(L1,L2/r)
    0⇒r L1.0⇒n L1.1⇒s
    Q2⇒l
    s-l↦3 Oi
§2
    s*n+2+i⇒j L2i⇒L1j
    ∆i i⊕l ↦2
    n+1⇒L1.0 1⇒r
§3
**
********************************************************************
*** remove element
*** L1 - struct array
*** i - index
*** r - result (1 - ok, 0 - failed)
********************************************************************
remove_fixed_size(L1,i/r)
    0⇒r L1.0⇒n L1.1⇒s
    ↑(i≥n)4 n-1⊕i↪3
    i*s+2⇒x i+1*s+2⇒y n*s+2⇒u
§2
    L1y⇒L1x
    ∆x∆y
    ↑(y<u)2
§3
    1⇒r Q1-s⇒Q1 n-1⇒L1.0
§4
**
********************************************************************
*** get element
*** L1 - struct array
*** i - index
*** L2 - struct representaion
*** r - result (1 - ok, 0 - failed)
********************************************************************
get_fixed_size(L1,i/L2,r)
    0⇒r L1.0⇒n L1.1⇒s
    ↑(i≥n)2 i*s+2⇒x Oi s⇒Q2
§1
    L1x⇒L2i
    ∆x ∆i i⊕s ↦1
    1⇒r
§2
**
********************************************************************
*** get field of element
*** L1 - struct array
*** i - element index
*** j - field index
*** f - field
*** r - result (1 - ok, 0 - failed)
********************************************************************
get_field_fixed_size(L1,i,j/f,r)
    0⇒r L1.0⇒n L1.1⇒s
    ↑(i≥n)1 ↑(j≥s)1
    i*s+2+j⇒x L1x⇒f 1⇒r
§1
**
********************************************************************
*** update element
*** L1 - struct array
*** i - index
*** L2 - struct representaion
*** r - result (1 - ok, 0 - failed)
********************************************************************
update_fixed_size(L1,i,L2/r)
    0⇒r L1.0⇒n L1.1⇒s
    ↑(i≥n)2 ↑(Q2≠s)2 i*s+2⇒x Oi
§1
    L2i⇒L1x
    ∆x ∆i i⊕s ↦1
    1⇒r
§2
**
********************************************************************
*** update field of element
*** L1 - struct array
*** i - element index
*** j - field index
*** f - field
*** r - result (1 - ok, 0 - failed)
********************************************************************
update_field_fixed_size(L1,i,j,f/r)
    0⇒r L1.0⇒n L1.1⇒s
    ↑(i≥n)1 ↑(j≥s)1
    i*s+2+j⇒x f⇒L1x 1⇒r
§1
**
********************************************************************
*** clear array
*** L1 - struct array
********************************************************************
clear_fixed_size(L1/)
    2⇒Q1 0⇒L1.0 0⇒L1.1
**
********************************************************************
*** get array size
*** L1 - struct array
********************************************************************
get_size_fixed_size(L1/n)
    L1.0⇒n
**
