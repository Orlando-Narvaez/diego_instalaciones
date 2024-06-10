import 'package:flutter/material.dart';
import 'package:diego_instalaciones_app/cita.dart';

class AgregarCitaPagina extends StatefulWidget {
  final Cita? cita;

  AgregarCitaPagina({this.cita});

  @override
  _AgregarCitaPaginaEstado createState() => _AgregarCitaPaginaEstado();
}

class _AgregarCitaPaginaEstado extends State<AgregarCitaPagina> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _telefono = '';
  String _placa = '';
  String _descripcion = '';
  DateTime _fechaHora = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.cita != null) {
      _nombre = widget.cita!.nombre;
      _telefono = widget.cita!.telefono;
      _placa = widget.cita!.placa;
      _descripcion = widget.cita!.descripcion;
      _fechaHora = widget.cita!.fechaHora;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cita == null ? 'Agregar Cita' : 'Modificar Cita'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _nombre,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nombre = value!;
                },
              ),
              TextFormField(
                initialValue: _telefono,
                decoration: InputDecoration(labelText: 'Teléfono'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un teléfono';
                  }
                  return null;
                },
                onSaved: (value) {
                  _telefono = value!;
                },
              ),
              TextFormField(
                initialValue: _placa,
                decoration: InputDecoration(labelText: 'Placa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa una placa';
                  }
                  return null;
                },
                onSaved: (value) {
                  _placa = value!;
                },
              ),
              TextFormField(
                initialValue: _descripcion,
                decoration: InputDecoration(labelText: 'Descripción'),
                onSaved: (value) {
                  _descripcion = value!;
                },
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Fecha: ${_fechaHora.toLocal()}'.split(' ')[0]),
                trailing: Icon(Icons.calendar_today),
                onTap: _seleccionarFecha,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final nuevaCita = Cita(
                      nombre: _nombre,
                      telefono: _telefono,
                      placa: _placa,
                      descripcion: _descripcion,
                      fechaHora: _fechaHora,
                    );
                    Navigator.pop(context, nuevaCita);
                  }
                },
                child: Text(widget.cita == null ? 'Guardar' : 'Modificar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _seleccionarFecha() async {
    DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: _fechaHora,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (fechaSeleccionada != null && fechaSeleccionada != _fechaHora) {
      setState(() {
        _fechaHora = fechaSeleccionada;
      });
    }
  }
}
