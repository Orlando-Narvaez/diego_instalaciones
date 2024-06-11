import 'package:flutter/material.dart';
import 'package:diego_instalaciones_app/agregar_cita.dart';
import 'package:diego_instalaciones_app/cita.dart';

class PaginaCitas extends StatefulWidget {
  @override
  _PaginaCitasEstado createState() => _PaginaCitasEstado();
}

class _PaginaCitasEstado extends State<PaginaCitas> {
  List<Cita> citas = [];
  Cita? _citaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestionar Citas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: citas.isEmpty
                ? Center(child: Text('No hay citas.'))
                : ListView.builder(
                    itemCount: citas.length,
                    itemBuilder: (context, index) {
                      final cita = citas[index];
                      return ListTile(
                        title: Text(cita.nombre),
                        subtitle: Text(
                          'Empresa: ${cita.empresa}\n' +
                          '${cita.fechaHora.toLocal()}'.split(' ')[0] +
                          ' - ' + 
                          cita.descripcion + '\n' + 
                          'Lugar: ' + cita.lugar + '\n' +
                          'Hora: ' + cita.hora.format(context)
                        ),
                        onTap: () {
                          setState(() {
                            _citaSeleccionada = cita;
                          });
                        },
                      );
                    },
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final nuevaCita = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AgregarCitaPagina()),
                  );

                  if (nuevaCita != null) {
                    setState(() {
                      citas.add(nuevaCita);
                    });
                  }
                },
                child: Text('Nueva cita'),
              ),
              ElevatedButton(
                onPressed: _citaSeleccionada == null ? null : () async {
                  final citaModificada = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgregarCitaPagina(cita: _citaSeleccionada),
                    ),
                  );

                  if (citaModificada != null) {
                    setState(() {
                      int index = citas.indexOf(_citaSeleccionada!);
                      citas[index] = citaModificada;
                      _citaSeleccionada = null;
                    });
                  }
                },
                child: Text('Modificar cita'),
              ),
              ElevatedButton(
                onPressed: _citaSeleccionada == null ? null : () {
                  setState(() {
                    citas.remove(_citaSeleccionada);
                    _citaSeleccionada = null;
                  });
                },
                child: Text('Eliminar cita'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
