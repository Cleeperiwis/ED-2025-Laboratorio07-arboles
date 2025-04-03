unit uBinaryTree;


interface
  type
    tbinaryTree = ^tnode;

    tnode = RECORD
      info: integer;
      hi, hd : tbinaryTree;
    end;

  

  // Basic methods
  procedure initialize(var a:tbinaryTree);
  function is_empty(a:tbinaryTree): boolean;
  procedure add(var a:tbinaryTree; elem: integer);
  function in_tree(a:tbinaryTree; elem: integer): boolean;

  // Traversal algorithms
  procedure preorder(a: tbinaryTree);
  procedure inorder(a: tbinaryTree);
  procedure postorder(a: tbinaryTree);

  // Other methods
  function get_hi(a:tbinaryTree): tbinaryTree;
  function get_hd(a:tbinaryTree): tbinaryTree;

  // Ejercicios 

  {Ejercicio 1.1}
  procedure inorder_inverse(a: tbinaryTree);
  
  {Ejercicio 1.2}
  function profundidad_max(a:tbinaryTree): integer;

  {Ejercicio 1.3}
  function node_count(a:tbinaryTree): integer;

  {Ejercicio 1.4}
  function leafs_count(a:tbinaryTree): integer;

  {Ejercicio 1.5}
  function internal_nodes_count(a:tbinaryTree): integer;

  {Ejercicio 1.6}
  function is_full(a:tbinaryTree): boolean;

  {Ejercicio 1.7}
  function max_hoja(a:tbinaryTree): integer;

  {Ejercicio 1.8}
  function sum_hoja(a:tbinaryTree): integer;

  {Ejercicio 1.9}
  function num_pares(a:tbinaryTree): integer;

  {Ejercicio 1.10}
  function num_nodos_en_nivel(a:tbinaryTree; nivel:integer): integer;





implementation

uses Math, SysUtils;


procedure initialize(var a:tbinaryTree);
begin
  a:= nil;
end;

function is_empty(a:tbinaryTree): boolean;
begin
  is_empty:= a=nil;
end;

function in_tree(a: tbinaryTree; elem : integer) : boolean;
begin
  if a = NIL then in_tree := FALSE
  else if a^.info = elem then in_tree := TRUE
  else in_tree := (in_tree(a^.hd, elem)) or (in_tree(a^.hi, elem))
end;


{ Este procedimiento de añadir se basa en la propiedad de los árboles binarios de búsqueda:
  el hijo izquierdo es menor que el padre y el hijo derecho es mayor que el padre. }
procedure add(var a :tbinaryTree; elem : integer);
begin
  if a = NIL then begin
    new(a);
    a^.info := elem;
    a^.hi := NIL;
    a^.hd := NIL;
  end
  else if a^.info < elem then add(a^.hd, elem)
  else if a^.info > elem then add(a^.hi, elem)
end;

procedure visit(x:integer);
begin
  writeln(x)
end;

procedure preorder(a: tbinaryTree);
begin
  if (a <> NIL) then begin
    visit(a^.info);
    preorder(a^.hi);
    preorder(a^.hd)
  end
end;

procedure inorder(a: tbinaryTree);
begin
  if (a <> NIL) then begin
    inorder(a^.hi);
    visit(a^.info);
    inorder(a^.hd)
  end
end;

procedure postorder(a: tbinaryTree);
begin
  if (a <> NIL) then begin
    postorder(a^.hi);
    postorder(a^.hd);
    visit(a^.info);
  end
end;


function get_hi(a:tbinaryTree): tbinaryTree;
begin
  if a = nil then get_hi := nil
  else get_hi:= a^.hi;
end;

function get_hd(a:tbinaryTree): tbinaryTree;
begin
  if a = nil then get_hd := nil
  else get_hd:= a^.hd;
end;

{ ---------------Ejercicio 1.1------------------ }
procedure inorder_inverse(a: tbinaryTree);
begin
  writeln('NO IMPLEMENTADO');
end;

{ ---------------Ejercicio 1.2------------------ }
function prof_max(a:tbinaryTree): integer;
begin
  if a = nil then
     prof_max := 0
  else
     prof_max := 1 + Max(prof_max(a^.hi), prof_max(a^.hd));
end;

{ ---------------Ejercicio 1.3------------------ }
function contar(a: tbinaryTree): integer;

begin

  if a = nil them
    contar := 0
  else
    contar := 1 + contar(a^.hi) + contar(a^.hd);
end;

{ ---------------Ejercicio 1.4------------------ }
function contar_hoj(a:tbinaryTree): integer;
begin
  if a = nil then
    contar_hoj := 0
  else if (a^.hi = nil) or (a^.hd = nil) then
    contar_hoj := 1
  else
    contar_hoj := contar_hoj(a^.hi) + contar_hoj(a^.hd);
end;

{ ---------------Ejercicio 1.5------------------ }
function contar_int(a:tbinaryTree): integer;
begin
  if a = nil then
    contar_int := 0
  else if (a^.hi <> nil) or (a^.hd <> nil) then
    contar_int := 1 + contar_int(a^.hi) + contar_int(a^.hd);
  else
    contar_int := 0;
end;

{ ---------------Ejercicio 1.6------------------ }
function lleno(a: tbinaryTree): boolean;
begin
  if a = nil then
    lleno := true
  else if (a^.hi = nil) and (a^.hd = nil) then
    lleno := true
  else if (a^.hi <> nil) and (a^.hd <> nil) then
    lleno := lleno(a^.hi) and lleno(a^.hd)
  else
    lleno := false;
end;

  
  { ---------------Ejercicio 1.7------------------ }
function max_hoja(a:tbinaryTree): integer;
begin
  writeln('NO IMPLEMENTADO');
end;

  
  { ---------------Ejercicio 1.8------------------ }
function sum_hoja(a:tbinaryTree): integer; 
begin
  writeln('NO IMPLEMENTADO');
end;


  { ---------------Ejercicio 1.9------------------ }
function num_pares(a:tbinaryTree): integer;
begin
  writeln('NO IMPLEMENTADO');
end;

  
    { ---------------Ejercicio 1.10------------------ }
function num_nodos_en_nivel(a:tbinaryTree; nivel:integer): integer;
begin
  writeln('NO IMPLEMENTADO');
end;


end.
