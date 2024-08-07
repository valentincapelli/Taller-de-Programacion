program finalimperativo;
type
    pedido = record
        dni : integer;
        nombre : string[40];
        fecha : string[10];
        montoAbonar : double;
    end; 

    infoNodoLista = record
        fecha : string[10];
        montoAbonar : double;
    end;

    lista = ^nodoL;
    nodoL = record
        dato : infoNodoLista;
        sig : lista;
    end;

    infoNodoArbol = record
        dni : integer;
        nombre : string[40];
        lista : lista;
    end;

    arbol = ^nodoA;
    nodoA = record
        dato : infoNodoArbol;
        HI : arbol;
        HD : arbol;
    end;

    procedure leerPedido(var p : pedido);
    begin
        writeln('Ingrese el dni');
        readln(p.dni);
        writeln('Ingrese el monto');
        readln(p.montoAbonar);
        if (p.montoAbonar <> 0) then begin
            writeln('Ingrese el nombre');
            readln(p.nombre);
            writeln('Ingrese la fecha');
            readln(p.fecha);
        end;
    end;

    procedure agregarOrdenado(var L : lista; i : infoNodoLista);
    var
        nue, act, ant : lista;
    begin
        new(nue);
        nue^.dato := i;
        act := L;
        ant := L;
        while (act <> nil) and (i.fecha > act^.dato.fecha) do begin
            ant := act;
            act := act^.sig;
        end;
        if (act = ant) then
            L := nue
        else
            ant^.sig := nue;
        nue^.sig := act;
    end;

    procedure agregarPedido(var a : arbol; p : pedido);
    var
        infoA : infoNodoArbol;
        infoL : infoNodoLista;
    begin
        if (a = nil) then begin
            new(a);
            infoA.dni := p.dni;
            infoA.nombre := p.nombre;
            infoA.lista := nil;
            a^.dato := infoA;
            infoL.montoAbonar := p.montoAbonar;
            infoL.fecha := p.fecha;
            agregarOrdenado(a^.dato.lista, infoL);
            a^.HI := nil;
            a^.HD := nil;
        end
        else begin
            if (a^.dato.dni = p.dni) then begin
                infoL.montoAbonar := p.montoAbonar;
                infoL.fecha := p.fecha;
                agregarOrdenado(a^.dato.lista, infoL);
            end
            else if (p.dni < a^.dato.dni) then
                agregarPedido(a^.HI, p)
            else
                agregarPedido(a^.HD, p);
        end;
    end;

    // Inciso 1
    procedure cargarArbol(var a : arbol);
    var
        p : pedido;
    begin
        leerPedido(p);
        while (p.montoAbonar <> 0) do begin
            agregarPedido(a, p);
            leerPedido(p);
        end;
    end;

    procedure buscarFechaEnLista(L : lista; f: string; var cant : integer);
    begin
        while (L <> nil) and (L^.dato.fecha <= f)do begin
            if (L^.dato.fecha = f) then
                cant := cant + 1;
            L := L^.sig;
        end;
    end;

    procedure buscarFecha(a : arbol; f : string; var cant : integer);
    begin
        if (a <> nil) then begin
            buscarFechaEnLista(a^.dato.lista, f, cant);
            buscarFecha(a^.HI, f, cant);
            buscarFecha(a^.HD, f, cant);
        end;
    end;

    // Inciso 2
    procedure cantidadPedidosEnCiertaFecha(a : arbol);
    var
        fecha : string[10];
        cant : integer;
    begin
        writeln('Ingrese la fecha que desea saber la cantidad de pedidos realizados');
        readln(fecha);
        cant := 0;
        buscarFecha(a, fecha, cant);
        writeln('La cantidad de pedidos para esa fecha es ', cant);
    end;

    procedure contarAbonadoYPedidos(L : lista; var pedidos : integer; var abonado : double);
    begin
        while (L <> nil) do begin
            abonado := abonado + L^.dato.montoAbonar;
            pedidos := pedidos + 1;
            L := L^.sig;
        end;
    end;

    procedure buscarDNI(a : arbol; dni : integer; var pedidos : integer; var abonado : double);
    begin
        if (a <> nil) then begin
            if (a^.dato.dni = dni) then
                contarAbonadoYPedidos(a^.dato.lista, pedidos, abonado)
            else if (dni < a^.dato.dni) then
                buscarDNI(a^.HI, dni, pedidos, abonado)
            else
                buscarDNI(a^.HD, dni, pedidos, abonado);
        end
    end;

    // Inciso 3
    procedure totalAbonadoYPedidosDNI(a : arbol);
    var
        totalPedidos, dni : integer;
        totalAbonado : double;
    begin
        totalPedidos := 0;
        totalAbonado := 0;
        writeln('Ingrese el DNI que desea saber la cantidad abonado y de pedidos');
        readln(dni);
        buscarDNI(a, dni, totalPedidos, totalAbonado);
        writeln('La cantidad de pedidos de ese dni son ',totalPedidos,' y la cantidad abonada ', totalAbonado:0:2);
    end;

var
    a : arbol;
begin
    cargarArbol(a);

    cantidadPedidosEnCiertaFecha(a);

    totalAbonadoYPedidosDNI(a);
end.
