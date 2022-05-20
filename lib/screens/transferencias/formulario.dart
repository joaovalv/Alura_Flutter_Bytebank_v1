import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/Editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloConta = 'Número da Conta';
const _valorPadraoConta = '0000';
const _rotuloValorTransferencia = 'Valor da Transferência';
const _valorPadraoValorTransferencia = '0.00';
const _textoBotaoConfirmarTransferencia = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValorTransferencia =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controlador: _controladorCampoNumeroConta,
                rotulo: _rotuloConta,
                valorPadrao: _valorPadraoConta),
            Editor(
                controlador: _controladorCampoValorTransferencia,
                rotulo: _rotuloValorTransferencia,
                valorPadrao: _valorPadraoValorTransferencia,
                icone: Icons.monetization_on),
            ElevatedButton(
              child: Text(_textoBotaoConfirmarTransferencia),
              onPressed: () => _realizaTranferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _realizaTranferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valorTransferencia =
        double.tryParse(_controladorCampoValorTransferencia.text);
    if (numeroConta != null && valorTransferencia != null) {
      final transferenciaCriada =
          Transferencia(valorTransferencia, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
