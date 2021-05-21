import 'dart:convert';
import 'package:flutter/cupertino.dart';

class Proizvodi {
    int proizvodId;
    final String naziv;
    final String cijena;
    final String slika;

    Proizvodi({
        this.naziv,
        this.cijena,
        this.slika
    });
    
    factory Proizvodi.fromJson(Map<String, dynamic> json){
        return Proizvodi(
        naziv: json["naziv"],
        cijena: json["cijena"].toString(),
        slika: json["slika"]
        );
    }

    Map<String, dynamic> toJson() => {
        "naziv": naziv,
        "cijena": cijena,
        "slika":slika
    };
}
