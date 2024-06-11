import 'package:flutter/material.dart';

class Cita {
  String empresa;
  String nombre;
  String telefono;
  String placa;
  String descripcion;
  DateTime fechaHora;
  String lugar;
  TimeOfDay hora;

  Cita({
    required this.empresa,
    required this.nombre,
    required this.telefono,
    required this.placa,
    required this.descripcion,
    required this.fechaHora,
    required this.lugar,
    required this.hora,
  });
}
