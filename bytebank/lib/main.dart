import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());


class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}


class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controllerFieldNumeroConta = TextEditingController();
  final TextEditingController _controllerFieldValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando transferência'),
        ),
        body: Column(
          children: [
            
            Editor(controlador: _controllerFieldNumeroConta, rotulo: 'Numero da conta:', dica: '0000'),
            Editor(controlador: _controllerFieldValor, rotulo: 'Valor:', dica: '0.00', icone: Icons.monetization_on),

            ElevatedButton(
                onPressed: () => _criaTransferencia(),
                child: Text("Cadastrar")
            )
          ],
        )
    );
  }

  void _criaTransferencia() {
    final int? numeroConta = int.tryParse(this._controllerFieldNumeroConta.text);
    final double? valor = double.tryParse(this._controllerFieldValor.text);
    if(numeroConta != null && valor != null){
      final transferencia = Transferencia(valor, numeroConta);
      debugPrint('$transferencia');
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  const Editor({required this.controlador, required this.rotulo, required this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
            fontSize: 16.0
        ),
        decoration: InputDecoration(
            labelText: rotulo,
            hintText: dica,
            icon: icone != null ? Icon(icone) : null
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}



class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 2000)),
          ItemTransferencia(Transferencia(300.0, 3000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { print("PRESS"); },
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
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}