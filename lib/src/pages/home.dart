import 'package:crip/src/pages/view.dart';
import 'package:crip/src/provider/id.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criptomonedas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lista de Criptomonedas'),
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
  late Map data;
  //var List cripto;
  var cripto = [];

  @override
  void initState() {
    super.initState();

    this.Getcripto();
  }

  Getcripto() async {
    var url = Uri.parse('https://api.coinlore.net/api/tickers/');
    http.Response res = await http.get(url);

    data = await jsonDecode(res.body);
    setState(() {
      //cripto = data['symbol' 'name' 'price_usd' 'percent_change_24h'];
      cripto = data['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final Info = Provider.of<info>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
          itemCount: cripto == null ? 0 : cripto.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.topCenter,
              child: Align(
                //or choose another Alignment
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.58, //you sure it should be 0.001?
                  height: MediaQuery.of(context).size.height * 0.17,
                  child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(15),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 20, 10, 5),
                                  child: Text("${cripto[index]['symbol']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Roboto',
                                        fontSize: 25,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text("${cripto[index]['name']}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                      )),
                                ),
                              ],
                            ),
                          ),

                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
                            // ignore: prefer_const_constructors
                            child: Text(
                              "Precio actual ",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4.0, vertical: 4.0),
                            child: Text("${cripto[index]['price_usd']}",
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                )),
                          ),
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
                            // ignore: prefer_const_constructors
                            child: Text(
                              " El cambio en las 24h  ",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child:
                                Text("${cripto[index]['percent_change_24h']}",
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800,
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                    )),
                          ),

                          Container(
                            child: Expanded(
                              child: Center(
                                child: FloatingActionButton(
                                  backgroundColor: Colors.blue,
                                  onPressed: () async {
                                    Info.ID = "${cripto[index]['id']}";
                                    Info.symbol = "${cripto[index]['symbol']}";
                                    Info.name = "${cripto[index]['name']}";
                                    Info.nameid = "${cripto[index]['nameid']}";
                                    Info.rank = "${cripto[index]['rank']}";
                                    Info.price_usd =
                                        "${cripto[index]['price_usd']}";
                                    Info.percent_change_24h =
                                        "${cripto[index]['percent_change_24h']}";
                                    Info.percent_change_1h =
                                        "${cripto[index]['percent_change_1h']}";
                                    Info.percent_change_7d =
                                        "${cripto[index]['percent_change_7d']}";
                                    Info.price_btc =
                                        "${cripto[index]['price_btc']}";
                                    Info.market_cap_usd =
                                        "${cripto[index]['market_cap_usd']}";
                                    Info.volume24 =
                                        "${cripto[index]['volume24']}";
                                    Info.volume24a =
                                        "${cripto[index]['volume24a']}";
                                    Info.csupply =
                                        "${cripto[index]['csupply']}";
                                    Info.tsupply =
                                        "${cripto[index]['tsupply']}";
                                    Info.msupply =
                                        "${cripto[index]['msupply']}";
                                    Info.color =
                                        "${cripto[index]['percent_change_24h']}";

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => View(
                                                "${cripto[index]['id']}")));
                                  },
                                  child: Text("Ver mas",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Roboto',
                                        fontSize: 10,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            );
          }),
    );
  }
}
