attack():- enemy(Xe,Ye,Weapone,Healthe), player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop),
        Xp =:= Xe, Yp tr =:= Ye, !, weapon(Weapone,Damagee), Armorp > 0, !, 
        Armornp is Armorp - Damagee, Armornp < 0, !, 
        Healthnp is Healthp + Armornp, Armornp is 0, Ammonp is Ammop - 1,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)), Healthnp > 0, !,
        assertz(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone,Healthe)), Healthne is 0, 
        assertz(enemy(Xe,Ye,Weapone,Healthne)), 
        write("Kamu menyerang musuh dan dia menyerang balik menggunakan "),
        write(Weapone), write(". Kamu terkena "), write(Damagee),
        write(" serangan. Untungnya serangan itu dapat dikurangi dengan pelindung."),
        write(" Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.").

attack():- Xp != Xe, Yp != Ye, write("Tidak ada musuh di sekelilingmu.").

attack():- Armorp < 0, Healthnp is Healthp - Damagee, Ammonp is Ammop - 1, 
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)), Healthnp > 0, !, 
        assertz(player(Xp,Yp,Healthnp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone,Healthe)), Healthne is 0, 
        assertz(enemy(Xe,Ye,Weapone,Healthne)), 
        write("Kamu menyerang musuh dan dia menyerang balik menggunakan "),
        write(Weapone), write(". Kamu terkena "), write(Damagee),
        write(" serangan."),
        write(" Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.").

attack():- Armornp > 0, Ammonp is Ammop - 1,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)),
        assertz(player(Xp,Yp,Healthp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone,Healthe)), Healthne is 0, 
        assertz(enemy(Xe,Ye,Weapone,Healthne)), 
        write("Kamu menyerang musuh dan dia menyerang balik menggunakan "),
        write(Weapone), write(". Kamu terkena "), write(Damagee),
        write(" serangan. Untungnya serangan itu dapat dikurangi dengan pelindung."),
        write(" Kamu telah membunuh musuhmu dan musuhmu meletakkan beberapa benda.").

attack():- Healthnp < 0, Healthnp is 0, Ammonp is Ammop - 1,
        retract(player(Xp,Yp,Healthp,Armorp,Weaponp,Ammop)),
        assertz(player(Xp,Yp,Healthp,Armornp,Weaponp,Ammonp)),
        retract(enemy(Xe,Ye,Weapone,Healthe)),
        write("Kamu telah mati.").

