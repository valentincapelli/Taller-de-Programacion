{Un robot fiscalizador recibe mensajes de cinco robots trabajadores. En cada mensaje
recibe: id del robot trabajador(1..5), cantidad de flores juntadas(0..10), cantidad de
papeles juntados(0..10) y esquina (calle(1..100), avenida(1..100)) donde se lleva a 
cabo la recoleccion. Los robots trabajadores envian un mensaje por cada esquina vistada.
Cada robot puede visitar mas de una esquina.

Implemente en pascal:

a) Un modulo que simule la llega de 100 mensajes en total. Almacene toda la informacion
recibida en una estructura agrupada por id de robot y ordenada por numero de avenida.

b) Un modulo que reciba la estructura generada en a) y devuelva una lista ordenada por
numero de avenida, donde para cada numero de avenida se almacene: cantidad total de
flores recolectadas y cantidad de esquinas donde se juntaron cero papeles.

c) Un modulo recursivo que reciba la lista en b) y con toda su informacion genere un 
ABB ordenado por cantidad de flores recolectadas.}

program final_9_5_2023;
type
    irango = 1..5;
    frango = 0..10;
    crango = 1..100;

    esquina = record
        calle : crango;
        avenida : crango;
    end;
    mensaje = record
        id : irango;
        flores : frango;
        papeles : frango;
        esquina : esquina;
    end;

    lista = ^nodoL;
    nodoL = record
        dato : mensaje;
        sig : lista;
    end;

    infoNodoA = record
        id : irango;
        lista : lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato: infoNodoA;
        HI : arbol;
        HD : arbol;
    end;

    infoNodoOrdenado = record
        avenida : crango;
        floresRecolectadas : integer;
        esquinasCeroPapeles : integer;
    end;

    listaOrdenada = ^nodoOrdenado;
    nodoOrdenado = record
        dato : infoNodoOrdenado;
        sig : listaOrdenada;
    end;

    arbolbb = ^nodobb;
    nodobb = record
        dato : infoNodoOrdenado;
        HI : arbolbb;
        HD : arbolBB;
    end;

    procedure leerMensaje(var m : mensaje);
    begin
        writeln('Ingrese el id');
        readln(m.id);
        writeln('Ingrese la cantidad de flores');
        readln(m.flores);
        writeln('Ingrese la cantidad de papeles');
        readln(m.papeles);
        writeln('Ingrese la avenida');
        readln(m.esquina.avenida);
        writeln('Ingrese la calle');
        readln(m.esquina.calle);
    end;

    procedure agregarOrdenado(var L : lista; m : mensaje);
    var
        nue, act, ant : lista;
    begin
        new(nue);
        nue^.dato := m;
        ant := L;
        act := L;
        while (act <> nil) and (m.esquina.avenida > L^.dato.esquina.avenida) do begin
            act := act;
            act := act^.sig;
        end;
        if (act = ant) then
            L := nue
        else
            ant^.sig := nue;
        nue^.sig := act;
    end;

    procedure agregarArbol(var a : arbol; m : mensaje);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato.id := m.id;
            a^.dato.lista := nil;
            agregarOrdenado(a^.dato.lista, m);
            a^.HI := nil;
            a^.HD := nil;
        end
        else begin
            if (a^.dato.id = m.id) then
                agregarOrdenado(a^.dato.lista, m)
            else if (a^.dato.id < m.id) then
                agregarArbol(a^.HI, m)
            else
                agregarArbol(a^.HD, m);
        end;
    end;

    // Inciso a
    procedure cargarArbol(var a : arbol);
    var
        m : mensaje;
        i : integer;
    begin
        for i := 0 to 2 do begin
            leerMensaje(m);
            agregarArbol(a, m);
        end;
    end;

    procedure agregarOrdenadoLista2(var L : listaOrdenada; m : mensaje);
    var
        nue, act, ant : listaOrdenada;
        info : infoNodoOrdenado;
    begin
        new(nue);
        info.avenida := m.esquina.avenida;
        info.floresRecolectadas := m.flores;
        if (m.papeles = 0) then
            info.esquinasCeroPapeles := 0
        else
            info.esquinasCeroPapeles := 1;
        nue^.dato := info;
        ant := L;
        act := L;
        while (act <> nil) and (m.esquina.avenida > L^.dato.avenida) do begin
            act := act;
            act := act^.sig;
        end;
        if (act = ant) then
            L := nue
        else
            ant^.sig := nue;
        nue^.sig := act;
    end;

    procedure buscarListaOrdenada(var L : listaOrdenada; m : mensaje; var encontre : boolean);
    begin
        encontre := false;
        while (L <> nil) and (L^.dato.avenida < m.esquina.avenida) and (not encontre) do begin
            if (L^.dato.avenida = m.esquina.avenida) then
                encontre := true;
                L^.dato.floresRecolectadas := L^.dato.floresRecolectadas + m.flores;
                if (m.papeles = 0) then
                    L^.dato.esquinasCeroPapeles := L^.dato.esquinasCeroPapeles + 1;
            L := L^.sig;
        end;
    end;

    // Inciso b
    procedure crearListaOrdenada(a : arbol; var L : listaOrdenada);
    var
        ok : boolean;
    begin
        if (a <> nil) then begin
            while (a^.dato.lista <> nil) do begin
                buscarListaOrdenada(L, a^.dato.lista^.dato, ok);
                if (not ok) then
                    agregarOrdenadoLista2(L, a^.dato.lista^.dato);
                a^.dato.lista := a^.dato.lista^.sig;
            end;
            crearListaOrdenada(a^.HI, L);
            crearListaOrdenada(a^.HD, L);
        end;
    end;

    procedure agregarArbolbb(var a : arbolbb; i : infoNodoOrdenado);
    begin
        if(a = nil)then begin
            new(a);
            a^.dato:= i;
            a^.HI:= nil;
            a^.HD:= nil
        end
        else begin
            if(i.floresRecolectadas < a^.dato.floresRecolectadas)then
                agregarArbolbb(a^.HI, i)
            else
                agregarArbolbb(a^.HD, i);
        end;      
    end;  

    // Inciso c
    procedure crearABB(var a : arbolbb; L : listaOrdenada);
    begin
        if (L <> nil) then begin
            agregarArbolbb(a, L^.dato);
            crearABB(a, L^.sig);
        end;
    end;

var
    a : arbol;
    L : listaOrdenada;
    abb : arbolbb;
begin
    cargarArbol(a);

    L := nil;
    crearListaOrdenada(a, L);

    abb := nil;
    crearABB(abb, L);
end.
