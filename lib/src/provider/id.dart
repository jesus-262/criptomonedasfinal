import 'package:flutter/material.dart';

class info extends ChangeNotifier {
  String _ID = '';
  String _symbol = '';
  String _name = '';
  String _nameid = '';
  String _rank = '';
  String _price_usd = '';
  String _percent_change_24h = '';
  String _percent_change_1h = '';
  String _percent_change_7d = '';
  String _price_btc = '';
  String _market_cap_usd = '';
  String _volume24 = '';
  String _volume24a = '';
  String _csupply = '';
  String _tsupply = '';
  String _msupply = '';
  String _color = '';
  Color colorbase = Colors.red;
//getter
  String get ID {
    return _ID;
  }

  String get symbol {
    return _symbol;
  }

  String get name {
    return _name;
  }

  String get nameid {
    return _nameid;
  }

  String get rank {
    return _rank;
  }

  String get price_usd {
    return _price_usd;
  }

  String get percent_change_24h {
    return _percent_change_24h;
  }

  String get percent_change_1h {
    return _percent_change_1h;
  }

  String get percent_change_7d {
    return _percent_change_7d;
  }

  String get price_btc {
    return _price_btc;
  }

  String get market_cap_usd {
    return _market_cap_usd;
  }

  String get volume24 {
    return _volume24;
  }

  String get volume24a {
    return _volume24a;
  }

  String get csupply {
    return _csupply;
  }

  String get tsupply {
    return _tsupply;
  }

  String get msupply {
    return _msupply;
  }

  String get color {
    return _color;
  }

  //setter
  set ID(String numero) {
    this._ID = numero;
    notifyListeners();
  }

  set symbol(String numero) {
    this._symbol = numero;
    notifyListeners();
  }

  set name(String numero) {
    this._name = numero;
    notifyListeners();
  }

  set nameid(String numero) {
    this._nameid = numero;
    notifyListeners();
  }

  set rank(String numero) {
    this._rank = numero;
    notifyListeners();
  }

  set price_usd(String numero) {
    this._price_usd = numero;
    notifyListeners();
  }

  set percent_change_24h(String numero) {
    this._percent_change_24h = numero;
    notifyListeners();
  }

  set percent_change_1h(String numero) {
    this._percent_change_1h = numero;
    notifyListeners();
  }

  set percent_change_7d(String numero) {
    this._percent_change_7d = numero;
    notifyListeners();
  }

  set price_btc(String numero) {
    this._price_btc = numero;
    notifyListeners();
  }

  set market_cap_usd(String numero) {
    this._market_cap_usd = numero;
    notifyListeners();
  }

  set volume24(String numero) {
    this._volume24 = numero;
    notifyListeners();
  }

  set volume24a(String numero) {
    this._volume24a = numero;
    notifyListeners();
  }

  set csupply(String numero) {
    this._csupply = numero;
    notifyListeners();
  }

  set tsupply(String numero) {
    this._tsupply = numero;
    notifyListeners();
  }

  set msupply(String numero) {
    this._msupply = numero;
    notifyListeners();
  }

  set color(String numero) {
    this._color = numero;
    var num = double.parse(this._color);
    if (num > 0) {
      this.colorbase = Colors.green;
    }
    notifyListeners();
  }
}
