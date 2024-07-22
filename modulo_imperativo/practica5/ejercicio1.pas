program ejercicio1;
const
    dimf = 300;
type
    oficina = record
        codigo : integer;
        dni : integer;
        expensa : real;
    end;
    vector = array [1..dimf] of oficina;
    
    procedure leerOficina(var o : oficina);
	begin
		readln(o.codigo);
		if (o.codigo <> -1) then begin
			readln(o.dni);
			readln(o.expensa);
		end;
	end;

    procedure cargarVector(var v : vector; var diml:integer);
    var
        o : oficina;
    begin
        diml := 0;
        leerOficina(o);
        while (o.codigo <> -1) and (diml < dimf)do begin
            diml := diml + 1;
            v[diml] := o;
            leerOficina(o);
        end;
    end;

    procedure ordenarVectorMetodoSeleccion(var v : vector; diml : integer);
    var
        i, j, pos : integer;
        o : oficina;
    begin
        for i := 1 to diml-1 do begin {busca el mínimo y guarda en pos la posición}
            pos := i;
            for j := i+1 to diml do
                if (v[j].codigo < v[pos].codigo) then
                    pos := j;

            {intercambia v[i] y v[p]}
            o := v[pos];
            v[pos] := v[i];
            v[i] := o;
        end;
    end;

    function busquedaDicotomicaVector(v : vector; diml: integer; var codigo:integer) : integer;
    var
        pri, ult, medio : integer;
        result : integer;
    begin
        result := 0;
        pri := 1;
        ult := diml;
        medio := (pri + ult) div 2;
        while (pri <= ult) and (codigo <> v[medio].codigo) do begin
            if (codigo < v[medio].codigo) then
                ult := medio-1
            else
                pri := medio+1;
            medio := (pri + ult) div 2;
        end;
        if (pri <= ult) and (codigo = v[medio].codigo) then
            result := medio;
        if (result <> 0) then
            writeln('El DNI del propietario con codigo ', codigo ,' es ', v[medio].dni, '.')
        else
            writeln('No se encontro la oficina.');
        busquedaDicotomicaVector := result;
    end;

    function moduloRecursivo(var v : vector; diml : integer; total : real; indice : integer) : real;
    begin
        if (indice <= diml) then begin
            total := total + v[indice].expensa;
            moduloRecursivo := moduloRecursivo(v, diml, total, indice+1)
        end
        else
            moduloRecursivo := total;
    end;

var
    v : vector;
    diml, pos, codigo : integer;
    totalExpensas : real;
begin
    cargarVector(v, diml);
    ordenarVectorMetodoSeleccion(v, diml);
    writeln('Ingrese el codigo que desea buscar:');
    readln(codigo);
    pos := busquedaDicotomicaVector(v, diml, codigo);
    totalExpensas := moduloRecursivo(v, diml, 0, 0);
    writeln('Total de expensas: ', totalExpensas:0:2);
end.
