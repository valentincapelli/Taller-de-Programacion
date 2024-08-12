program final_imperativo;
type
    recital = record
        nombreBanda : string;
        fecha : string;
        cantidadCanciones : integer;
        montoRecaudado : real;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato : recital;
        HI : arbol;
        HD : arbol;
    end;

    lista = ^nodoL;
    nodoL = record
        dato : recital;
        sig : lista;
    end;
    
    // Inciso a
    procedure leerRecital(var r : recital);
    begin
		writeln('Ingrese el nombre');
		readln(r.nombreBanda);
		if (r.nombreBanda <> 'ZZZ') then begin
			writeln('Ingrese la fecha ');
			readln(r.fecha);
			writeln('Ingrese la cantidad de canciones');
			readln(r.cantidadCanciones);
			writeln('Ingrese el monto recaudado');
			readln(r.montoRecaudado);
		end;
    end;

    procedure agregarRecital(var a : arbol; r : recital);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato := r;
            a^.HI := nil;
            a^.HD := nil;
        end
        else if (r.montoRecaudado <= a^.dato.montoRecaudado) then
            agregarRecital(a^.HI, r)
        else
            agregarRecital(a^.HD, r);
    end;

    procedure cargarArbol(var a : arbol);
    var
		r : recital;
    begin
        leerRecital(r);
        while (r.nombreBanda <> 'ZZZ') do begin
            agregarRecital(a, r);
            leerRecital(r);
        end;
    end;

    // Inciso b
    procedure agregarOrdenado(var L : lista; r : recital);
    var
        nue, act, ant : lista;
    begin
        new(nue);
        nue^.dato := r;
        act := L;
        ant := L;
        while (act <> nil) and (r.montoRecaudado < act^.dato.montoRecaudado) do begin
            ant := act;
            act := act^.sig;
        end;
        if (act = ant) then
            L := nue
        else
            ant^.sig := nue;
        nue^.sig := act;
    end;

    procedure crearListaEntre2Valores(a : arbol; valor1, valor2 : integer; var L : lista);
    begin
        if (a <> nil) then begin
            if (valor1 <= a^.dato.montoRecaudado) and (valor2 >= a^.dato.montoRecaudado) then begin
                agregarOrdenado(L, a^.dato);
                crearListaEntre2Valores(a^.HI, valor1, valor2, L);
                crearListaEntre2Valores(a^.HD, valor1, valor2, L);
            end
            else if (valor1 < a^.dato.montoRecaudado) then
                crearListaEntre2Valores(a^.HI, valor1, valor2, L)
            else
                crearListaEntre2Valores(a^.HD, valor1, valor2, L);
        end;
    end;

    procedure imprimirLista(L : lista);
    begin
        while (L <> nil) do begin
            writeln(L^.dato.montoRecaudado:0:2);
            L := L^.sig;
        end;
    end;

    // Inciso c
    procedure recitalesConMasDe12Canciones(L : lista; var cant : integer);
    begin
        if (L <> nil) then begin
            if (L^.dato.cantidadCanciones > 12) then
                cant := cant + 1;
            recitalesConMasDe12Canciones(L^.sig, cant);
        end;
    end;

var
    a : arbol;
    valor1, valor2, cant : integer;
    L : lista;
begin
    cargarArbol(a);

    writeln('Ingrese el primer valor');
    readln(valor1);
    writeln('Ingrese el segundo valor');
    readln(valor2);
    L := nil;
    crearListaEntre2Valores(a, valor1, valor2, L);
    imprimirLista(L);
    
    cant := 0;
    recitalesConMasDe12Canciones(L, cant);
    writeln('La cantidad de recitales con mas de 12 canciones son: ', cant);
end.
