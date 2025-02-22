********************************************************************
*** Открытие файла
*** F1 - имя файла (в текущем каталоге)
*** r - режим открытия: 0 - чтение, 1 - запись, 2 - чтение/запись
*** n  - дескриптор файла (<0 при отказе)
********************************************************************
fopen(F1,r/n)
    0@>F1
    {mov eax,5}
    {mov ebx,[ebp+220]}
    {mov ecx,[ebp+72]}
    {int 80h}
    {mov [ebp+56],eax}
    **
********************************************************************
*** Закрытие файла
*** n  - дескриптор файла
********************************************************************
fclose(n/)
    {mov eax,6}
    {mov ebx,[ebp+56]}
    {int 80h}
    **
********************************************************************
*** Чтение из файла в символьный комплекс
*** n  - дескриптор файла
*** F1 - файл
*** b - адрес в F1 первого считанного байта
*** l - число запрашиваемых байт
*** k - число считанных байтов (код ошибки для <0)
********************************************************************
freadf(n,F1,b,l/k)
    {mov eax,3}
    {mov ebx,[ebp+56]}
    {mov ecx,[ebp+220]}
    {add ecx,[ebp+8]}
    {mov edx,[ebp+48]}
    {int 80h}
    {mov [ebp+44],eax}
    **
********************************************************************
*** Запись из символьного комплекса в файл
*** n  - дескриптор файла
*** F1 - файл
*** b - адрес в F1 первого записываемого байта
*** l - число записывемых байт
*** k - число записанных байтов (код ошибки для <0)
********************************************************************
fwritef(n,F1,b,l/k)
    {mov eax,4}
    {mov ebx,[ebp+56]}
    {mov ecx,[ebp+220]}
    {add ecx,[ebp+8]}
    {mov edx,[ebp+48]}
    {int 80h}
    {mov [ebp+44],eax}
    **
