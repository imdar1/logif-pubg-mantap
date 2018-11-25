savef(Namafile):-
    
    open(Namafile, write, Stream),

    player(Xp,Yp,Health,Armor,Weaponp,Ammo),
    cfield(AreaDaerahDanger),
    move(JumlahMoveDilakukan),
    inventory(ListInventory),
    object(Xe,Ye,Namao),

    write(Stream, Xp), write(Stream, '.'), nl(Stream),
    write(Stream, Yp), write(Stream, '.'), nl(Stream),
    write(Stream, Health), write(Stream, '.'), nl(Stream),
    write(Stream, Armor), write(Stream, '.'), nl(Stream),
    write(Stream, Weaponp), write(Stream, '.'), nl(Stream),
    write(Stream, AreaDaerahDanger), write(Stream, '.'), nl(Stream),
    write(Stream, JumlahMoveDilakukan), write(Stream, '.'), nl(Stream),
    write(Stream, ListInventory), write(Stream, '.'), nl(Stream),
    write(Stream, Xe), write(Stream, '.'), nl(Stream),
    write(Stream, Ye), write(Stream, '.'), nl(Stream),
    write(Stream, Namao), write(Stream, '.'), nl(Stream),

    write("suds bro"), nl,
    close(Stream).

loadf(Namafile):-
    open(Namafile, read, Stream),

    player(Xp,Yp,Health,Armor,Weaponp,Ammo),
    cfield(AreaDaerahDanger),
    move(JumlahMoveDilakukan),
    inventory(ListInventory),
    object(Xe,Ye,Namao),

    retract(player(Xp,Yp,Health,Armor,Weaponp,Ammo)),
    retract(cfield(AreaDaerahDanger)),
    retract(move(JumlahMoveDilakukan)),
    retract(inventory(ListInventory)),
    retract(object(Xe,Ye,Namao)),

    read(Stream, Xp), 
    read(Stream, Yp), 
    read(Stream, Health), 
    read(Stream, Armor), 
    read(Stream, Weaponp), 
    read(Stream, AreaDaerahDanger), 
    read(Stream, JumlahMoveDilakukan), 
    read(Stream, ListInventory), 
    read(Stream, Xe), 
    read(Stream, Ye), 
    read(Stream, Namao), 

    asserta(player(Xp,Yp,Health,Armor,Weaponp,Ammo)),
    asserta(cfield(AreaDaerahDanger)),
    asserta(move(JumlahMoveDilakukan)),
    asserta(inventory(ListInventory)),
    asserta(object(Xe,Ye,Namao)),