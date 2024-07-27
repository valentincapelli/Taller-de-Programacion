program ejercicio4;
type
    reclamo = record
        codigo : integer;
        dni : integer;
        anio : integer;
        tipo : string;
    end;

    lista = ^nodoL;
    nodoL = record
        dato : reclamo;
        sig : lista;
    end;

    infoArbol = record
        dni : integer;
        lista : lista;
        cant : integer;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato : infoArbol;
        HI : arbol;
        HD : arbol;
    end;

    procedure agregarAdelante(var L : lista; r : reclamo);
    var
        nue : lista;
    begin
        new(nue);
        nue^.dato := r;
        nue^.sig := L;
        L := nue;
    end;

    procedure agregarArbol(var a : arbol; r : reclamo);
    var
        info : infoArbol;
    begin
        if (a = nil) then begin
            new(a);
            info.lista := nil;
            info.cant := 1;
            info.dni := r.dni;
            agregarAdelante(info.lista, r);
            a^.dato := info;
            a^.HI := nil;
            a^.HD := nil;
        end
        else if (r.dni < a^.dato.dni) then
            agregarArbol(a^.HI, r)
        else if (r.dni > a^.dato.dni) then
            agregarArbol(a^.HD, r)
        else begin
            agregarAdelante(a^.dato.lista, r);
            a^.dato.cant := a^.dato.cant + 1;
        end;
    end;
    
    procedure leerReclamo(var r : reclamo);
    begin
		writeln('Ingrese el codigo');
		readln(r.codigo);
		if (r.codigo <> -1) then begin
			writeln('Ingrese el dni');
			readln(r.dni);
			writeln('Ingrese el anio');
			readln(r.anio);
			writeln('Ingrese el tipo');
			readln(r.tipo);
		end;
    end;

    // Inciso a
    procedure cargarArbol(var a : arbol);
    var
        r : reclamo;
    begin
        leerReclamo(r);
        if(r.codigo <> -1) then begin
            agregarArbol(a, r);
            cargarArbol(a);
        end;
    end;

    // Inciso b
    procedure retornarCantidadDni(a : arbol; dni : integer; var cant : integer);
    begin
        if (a <> nil) then begin
            if (a^.dato.dni = dni) then
                cant := a^.dato.cant
            else if (dni > a^.dato.dni) then
                retornarCantidadDni(a^.HD, dni, cant)
            else
                retornarCantidadDni(a^.HI, dni, cant);
        end;
    end;

    // Inciso c
    procedure cantidadBetween(a : arbol; dni1, dni2 : integer; var cant : integer);
    begin
        if (a <> nil) then begin
            if (dni1 < a^.dato.dni) then begin
                if (dni2 > a^.dato.dni) then begin
                    cant := cant + a^.dato.cant;
                    cantidadBetween(a^.HI, dni1, dni2, cant);
                    cantidadBetween(a^.HD, dni1, dni2, cant);
                end
                else
                    cantidadBetween(a^.HI, dni1, dni2, cant);
            end
            else
                cantidadBetween(a^.HD, dni1, dni2, cant);
        end;
    end;
    
    procedure recorrerListaAgregando(L : lista; anio : integer; var Ln : lista);
    begin
		while (L <> nil) do begin
			if (L^.dato.anio = anio) then
				agregarAdelante(Ln, L^.dato);
			L := L^.sig;
		end;
    end;

    // Inciso d
    procedure reclamosEnXAnio(var a : arbol; anio : integer; var L : lista);
    begin
        if (a <> nil) then begin
            recorrerListaAgregando(a^.dato.lista, anio, L);
            reclamosEnXAnio(a^.HI, anio, L);
            reclamosEnXAnio(a^.HD, anio, L);
        end;
    end;

    procedure imprimirLista(L : lista);
    begin
        while (L <> nil) do begin
            writeln('Codigo: ',L^.dato.codigo,' DNI: ',L^.dato.dni,' Tipo: ',L^.dato.tipo,' Anio: ',L^.dato.anio);
            L := L^.sig;
        end;
    end;

var
    a : arbol;
    dni, cant, dni1, dni2, cantEntre, anio : integer;
    L : lista;
begin
    cargarArbol(a);

    writeln('Ingrese un dni para saber la cantidad de reclamos');
    readln(dni);
    retornarCantidadDni(a, dni, cant);
    writeln('La cantidad de reclamos para ese dni es : ', cant);
    
    writeln('Ingrese el primer dni');
    readln(dni1);
    writeln('Ingrese el segundo dni');
    readln(dni2);
    cantidadBetween(a, dni1, dni2, cantEntre);
    writeln('La cantidad de reclamos entre esos dos dni es : ', cantEntre);

    writeln('Ingrese el anio que desea saber los reclamos');
    readln(anio);
    reclamosEnXAnio(a, anio, L);
    imprimirLista(L);
end.
