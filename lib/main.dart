import 'package:flutter/material.dart';
import 'package:flutter_states_widgets_routes/customs/itemList.dart';
import 'package:flutter_states_widgets_routes/models/Language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/":(context) => const MyApp(),)
      }
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<bool> selects = [false,false,false,false,false];
  List<Language> languages = [
    Language("Android Nativo", "Linguagens C, Java, Kotlin"),
    Language("Ionic", "Linguagens Javascript e TypeScript"),
    Language("IOS Nativo", "Linguagens Objective-C e Swift"),
    Language("Reactive Native", "Linguagens Javascript e TypeScriptn"),
  ];
  

  @override
  Widget build(BuildContext context) {

     return Scaffold(
        appBar: AppBar(
          title: const Text("Escolha de lingagens"),
        ),
        body: Column(children: [
          Wrap(spacing: 10, children: buildChoices()),
          Expanded(child: ListView(children: buildListItens()))
        ]));
  }

  List<Widget> buildChoices(){
     return languages.map((language) => ChoiceChip(
            label: Text(language.title),
                selected: language.selected,
                onSelected: (value) {
                  setState(() {
                    language.selected = value;
                  });
                }),).toList();
  }

  List<Widget> buildListItens() {
    return languages
      .where((language) => language.selected)
      .map((language) => getItemList(language.title, language.subTitle, language.icon != null ? language.icon! : Icons.blur_circular))
        .toList();
  }
}
