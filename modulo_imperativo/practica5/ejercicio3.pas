program ejercicio3;
type
    rrango = 1..10;
    producto = record
        codigo : integer;
        rubro : rrango;
        stock : integer;
        precio : real;
    end;

    lista = ^nodoLista;
    nodoLista = record
        dato: producto;
        sig : lista;
	end;
	
    infoNodo = record
        lista : lista;
        rubro : rrango;
    end;

    arbol = ^nodo;
    nodo = record
        dato: infoNodo;
        HI: arbol;
        HD: arbol;
    end;

    infoVector = record
        rubro : rrango;
        codigo : integer;
        stock : integer;
    end;
    vector = array [rrango] of infoVector;

    infoVectorCantidad = record
        rubro : rrango;
        cant : integer;
    end;
    vectorCantidad = array [rrango] of infoVectorCantidad;

    procedure agregarOrdenado(var L : lista; p : producto);
    var
        nue, act, ant: lista;
    begin
        new(nue);
        nue^.dato := p;
        act := L;
        ant := L;
        while (act <> nil) and (p.codigo > act^.dato.codigo) do begin
            ant := act;
            act := act^.sig;
        end;
        if (act = ant) then
            L := nue
        else
            ant^.sig:= nue;
        nue^.sig := act;
    end;

    procedure agregarNodo(var a : arbol; p : producto);
    var
        info : infoNodo;
    begin
        if (a = nil) then begin
            new(a);
            info.lista := nil;
            info.rubro := p.rubro;
            agregarOrdenado(info.lista, p);
            a^.dato := info;
            a^.HI := nil;
            a^.HD := nil;
        end
        else if (p.rubro < a^.dato.rubro) then
            agregarNodo(a^.HI, p)
        else if (p.rubro > a^.dato.rubro) then
            agregarNodo(a^.HD, p)
        else
            agregarOrdenado(a^.dato.lista, p);
    end;

    procedure leerProducto(var p : producto);
    begin
		writeln('Ingrese el codigo');
        read(p.codigo);
        if (p.codigo <> -1) then begin
			writeln('Ingrese el rubro');
            read(p.rubro);
            writeln('Ingrese el stock');
            read(p.stock);
            writeln('Ingrese el precio');
            read(p.precio);
        end;
    end;

    procedure cargarArbol(var a : arbol);
    var
        p : producto;
    begin
        leerProducto(p);
        while (p.codigo <> -1) do begin
            agregarNodo(a, p);
            leerProducto(p);
        end;
    end;

    function existeEnLista(L : lista; codigo : integer):boolean;
    begin
        existeEnLista := false;
        while (L <> nil) do begin
            if (L^.dato.codigo = codigo) then begin
                existeEnLista := true;
            end;
            L := L^.sig;
        end;
    end;

    // Inciso b
    procedure buscarRubroYCodigo(var a : arbol; rubro : rrango; codigo : integer; var existe : boolean);
    begin
        if (a <> nil) then begin
            if (rubro = a^.dato.rubro) then
                if (existeEnLista(a^.dato.lista, codigo)) then
                    existe := true
                else
                    buscarRubroYCodigo(a^.HD, rubro, codigo, existe)
            else if (rubro > a^.dato.rubro) then
                buscarRubroYCodigo(a^.HD, rubro, codigo, existe)
            else
                buscarRubroYCodigo(a^.HI, rubro, codigo, existe);
        end;
    end;

    procedure calcularCodigoMaximo(L : lista; var codigo, stock : integer);
    begin
        codigo := 0;
        while (L <> nil) do begin
            if (L^.dato.codigo > codigo) then begin
                codigo := L^.dato.codigo;
                stock := L^.dato.stock;
            end;
            L := L^.sig;
        end;
    end;

    //Inciso c
    procedure mayoresCodigos(a : arbol; var v : vector);
    var
        info : infoVector;
        codigo, stock : integer;
    begin
        if (a <> nil) then begin
            calcularCodigoMaximo(a^.dato.lista, codigo, stock);
            info.rubro := a^.dato.rubro;
            info.codigo := codigo;
            info.stock := stock;
            v[a^.dato.rubro] := info;
            mayoresCodigos(a^.HI, v);
            mayoresCodigos(a^.HD, v);
        end;
    end;
    
    procedure imprimirVector(v : vector);
    var
		i : integer;
	begin
		for i:= 1 to 10 do
			writeln('Codigo: ',v[i].codigo,' Rubro: ',v[i].rubro,' Stock: ',v[i].stock);
	end;

    procedure procesarListaProductos(L : lista; codigo1, codigo2 : integer; var cant : integer);
    var
        ok : boolean;
    begin
        cant := 0;
        ok := true;
        while (L <> nil) and (ok)do begin
            if (L^.dato.codigo > codigo1) and (L^.dato.codigo < codigo2) then
                cant := cant + 1
            else if (L^.dato.codigo > codigo2) then
                ok := false; // como la lista esta ordenado de menos a mas ya no haria falta seguir recorriendo
            L := L^.sig;
        end;
    end;
    
    // Inciso d
    procedure cantidadProductosEntre2Valores(a : arbol; codigo1, codigo2 : integer; var v : vectorCantidad);
    var
        cant : integer;
    begin
        if (a <> nil) then begin
            procesarListaProductos(a^.dato.lista, codigo1, codigo2, cant);
            v[a^.dato.rubro].rubro := a^.dato.rubro;
            v[a^.dato.rubro].cant := cant;
            cantidadProductosEntre2Valores(a^.HI, codigo1, codigo2, v);
            cantidadProductosEntre2Valores(a^.HD, codigo1, codigo2, v);
        end;
    end;

    procedure imprimirVectorCantidad(v : vectorCantidad);
    var
		i : integer;
	begin
		for i:= 1 to 10 do
			writeln('Rubro: ',v[i].rubro,' Cantidad: ',v[i].cant);
	end;

var
    a : arbol;
    existe : boolean;
    rubro : rrango;
    codigo, code1, code2 : integer;
    v : vector;
    vc : vectorCantidad;
begin
    cargarArbol(a);

    writeln('Ingrese el rubro que desea buscar');
    readln(rubro);
    writeln('Ingrese el codigo que desea buscar');
    readln(codigo);
    buscarRubroYCodigo(a, rubro, codigo, existe);
    writeln('El rubro y codigo que ingreso existe? ', existe);
    
    mayoresCodigos(a, v);
    imprimirVector(v);

    writeln('Ingrese el primer code');
    readln(code1);
    writeln('Ingrese el segundo code');
    readln(code2);
    cantidadProductosEntre2Valores(a, code1, code2, vc);
    imprimirVectorCantidad(vc);
end.
