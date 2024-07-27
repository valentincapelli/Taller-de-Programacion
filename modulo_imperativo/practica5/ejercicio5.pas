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

    procedure agregarAdelante(var L : lista; r : reclamo);
    var
        nue : lista;
    begin
        new(nue);
        nue^.dato := r;
        nue^.sig := L;
        L := nue;
    end;

    procedure agregarArbol(var a : arbol; var r : reclamo);
    var
        info : infoArbol;
        dni : integer;
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
            dni := r.dni;
            while (r.dni = dni) do begin
                agregarAdelante(a^.dato.lista, r);
                a^.dato.cant := a^.dato.cant + 1;
                leerReclamo(r);
            end;
        end;
    end;

    // Inciso a
    procedure cargarArbol(var a : arbol);
    var
        r : reclamo;
    begin
		leerReclamo(r);
        while (r.codigo <> -1) do begin
            agregarArbol(a, r);
        end;
    end;

var
    a : arbol;
begin
    cargarArbol(a); // no anda, no finaliza con el codigo -1
end.
