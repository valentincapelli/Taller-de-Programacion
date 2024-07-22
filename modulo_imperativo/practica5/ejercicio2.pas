program ejercicio2;
type
    prango = string[10];
    frango = 2010..2018;
    auto = record
        patente : prango;
        fabricacion : frango;
        marca : string[40];
        modelo : string[40];
    end;

    arbol = ^nodo;
    nodo = record
        dato : auto;
        HI : arbol;
        HD : arbol;
    end;

    lista = ^nodoLista;
    nodoLista = record
        dato: auto;
        sig: lista;
    end;

    infoMarca = record
        marca : string[40];
        lista : lista;
    end;

    arbolMarcas = ^nodoM;
    nodoM = record
        dato : infoMarca;
        HI : arbolMarcas;
        HD : arbolMarcas;
    end;
    
    procedure leerAuto(var a : auto);
    begin
		readln(a.patente);
		if (a.patente <> 'zzz') then begin
			readln(a.fabricacion);
			readln(a.marca);
			readln(a.modelo);
		end;
    end;
    
    procedure agregarArbolP(var arbol : arbol ; auto : auto);
    begin
        if (arbol = nil) then begin
            new(arbol);
            arbol^.dato := auto;
            arbol^.HI := nil;
            arbol^.HD := nil;
        end
        else
            if (auto.patente <= arbol^.dato.patente) then
                agregarArbolP(arbol^.HI, auto)
            else
                agregarArbolP(arbol^.HD, auto);
    end;

    procedure agregarAdelante(var L: lista; c: auto);
    var
        nue: lista;
    begin
        new(nue);
        nue^.dato:= c;
        nue^.sig:= L;
        L:= nue;
    end;

    procedure agregarArbolM(var arbol : arbolMarcas ; auto : auto);
	var
		info : infoMarca;
	begin
		if (arbol = nil) then begin
			new(arbol);
			info.lista := nil;
			info.marca := auto.marca;
			agregarAdelante(info.lista, auto);
			arbol^.dato := info;
			arbol^.HI := nil;
			arbol^.HD := nil;
		end
		else if (auto.marca < arbol^.dato.marca) then
			agregarArbolM(arbol^.HI, auto)
		else if (auto.marca > arbol^.dato.marca) then
			agregarArbolM(arbol^.HD, auto)
		else
			agregarAdelante(arbol^.dato.lista, auto);
	end;
	
	// Inciso a
    procedure cargarArboles(var arbolP : arbol; var arbolM : arbolMarcas);
    var
        a : auto;
    begin
        arbolP := nil;
        arbolM := nil;
        leerAuto(a);
        while (a.patente <> 'zzz') do begin
            agregarArbolP(arbolP, a);
            agregarArbolM(arbolM, a);
            leerAuto(a);
        end;
    end;

    function contarCantidad(var L:lista):integer;
    var
        cant : integer;
    begin
        cant := 0;
        while (L <> nil) do begin
            cant := cant + 1;
            L:= L^.sig;
        end;
        contarCantidad := cant;
    end;
    
	// Inciso b
    function cantidadDeAutosXMarca(var a : arbolMarcas; marca : string) : integer;
    begin
        if (a = nil) then 
            cantidadDeAutosXMarca := 0
        else if(a^.dato.marca = marca) then 
            cantidadDeAutosXMarca := contarCantidad(a^.dato.lista)
        else if (marca > a^.dato.marca) then 
            cantidadDeAutosXMarca:= cantidadDeAutosXMarca(a^.HD, marca)
        else 
            cantidadDeAutosXMarca:= cantidadDeAutosXMarca(a^.HI, marca);
    end;

	// Inciso c
	procedure cantidadDeAutosXMarcaP(var a : arbol; marca : string; var cant : integer);
	begin
		if (a <> nil) then begin
			if (a^.dato.marca = marca) then
                cant := cant + 1;
            cantidadDeAutosXMarcaP(a^.HI, marca, cant);
			cantidadDeAutosXMarcaP(a^.HD, marca, cant);
		end;
	end;

    procedure agregarArbolF(var a : arbol; auto : auto);
    begin
        if (a = nil) then begin
            new(a);
            a^.dato := auto;
            a^.HI := nil;
            a^.HD := nil;
        end
        else
            if (auto.fabricacion <= a^.dato.fabricacion) then
                agregarArbolP(a^.HI, auto)
            else
                agregarArbolP(a^.HD, auto);
    end;
    
    // Inciso d
    procedure agruparPorFabricacion(var a : arbol; marca : string; var newTree : arbol);
    begin
        if (a <> nil) then begin
            agregarArbolF(newTree, a^.dato);
            agruparPorFabricacion(a^.HI, marca, newTree);
            agruparPorFabricacion(a^.HD, marca, newTree);
        end;
    end;

    procedure modeloConDichaPatente(var a : arbol; patente : string; var modelo : string);
    begin
        if(a <> nil)then begin
            if(patente = a^.dato.patente) then 
                modelo:= a^.dato.modelo
            else if(patente > a^.dato.patente)then 
                modeloConDichaPatente(a^.HD, patente, modelo)
            else
                modeloConDichaPatente(a^.HI, patente, modelo);
        end; 
    end;

    procedure recorrerLista(L : lista; patente : string; var modelo : string);
    var
        ok : boolean;
    begin
        ok := false;
        while (L <> nil) and (not ok) do begin
            if (L^.dato.patente = patente) then begin
                modelo := L^.dato.modelo;
                ok := true;
            end;
        end;
    end;

    procedure modeloConDichaPatenteM(var a : arbolMarcas; patente : string; var modelo : string);
    begin
        if(a <> nil)then begin
            recorrerLista(a^.dato.lista, patente, modelo);
            modeloConDichaPatenteM(a^.HD, patente, modelo);
            modeloConDichaPatenteM(a^.HI, patente, modelo);
        end; 
    end;

var
    arbolP, arbolF : arbol;
    arbolM : arbolMarcas;
    cant : integer;
    marca, patente, modelo : string;
begin
    cargarArboles(arbolP, arbolM);
    readln(marca);
    cant := cantidadDeAutosXMarca(arbolM, marca);
    writeln('La cantidad de autos en la agencia de la marca ', marca ,' es ', cant);
    cant := 0;
    cantidadDeAutosXMarcaP(arbolP, marca, cant);
    writeln('La cantidad de autos en la agencia de la marca ', marca ,' es ', cant);
    agruparPorFabricacion(arbolP, marca, arbolF);
    writeln('Ingrese la patente que desea saber el modelo del auto.');
    readln(patente);
    modeloConDichaPatente(arbolP, patente, modelo);
    writeln('El modelo del auto correspondiente a la patente ',patente,' es ', modelo);
    modeloConDichaPatenteM(arbolM, patente, modelo);
    writeln('El modelo del auto correspondiente a la patente ',patente,' es ', modelo);
end.
