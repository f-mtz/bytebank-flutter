import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _dica = '0000';
const _rotuloCampoConta = 'Número da Conta';
const _nomeBotao = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorNumeroDaConta =
  TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorNumeroDaConta,
              rotulo: _rotuloCampoConta,
              dica: _dica,
            ),
            // icone: Icons.person),
            Editor(
                controlador: _controladorValor,
                rotulo: _rotuloCampoValor,
                dica: _dica,
                icone: Icons.monetization_on),
            RaisedButton(
              onPressed: () {
                _criaTransferencia(context);
              },
              child: Text(_nomeBotao),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorNumeroDaConta.text);
    final double? valor = double.tryParse(_controladorValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      // debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
