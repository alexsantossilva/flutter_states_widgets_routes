import 'package:flutter/material.dart';
import 'package:flutter_states_widgets_routes/models/Language.dart';

class MyWidget extends StatelessWidget {
  MyWidget({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.all(16);

    return Scaffold(
      appBar: AppBar(title: const Text("Nova Linguagem")),
      body: Padding(
        padding: padding,
        child: Form( 
          key: _formkey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Digite a Linguagem",
                labelText: "Digite a Linguagem",
              ),
              controller: _titleController,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Insira o nome da linguagem";
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Digite a descrição",
                labelText: "Digite a descrição",
              ),
              controller: _subTitleController,
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Insira a descrição da linguagem";
                }
                return null;
              },
            ),
            Padding(
              padding: padding,
              child: ElevatedButton(
                child: const Text("Gravar"),
                onPressed: (){
                  if(_formkey.currentState!.validate()){
                    Language language = Language(
                        _titleController.text, _subTitleController.text);
                        Navigator.pop(context, language);
                  }
                },))
          ]),
        ),
      ),
    );
  }
}