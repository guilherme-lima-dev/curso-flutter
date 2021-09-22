import 'package:bytebank/screens/lista_transferencia.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/bytebank_logo.png'),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => print('Vai para a lista de contatos'),
                    child: Container(
                      color: Colors.green[900],
                      height: 100,
                      width: 150,
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.people, color: Colors.white,),
                            Text('Contacts', style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return ListaTransferencias();
                      }
                    )),
                    child: Container(
                      color: Colors.green[900],
                      height: 100,
                      width: 150,
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.monetization_on, color: Colors.white,),
                            Text('Transferências', style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
