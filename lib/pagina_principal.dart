import 'package:flutter/material.dart';
import 'package:diego_instalaciones_app/pagina_citas.dart';

class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diego Instalaciones App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaginaCitas()),
            );
          },
          child: Text('Gestionar Citas'),
        ),
      ),
    );
  }
}
