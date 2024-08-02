program final_imperativo;
type
    nrango = 1..5;
    srango = 1..50;
    llamada = record
        nivel : nrango;
        sector : srango;
        afectados : integer;
    end;

    lista = ^nodoL;
    nodoL = record
        dato : llamada;
        sig : lista;
    end;

    infoNodo = record
        nivel : integer;
        lista : lista;
    end;
    arbol = ^nodoA;
    nodoA = record
        dato : infoNodo;
        HI : arbol;
        HD : arbol;
    end;

    arbolN = ^nodoN;
    nodoN = record
        dato : llamada;
        HI : arbolN;
        HD : arbolN;
    end;

    procedure leerLlamada(var l : llamada);
    begin
        l.nivel := Random(5) + 1; // Random genera un número entre 0 y 4, sumamos 1 para que sea entre 1 y 5
        l.sector := Random(50) + 1; // Random genera un número entre 0 y 49, sumamos 1 para que sea entre 1 y 50
        l.afectados := Random(100); // Genera un número aleatorio de afectados entre 0 y 99
    end;

    procedure agregarOrdenado(var L : lista; ll : llamada);
    var
        nue, act, ant : lista;
    begin
        new(nue);
        nue^.dato := ll;
        act := L;
        ant := L;
        while (act <> nil) and (ll.sector > act^.dato.sector) do begin
            ant := act;
            act := act^.sig;
        end;
        if (act =  ant) then
            L := nue
        else
            ant^.sig := nue;
        nue^.sig := act;
    end;

    procedure agregarArbol(var a : arbol; l : llamada);
    var
        info : infoNodo;
    begin
        if (a = nil) then begin
            new(a);
            info.lista := nil;
            info.nivel := l.nivel;
            agregarOrdenado(info.lista, l);
            a^.dato := info;
            a^.HI := nil;
            a^.HD := nil;
        end
        else if (l.nivel < a^.dato.nivel) then
            agregarArbol(a^.HI, l)
        else if (l.nivel > a^.dato.nivel) then
            agregarArbol(a^.HD, l)
        else begin
            agregarOrdenado(a^.dato.lista, l)
        end;
    end;

    // Inciso a
    procedure cargarArbol(var a : arbol);
    var
        l : llamada;
        i : integer;
    begin
        Randomize;
        for i := 0 to 100 do begin
            leerLlamada(l);
            agregarArbol(a, l);
        end;
    end;

    procedure agregarArbolN(var an : arbolN; l : llamada);
    begin
        if (an = nil) then begin
            new(an);
            an^.dato := l;
            an^.HI := nil;
            an^.HD := nil;
        end
        else if (l.afectados < an^.dato.afectados) then
            agregarArbolN(an^.HI, l)
        else
            agregarArbolN(an^.HD, l)
    end;

    procedure generarEstructura(var an : arbolN; L : lista);
    begin
        while (L <> nil) do begin
            agregarArbolN(an, L^.dato);
            L := L^.sig;
        end;
    end;

    // Inciso b
    procedure generarArbolConNivelN(a : arbol; nivelN : nrango; var an : arbolN);
    begin
        if (a <> nil) then begin
            if (a^.dato.nivel = nivelN) then
                generarEstructura(an, a^.dato.lista)
            else if (nivelN > a^.dato.nivel) then
                generarArbolConNivelN(a^.HD, nivelN, an)
            else
                generarArbolConNivelN(a^.HI, nivelN, an);
        end;
    end;

    procedure calcularMaximo(a : arbolN; var sector : srango; var max : integer);
    begin
        if (a <> nil) then begin
            if (a^.dato.afectados > max) then begin
                max := a^.dato.afectados;
                sector := a^.dato.sector;
            end;
            calcularMaximo(a^.HI, sector, max);
            calcularMaximo(a^.HD, sector, max);
        end;
    end;

    // Inciso c
    procedure mayorCantidadAfectados(a : arbolN; var sector : srango);
    var
        maxAfectados : integer;
    begin
        maxAfectados := 0;
        calcularMaximo(a, sector, maxAfectados)
    end;
    
    procedure informarArbolN(a : arbolN);
    begin
		if (a <> nil) then begin
			writeln('Nivel: ',a^.dato.nivel,' Sector: ', a^.dato.sector,' Afectados: ', a^.dato.afectados);
			informarArbolN(a^.HI);
			informarArbolN(a^.HD);
		end;
    end;

var
	sector : srango;
    a : arbol;
    nivelN : nrango;
    aN : arbolN;
begin
    cargarArbol(a);

    writeln('Ingrese el nivel N');
    readln(nivelN);
    generarArbolConNivelN(a, nivelN, aN);
    informarArbolN(aN);
    mayorCantidadAfectados(aN, sector);
    writeln('En el nivel N de importancia ingresado, el sector con mas gente afectada es ', sector);
end.
