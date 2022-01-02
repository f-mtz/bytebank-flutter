import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebBankApp());

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorNumeroDaConta = TextEditingController();
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
          Padding(

            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorNumeroDaConta,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '0000',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorValor,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),

          RaisedButton(
            onPressed: () {
              final int? numeroConta = int.tryParse(_controladorNumeroDaConta.text);
              final double? valor = double.tryParse(_controladorValor.text);

              if(numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                // debugPrint('$transferenciaCriada');
              }

            },
            child: Text('Confirmar'),
          ),
        ],
      ),
    );
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
        onPressed: () {},
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
        body: FormularioTransferencia(),
      ),
    );
  }
}
