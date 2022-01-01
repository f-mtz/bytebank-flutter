import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    body: ListaTransferencias(),
    appBar: AppBar(title: Text('Transferências'),),
    floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
    ),
  ),
));

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ItemTransferencia(Transferencia(100.0, 1001)),
        ItemTransferencia(Transferencia(300.0, 1002)),
        ItemTransferencia(Transferencia(600.0, 1003))
      ],
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
}