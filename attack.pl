attack():- enemy(Xe,Ye,Weapone,Healthe), player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop),
        Xp =:= Xe, Yp =:= Ye, !,
        Ammop > 0, !, 
        Ammonp is Ammop - 1, 
        weapon(Weapone,Damagee), 
        Armorp > 0, !, 
        Armornp is Armorp - Damagee, 
        Armornp < 0, !, 
        Healthnp is Healthp + Armornp, 
        Armornp is 0,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)), 
        Healthnp > 0, !, 
        assert(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone,Healthe)), Healthne is 0, 
        assert(enemy(Xe,Ye,Weapone,Healthne)), 
        write("Kamu menyerang musuh dan dia menyerang balik menggunakan "),
        write(Weapone), write(". Kamu terkena "), write(Damagee),
        write(" serangan. Untungnya serangan itu dapat dikurangi dengan pelindung."),
        write(" Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda."), nl.

attack():- Xp != Xe, Yp != Ye, write("Tidak ada musuh di sekelilingmu."), nl.

attack():- Ammop = 0, write("Pelurumu habis. Silahkan cari peluru dahulu."), nl.

attack():- Armorp = 0, Healthnp is Healthp - Damagee, 
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)),
        Healthnp > 0, !, 
        assert(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone,Healthe)), 
        Healthne is 0, 
        assert(enemy(Xe,Ye,Weapone,Healthne)), 
        write("Kamu menyerang musuh dan dia menyerang balik menggunakan "),
        write(Weapone), write(". Kamu terkena "), write(Damagee),
        write(" serangan."),
        write(" Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda."), nl.

attack():- Armornp > 0,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)),
        assert(player(Xp,Yp,Healthp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone,Healthe)), Healthne is 0, 
        assert(enemy(Xe,Ye,Weapone,Healthne)), 
        write("Kamu menyerang musuh dan dia menyerang balik menggunakan "),
        write(Weapone), write(". Kamu terkena "), write(Damagee),
        write(" serangan. Untungnya serangan itu dapat dikurangi dengan pelindung."),
        write(" Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda."), nl.

attack():- Healthnp < 0, Healthnp is 0, Ammonp is Ammop - 1,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)),
        assert(player(Xp,Yp,Healthp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone,Healthe)),
        write("Kamu telah mati."), nl.

