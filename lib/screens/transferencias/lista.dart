import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _listaTransferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
          itemCount: widget._listaTransferencias.length,
          itemBuilder: (context, indice) {
            final transferenciaAdicionada = widget._listaTransferencias[indice];
            return ItemTransferencia(transferenciaAdicionada);
          }),
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then(
            (transferenciaRealizada) =>
                _atualizaListaTransferencias(transferenciaRealizada),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualizaListaTransferencias(Transferencia? transferenciaRealizada) {
    if (transferenciaRealizada != null) {
      setState(() {
        widget._listaTransferencias.add(transferenciaRealizada);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
