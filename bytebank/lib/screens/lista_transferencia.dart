import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario_transferencia.dart';

class ListaTransferencias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  final List<Transferencia> _transferencias = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return Dismissible(

            direction: DismissDirection.startToEnd,

            key: Key(transferencia.numeroConta.toString()),

            onDismissed: (direction) {
              setState(() {
                _transferencias.removeAt(indice);
              });

              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('Transferencia excuida! Conta: ${transferencia.numeroConta}')));
            },

            background: Container(
                color: Colors.redAccent,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Icon(
                          Icons.delete_forever_sharp,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.delete_forever_sharp,
                      ),
                    ),
                  ]
                ),
            ),
            child: ItemTransferencia(transferencia)
          );

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final transferenciaRecebida = await  Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));

          if(transferenciaRecebida != null){
            setState(() {
              _transferencias.add(transferenciaRecebida);
            });
          }
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
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        )
    );
  }
}