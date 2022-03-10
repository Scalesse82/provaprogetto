import 'package:flutter/material.dart';
import 'secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'peppe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String? testo;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  final controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    //_counter++;
    print("-----------------contatore :$_counter");
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          // width: 100,
          height: MediaQuery.of(context).size.height,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Form(
            key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: TextFormField(
                    validator: (value){
                      if(value==null||value==""){
                        return "";
                      }
                      return null;

                    },
                    decoration:  InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red)
                      ),
                      enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.green)
                      ) ,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.blue)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: BorderSide(color: Colors.green)
                      ),
                      prefixIcon: Icon(Icons.add),
                      //prefix: Icon(Icons.add)


                    ),
                    controller: controller,
                    onChanged: (dio) {
                      testo = dio;
                      setState(() {});
                      _formKey.currentState!.validate();
                      print("testo: $testo");
                    },

                  ),
                ),
              ),
               const Text(
                'You have pushed the button this many:',
                style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orangeAccent,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                _counter.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: testo == null || testo =="" ? Colors.blue : Colors.green,
        onPressed: () {
          if(_formKey.currentState!.validate())
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(
                              title: testo!,
                            )));
              },
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
