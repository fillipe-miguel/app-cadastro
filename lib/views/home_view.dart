import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text('Cadastro do sorteio'),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('../assets/images/sorteio.png'),
          ),
          Container(
            height: 80,
          ),
          Container(
            width: 200,
            height: 100,
            child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pushNamed("/registration");
                },
                child: Text('Cadastrar',style: TextStyle(fontSize: 25),)),
          )

        ],
      ),
    );
  }
}
