import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode focus;

  @override
  void initState() {
    focus = FocusNode();
    focus.addListener(_onFocusEvent);
    super.initState();
  }
  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }
  
  _onFocusEvent(){
    setState(() {
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        }, // This trailing comma makes auto-formatting nicer for build methods.
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Theme(
                      data: Theme.of(context).copyWith(
                          focusColor: Colors.red
                      ),
                      child: TextFormField(
                        focusNode: focus,
                        maxLines: 1,
                        maxLength: 20,
                        style: TextStyle(
                            color: focus.hasFocus ? Colors.red : Colors.amber
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Digite aqui",
                          labelText: "Pesquisa",
                          labelStyle: TextStyle(color: Colors.black38),
                          fillColor: Colors.white,
                          filled: true,
                          hoverColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.yellow,
                                  width: 2.0)),
                          suffixIcon: IconButton(
                              icon:Icon(
                                Icons.search,
                                color: focus.hasFocus ? Colors.red : Colors.amber,
                              ),
                              onPressed: () {

                              }),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
