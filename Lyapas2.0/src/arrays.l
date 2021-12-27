********************************************************************
init_token_array(/F1,L2)
    OQ1 1⇒Q2 0⇒i⇒L2i
    **
********************************************************************
*** get token id from token array
*** L2 - token array metadata
*** i - iterator, index of required token
*** d - token id
********************************************************************
get_token_id(L1,i/d)
    4*i+3⇒j L1j⇒d
    **
********************************************************************
*** get token position from token array
*** L1 - token array metadata
*** i - iterator, index of required token
*** p - token position in text
********************************************************************
get_token_position(L1,i/p)
    4*i+4⇒j L1j⇒p
    **
********************************************************************
*** get token from token array
*** F1 - token array
*** L2 - token array metadata
*** i - iterator, index of required token
*** F3 - token
********************************************************************
get_token(F1,L2,i/F3)
    OQ3
    4*i+1⇒j
    L2j⇒j *** j - offset
    i*4+2⇒l
    L2l⇒l *** l - length
    Om *** m - pointer in F3)
§1
    F1j@>F3m
    ∆j∆m
    ↑(m<l)1
    **
********************************************************************
*** add token to token array
*** F1 - token array
*** L2 - token array metadata
*** F3 - token
*** i - token id
*** p - position in text
********************************************************************
add_token(F1,L2,F3,i,p/F1,L2)
    L2.0⇒n *** n - count
    ↑(n=0)3
    ∇n
§3
    n*4+1⇒k L2k⇒k *** k - offset
    n*4+2⇒l L2l⇒l *** l - length
    k+l⇒k *** k - start
    L2.0⇒n 0⇒a ∆n⇒L2a
    ∇n*4+1⇒a k⇒L2a ∆a Q3⇒L2a ∆a i⇒L2a ∆a p⇒L2a
    4+Q2⇒Q2
    Om *** m - pointer in F3
§1
    F3m@>F1k
    ∆k∆m
    ↑(m<Q3)1
    **
********************************************************************
init_rules_array(/L1,L2)
    OQ1 1⇒Q2 0⇒L2.0
    **
********************************************************************
*** get rule from array
*** L1 - rules array
*** L2 - rules array metadata
*** l - rule left part
*** i - alternative index
*** L3 - rule right part
*** r - result (>1 - ok, 0 - failed)
********************************************************************
get_rule(L1,L2,l,i/L3,r)
    OQ3
    L2.0⇒n 0⇒j
§1
    ↑(j=n)5
    3*j+1⇒k L2k⇒k *** k - offset
    3*j+3⇒a L2a⇒a *** a - alternative index  
    ↑(L1k≠l)2
    ↑(a≠i)2
    →3
§2
    ∆j →1
§3
    3*j+2⇒l L2l⇒l
    Om
§4
    L1k@>L3
    ∆k∆m
    ↑(m<l)4
§5
    Q3⇒r
    **
********************************************************************
*** get rule from array by id
*** L1 - rules array
*** L2 - rules array metadata
*** i - index
*** L3 - rule right part
*** r - result (>0 - ok, 0 - failed)
********************************************************************
get_rule_by_id(L1,L2,i/L3,r)
    OQ3 Or ↑(i≥L2.0)6
    3*i+1⇒k L2k⇒k *** k - offset
    3*i+2⇒l L2l⇒l *** l - length
    1⇒m+k⇒k
§4
    ↑(m=l)5
    L1k@>L3
    ∆k∆m →4
§5
    1⇒r
§6
    **
********************************************************************
*** add rule to array
*** L1 - rules array
*** L2 - rules array metadata
*** L3 - rule
*** i - index of alternative
********************************************************************
add_rule(L1,L2,L3,i/L1,L2)
    L2.0⇒n *** n - count
    ↑(n=0)3
    ∇n
§3
    n*3+1⇒k L2k⇒k *** k - offset
    n*3+2⇒l L2l⇒l *** l - length
    k+l⇒k *** k - start
    L2.0⇒n ∆n⇒L2.0
    ∇n*3+1⇒a k⇒L2a ∆a Q3⇒L2a ∆a i⇒L2a 3+Q2⇒Q2
    Om *** m - pointer in L3
§1
    L3m@>L1
    ∆m
    ↑(m<Q3)1
    **
********************************************************************

