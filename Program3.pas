program mat;
    const
      N=5;
      M=3;  
var
  a:array[1..N] of array[1..M] of Integer;
  i,j,d,k,p,tmp,tmpsum,w,x,b,ass:Integer;
  s:array[1..N] of Integer;   // масссив для хранения суммы
begin                         // элементов строк
randomize;
  for i:=1 to N do
    begin
      for j:=1 to M do
        begin
         a[i][j]:=random(10); //заполняем массив случайными числами
         write(a[i][j]);     //выводим полученный массив
         write(',');
        end;
        writeln;
    end;  
    { суммуируем }
    d:=1;
    s[d]:=0; 
     for k:=1 to N do
    begin
      for p:=1 to M do
        begin
         s[d]:=s[d]+a[k][p];// находим сумму элементов строки
        end;
        writeln(s[d]);     // сразу выводим
        d:=d+1;
    
    end;
    { сортируем "пузырьками" }
    writeln('Результат после ортировки,');
     for w:=2 to N do
    begin
      for x := N downto w do 
        begin
    			if (s[x-1]>s[x]) // если сумма передней строки больше
    			then
			begin   
				tmpsum:= s[x]; //переставляем суммы элементов
				s[x]:= s[x - 1];
				s[x - 1]:= tmpsum;
				//переставляем элементы т.е строки массива
				 for b:=1 to M do   // нужно в цикле переставить
             begin          // элементы строки  
      					tmp:= a[x][b]; 
      					a[x][b]:= a[x - 1][b];
      					a[x - 1][b]:= tmp;
				     end;
			end;
		end;
	end;
	{вывод}
	for i:=1 to N do
    begin
      for j:=1 to M do
        begin
         write(a[i][j]);
         write(',');
        end;
        writeln;
    end;
    // выводим и суммы элементов результирующей строки
    for ass:=1 to N do
     writeln(s[ass]);
end.
  
