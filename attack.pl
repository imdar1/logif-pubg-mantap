attack  :- enemy(Xe,Ye,Weapone), player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop),
        Xp =:= Xe, Yp tr =:= Ye, !, weapon(X,Y,Weapone,Damagee), 
        Ammop > 0, !, Ammonp is Ammop - 1,
        Armorp > 0, !, Armornp is Armorp - Damagee, Armornp < 0, !, 
        Healthnp is Healthp + Armornp, Armornp is 0,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)), Healthnp > 0, !,
        assertz(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone)), Xne is 1, Yne is 1, 
        assertz(enemy(Xne,Yne,Weapone)), 
        write("Kamu menyerang musuh dan dia menyerang balik menggunakan "),
        write(Weapone), write(". Kamu terkena "), write(Damagee),
        write(" serangan. Untungnya serangan itu dapat dikurangi dengan pelindung."),
        write(" Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.").

attack  :- Xp =/= Xe, Yp =/= Ye, write("Tidak ada musuh di sekelilingmu."), nl.

attack  :- Ammop =:= 0, write("Pelurumu habis! Silahkan cari peluru dulu."), nl.

attack  :- Armorp =:= 0, Healthnp is Healthp - Damagee,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)), Healthnp > 0, !, 
        assertz(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone)), Xne is 1, Yne is 1, 
        assertz(enemy(Xne,Yne,Weapone)), 
        write("Kamu menyerang musuh dan dia menyerang balik menggunakan "),
        write(Weapone), write(". Kamu terkena "), write(Damagee),
        write(" serangan."),
        write(" Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.").

attack  :- Armornp > 0,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)),
        assertz(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone)), Xne is 1, Yne is 1, 
        assertz(enemy(Xne,Yne,Weapone)), 
        write("Kamu menyerang musuh dan dia menyerang balik menggunakan "),
        write(Weapone), write(". Kamu terkena "), write(Damagee),
        write(" serangan. Untungnya serangan itu dapat dikurangi dengan pelindung."),
        write(" Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.").

attack  :- Healthnp <= 0, Healthnp is 0, Ammonp is Ammop - 1,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)),
        assertz(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        write("Kamu telah mati.").

