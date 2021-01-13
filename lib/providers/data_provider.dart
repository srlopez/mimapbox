import 'package:flutter/material.dart';
import '../controllers/data_controller.dart';

class Marca {
  String nombre;
  final double latitud;
  final double longitud;
  Marca(this.nombre, this.latitud, this.longitud);
}

class Data with ChangeNotifier {
  // Controlador para almacenar localmnet la lista
  DataController controller;

  // Capturados en geolocator
  List<Marca> marcas = <Marca>[];
  bool forzarRepintado = false;
  bool marcasVisibles = false;

  Data({this.controller}) {
    controller.getAll().then((value) => marcas = value);
  }

  void add(double lat, double long) async {
    var nombre = lat.toStringAsPrecision(9).substring(4);
    var data = Marca(nombre, lat, long);
    marcas.add(data);
    controller.save(data);
    notifyListeners();
  }

  void deleteAll() {
    marcas.clear();
    saveAll();
  }

  void saveAll() {
    controller.saveAll();
    forzarRepintado = true;
    notifyListeners();
  }

  void deleteAt(int index) {
    marcas.removeAt(index);
    forzarRepintado = true;
    notifyListeners();
  }
}
