import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:crip/src/provider/id.dart';

class View extends StatelessWidget {
  final String texto;
  const View(this.texto, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criptomonedas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyView(title: 'ver'),
    );
  }
}

class MyView extends StatefulWidget {
  const MyView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyView> createState() => _MyView();
}

class _MyView extends State<MyView> {
  late List cripto;
  late Map data;

  Getcripto() async {
    //http.Response res = await http.post(url);

    //data = jsonDecode(res.body);
    // setState(() {
    //cripto = data['symbol' 'name' 'price_usd' 'percent_change_24h'];
    //cripto = data['data'];
    // });

    // debugPrint(cripto.toString());
  }

  @override
  onPressed() async {}
  @override
  void initState() {
    super.initState();

    // final infoo = Provider.of<info>(context);
    //debugPrint(infoo.ID.toString());
    //var url = Uri.parse(
    // 'https://api.coinlore.net/api/ticker/?id=' + infoo.ID.toString());
    //debugPrint(url.toString());
  }

  @override
  Widget build(BuildContext context) {
    final Info = Provider.of<info>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(Info.symbol.toString()),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.topCenter,
              child: Align(
                //or choose another Alignment
                child: SizedBox(
                  width: MediaQuery.of(context).size.width *
                      0.3, //you sure it should be 0.001?
                  height: MediaQuery.of(context).size.height * 1.1,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: Column(
                        children: [
                          Align(
                            child: ListTile(
                              leading: Icon(Icons.arrow_drop_down_circle),
                              title: Text(Info.name.toString(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Roboto',
                                    fontSize: 50,
                                  )),
                              subtitle: Text(
                                'Rank : ' + Info.rank.toString(),
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'Precio : ' + Info.price_usd.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'Cambio del precio en 1h : ' +
                                  Info.percent_change_1h.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'Cambio del precio en 24h : ' +
                                  Info.percent_change_24h.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'Cambio del precio en 7d : ' +
                                  Info.percent_change_24h.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'volume24 : ' + Info.volume24.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'volume24a : ' + Info.volume24.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'csupply : ' + Info.csupply.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'tsupply : ' + Info.tsupply.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          ListTile(
                            subtitle: Text(
                              'msupply : ' + Info.msupply.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
