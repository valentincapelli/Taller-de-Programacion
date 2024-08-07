program finalimperativo;
type
    producto = record
        codigoProducto : integer;
        cantidadVendida : integer;
        codigoCliente : integer;
    end;

    infoNodoLista = record
        codigoProducto : integer;
        cantidadVendida : integer;
    end;

    lista = ^nodoLista;
    nodoLista = record
        dato : infoNodoLista;
        sig : lista;
    end;

    vectorListas = array [1..5] of lista;

    procedure agregarOrdenado(var L : lista; i : infoNodoLista);
    var
        nue, act, ant : lista;
    begin
        new(nue);
        nue^.dato := i;
        act := L;
        ant := L;
        while (act <> nil) and (i.codigoProducto > act^.dato.codigoProducto) do begin
            ant := act;
            act := act^.sig;
        end;
        if (act = ant) then
            L := nue
        else
            ant^.sig := nue;
        nue^.sig := act;
    end;

    procedure buscarProducto(L : lista; i : infoNodoLista; var encontro : boolean);
    begin
        encontro := false;
        while (L <> nil) and (i.codigoProducto >= L^.dato.codigoProducto) do begin
            if (L^.dato.codigoProducto = i.codigoProducto) then begin
                L^.dato.cantidadVendida := L^.dato.cantidadVendida + i.cantidadVendida;
                encontro := true;
            end;
            L := L^.sig;
        end;
    end;
    
	procedure leerProducto(var p : producto);
	begin
		writeln('Ingrese el codigo de producto');
		readln(p.codigoProducto);
		if (p.codigoProducto <> -1) then begin
			writeln('Ingrese la cantidad vendida ');
			readln(p.cantidadVendida);
			writeln('Ingrese el codigo del cliente');
			readln(p.codigoCliente);
		end;
	end;
    
    // Inciso a
    procedure cargarVectorDeListas(var v : vectorListas);
    var
        i : integer;
        p : producto;
        encontro : boolean;
        info : infoNodoLista;
    begin
        for i := 1 to 5 do begin
            writeln('Ingrese los producto para el dia ', i ,' de la semana.');
            leerproducto(p);
            while (p.codigoProducto <> -1) do begin
				info.codigoProducto := p.codigoProducto;
                info.cantidadVendida := p.cantidadVendida;
                buscarProducto(v[i], info, encontro);
                if (not encontro) then begin
                    agregarOrdenado(v[i], info);
                end;
                leerproducto(p);
            end;
        end;
    end;

    // Inciso b
    procedure generarListaNueva(v : vectorListas; var L : lista);
    var
        i : integer;
        encontro : boolean;
        info : infoNodoLista;
        aux : lista;
    begin
		L := nil;
        for i := 1 to 5 do begin
			aux := v[i];
            while (aux <> nil) do begin
                buscarProducto(L, aux^.dato, encontro);
                if (not encontro) then begin
                    info.codigoProducto := aux^.dato.codigoProducto;
                    info.cantidadVendida := aux^.dato.cantidadVendida;
                    agregarOrdenado(L, info);
                end;
                aux := aux^.sig;
            end;
        end;
    end;

    procedure codigoMasVendido(L : lista; var maxCodigo, maxVentas : integer);
    begin
        if (L <> nil) then begin
            if (L^.dato.cantidadVendida > maxVentas) then begin
                maxVentas := L^.dato.cantidadVendida;
                maxCodigo := L^.dato.codigoProducto;
            end;
            codigoMasVendido(L^.sig, maxCodigo, maxVentas);
        end;
    end;

var
    v : vectorListas;
    L : lista;
    maxVentas, maxCodigo : integer;
begin
    cargarVectorDeListas(v);
    
    generarListaNueva(v, L);

    maxVentas := -1;
    codigoMasVendido(L, maxCodigo, maxVentas);
    writeln('El codigo de producto mas vendido es ', maxCodigo,' con ',maxVentas,' ventas.');
end.
