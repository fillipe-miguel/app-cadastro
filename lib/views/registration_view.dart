import 'package:flutter/material.dart';
import 'package:ultimo_trabalho/models/person.dart';

class Registration extends StatefulWidget {

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final reasonController = TextEditingController();

  rowName(){
    return TextFormField(
        controller: nameController,
        keyboardType: TextInputType.text,
        maxLength: 50,

        validator: (value){
          if(value!.isEmpty){
            return '';
          }
        },

        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.blue[150],
          filled: true,
          labelText: 'Nome*',
        ),

      );
  }

  rowPhone(){
    return TextFormField(
      controller: ageController,
      keyboardType: TextInputType.phone,
      maxLength: 11,

      validator: (value){
        if(value!.isEmpty){
          return '';
        }
      },

      decoration: InputDecoration(
        border: InputBorder.none,
          fillColor: Colors.blue[150],
        filled: true,
        labelText: 'Telefone*',
        hintStyle: TextStyle(
          fontSize: 14,
        )
      ),

    );
  }

  rowReason(){
    return TextFormField(
      controller: reasonController,
      keyboardType: TextInputType.text,
      maxLines: 5,

      validator: (value){
        if(value!.isEmpty){
          return '';
        }
      },

      decoration: InputDecoration(
        border: InputBorder.none,
        fillColor: Colors.blue[150],
        filled: true,
        hintText: 'Diga porquê você deveria ganhar o sorteio!',
        hintStyle: TextStyle(
          fontSize: 14,
        )
      ),

    );
  }

  button(){
    return TextButton(
        onPressed: (){
          if(_formKey.currentState!.validate()){

            final person = Person(name: nameController.text, number: ageController.text, reason: reasonController.text);

            _sendSnackBar('Dados cadastrados!',600);
            _sendSnackBar('${person.toString()}',1200);
          }
          else
            _sendSnackBar('Digite todos os valores corretamente!',1500);
        },
        child: Text('Enviar!'));
  }

  _sendSnackBar(String message,int seconds) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(milliseconds: seconds),
            content: Text(message))
    );
  }

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

      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            child: Form(
              key: _formKey,
                child: Column(
                  children: [
                    rowName(),
                    rowPhone(),
                    rowReason(),
                  ],
                )
            ),
          ),
          button(),
        ],
      ),
    );
  }
}

