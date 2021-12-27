***⇒ ¬ % ∨ & ⊕ ∆ ∇ § → ↪ ↦↑ ≠ > < ≥ ≤ @ \

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

/'File name is: '>C
∇Q1 *write_line(F1/) 0@>F1

*** open file and read text to F2
*fopen(F1,0/n)
*freadf(n,F2,0,10000/k)
k⇒Q2
*write_line(F2/)
*fclose(n/)

@+F3(10000) @+L4(10000)
*lex(F2/F3,L4)

*** show all tokens
@+F5(100) L4.0⇒n *n2s(n/F5) *write_line(F5/)
    Oj
§2
    ↑(j=n)3
    *get_token_id(L4,j/d) *n2s(d/F5) /'id: '>C /F5>C /'; value: '>C
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

    @+L55(100)
    *** set rules
    /'Setting rules\n'>C
    *get_rules(/L50,L51)    

    *** set syntax table
    /'Setting syntax table\n'>C
    *get_table(/L53)
    
    /'Start parsing\n'>C
    *llparse(F3,L4,L50,L51,L52,L53/r) r↪5
    /'Success\n'>C →6
§5
    /'Fatal\n'>C
§6
    **
********************************************************************
#write_line(F1/)
#lex(F1/F2,L3)
#llparse(F3,L4,L5,L6,L7,L8/r)

#init_syntax_table(/L1)
#add_syntax_table_item(L1,n,t,i/r)

#get_token_id(L1,i/d)
#get_token(F1,L2,i/F3)
#add_token(F1,L2,F3,i,p/F1,L2)
#init_rules_array(/L1,L2)
#get_rule(L1,L2,l,i/L3,r)
#add_rule(L1,L2,L3,i/L1,L2)
#stack_push(L1,L2/L1)
#stack_pop(L1,k/L1,L2)
#stack_peek(L1/x)
#is_terminal(L1,x/r)
#pack_alternative(x,a/r)
#unpack_alternative(p/x,a,r)
#fopen(F1,r/n)
#fclose(n/)
#freadf(n,F1,b,l/k)
#fwritef(n,F1,b,l/k)
#s2n(F1/a)
#n2s(a/F2)
#get_table(/L1)
#get_rules(/L1,L2)
