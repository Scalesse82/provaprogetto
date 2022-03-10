import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget {

  String title;

  SecondPage({ required this.title}) ;

  @override
  State<SecondPage> createState() => _SecondPageState();

}


class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("seconda pagina"),
      ),
      body:
      Center(

        child: Container(
          // width: 100,
          height: MediaQuery.of(context).size.height,
          //color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}