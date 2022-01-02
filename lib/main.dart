import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebBankApp());

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorNumeroDaConta =
      TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: [
          Editor(
              controlador: _controladorNumeroDaConta,
              rotulo: 'Número da Conta',
              dica: '0000',),
              // icone: Icons.person),
          Editor(
              controlador: _controladorValor,
              rotulo: 'Value',
              dica: '0000',
              icone: Icons.monetization_on),
          RaisedButton(
            onPressed: () {
              _criaTransferencia(context);
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta =
        int.tryParse(_controladorNumeroDaConta.text);
    final double? valor = double.tryParse(_controladorValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      // debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.0, 1001)),
          ItemTransferencia(Transferencia(300.0, 1002)),
          ItemTransferencia(Transferencia(600.0, 1003))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future respostaAssincrona = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          
          respostaAssincrona.then((transferenciaRecebida) {
            debugPrint('$transferenciaRecebida');
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroDaConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroDaConta;

  Transferencia(this.valor, this.numeroDaConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroDaConta: $numeroDaConta}';
  }
}

class BytebBankApp extends StatelessWidget {
  const BytebBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  Editor(
      {required this.controlador,
      required this.rotulo,
      required this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
