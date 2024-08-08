program finalimperativo;
type
    alumno = record
        nombre : string[40];
        dni : integer;
        tiempo : real;
    end;

    arbol = ^nodoArbol;
    nodoArbol = record
        dato : alumno;
        HI : arbol;
        HD : arbol;
    end;

    lista = ^nodoLista;
    nodoLista = record
        dato : alumno;
        sig : lista;
    end;


    // Inciso a
    procedure leerAlumno(var a : alumno);
    begin
        writeln('Ingrese el dni');
        readln(a.dni);
        if (a.dni <> 0) then begin
            writeln('Ingrese el nombre');
            readln(a.nombre);
            writeln('Ingrese el tiempo');
            readln(a.tiempo);
        end;
    end;

    procedure agregarAlumno(var a : arbol; alu : alumno);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato := alu;
            a^.HI := nil;
            a^.HD := nil;
        end
        else if (alu.tiempo <= a^.dato.tiempo) then
            agregarAlumno(a^.HI, alu)
        else
            agregarAlumno(a^.HD, alu);
    end;

    procedure cargarArbol(var a : arbol);
    var
        alu : alumno;
    begin
        a := nil;
        leerAlumno(alu);
        while (alu.dni <> 0) do begin
            agregarAlumno(a, alu);
            leerAlumno(alu);
        end;
    end;

    // Inciso b
    procedure agregarOrdenado(var L : lista; a : alumno);
    var
        nue, act, ant : lista;
    begin
        new(nue);
        nue^.dato := a;
        act := L;
        ant := L;
        while (act <> nil) and (a.tiempo > act^.dato.tiempo) do begin
            ant := act;
            act := act^.sig;
        end;
        if (act = ant) then
            L := nue
        else
            ant^.sig := nue;
        nue^.sig := act;
    end;

    procedure listaEnUnRangoDeMinutos(a : arbol; t1, t2 : real; var L : lista);
    begin
        if (a <> nil) then begin
            if (t1 < a^.dato.tiempo) and (t2 > a^.dato.tiempo) then begin
				agregarOrdenado(L, a^.dato);
				listaEnUnRangoDeMinutos(a^.HI, t1, t2, L);
				listaEnUnRangoDeMinutos(a^.HD, t1, t2, L)
            end
            else if (t1 < a^.dato.tiempo) then
                listaEnUnRangoDeMinutos(a^.HI, t1, t2, L)
            else
                listaEnUnRangoDeMinutos(a^.HD, t1, t2, L)
        end;
    end;

    procedure imprimirLista(L : lista);
    begin
        while (L <> nil) do begin
            writeln('El tiempo de este alumno es ', L^.dato.tiempo:0:2);
            L := L^.sig;
        end;
    end;

    // Inciso c
    procedure alumnoMasRapido(a : arbol; var nombre : string; var dni : integer);
    begin
        if (a = nil) then begin
            nombre := 'No hay ningun alumno ingresado.';
            dni := 0;
        end
        else if (a^.HI = nil) then begin
            nombre := a^.dato.nombre;
            dni := a^.dato.dni
        end
        else
            alumnoMasRapido(a^.HI, nombre, dni);
    end;

var
	a : arbol;
    L : lista;
    t1, t2 : real;
    nombre : string;
    dni : integer;
begin
    cargarArbol(a);

    L := nil;
    writeln('Ingrese el primer tiempo');
    readln(t1);
    writeln('Ingrese el segundo tiempo');
    readln(t2);
    listaEnUnRangoDeMinutos(a, t1, t2, L);
    imprimirLista(L);

    alumnoMasRapido(a, nombre, dni);
    writeln('El mas rapido es: ',nombre, ' DNI: ',dni);
end.
