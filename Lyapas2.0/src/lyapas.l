head(/)
*** F1 - file name
*** F2 - lyapas program text
*** F3 - array of tokens
    @+F1(100) @+F2(10000)

*** get filename from argv
    {mov esi, [esp + 1436]}
    {xor eax, eax}
§1
    {mov al, byte [esi]}
    {push esi}
    @>F1
    {pop esi}
    {inc esi}
    ↦1

    @+F5(100)
    @'File name is: '>F5 *write(F5/) OQ5
    ∇Q1 *write_line(F1/) 0@>F1

*** open file and read text to F2
    *read_all_text(F1/F2)
    *write_line(F2/)

    @+F3(10000) @+L4(10000)
    *lex(F2/F3,L4)

*** show all tokens
    OQ5 @'Total lexemes: '>F5 *write(F5/)
    *writev_line(L4.0/)
    L4.0⇒n Oj
§2
    ↑(j=n)3
    *get_token_id(L4,j/d) OQ5 @'id: '>F5 *write(F5/) *writev(d/) OQ5 @'; value: '>F5 *write(F5/)
    *get_token(F3,L4,j/F5) *write_line(F5/)
    ∆j→2
§3
    @+L50(10000) @+L51(10000) @+L52(100) @+L53(10000)
    *init_rules_array(/L50,L51)

*** set teminals (token ids)
    1⇒i
§31
    i@>L52
    ∆i i⊕37 ↦31

*** set rules
    OQ5 @'Setting rules'>F5 *write_line(F5/)
    *get_rules(/L50,L51)

*** set syntax table
    OQ5 @'Setting syntax table'>F5 *write_line(F5/)
    *get_table(/L53)

    OQ5 @'Start parsing'>F5 *write_line(F5/)
    *llparse(F3,L4,L50,L51,L52,L53/r) r↪5
    OQ5 @'Success'>F5 *write_line(F5/) →6
§5
    OQ5 @'Fatal'>F5 *write_line(F5/)
§6
    **
********************************************************************
#write(F1/)
#write_line(F1/)
#writev(a/)
#writev_line(a/)

#read_all_text(F1/F2)

#lex(F1/F2,L3)
#llparse(F3,L4,L5,L6,L7,L8/r)

#get_token_id(L1,i/d)
#get_token(F1,L2,i/F3)

#init_rules_array(/L1,L2)

#get_table(/L1)
#get_rules(/L1,L2)
