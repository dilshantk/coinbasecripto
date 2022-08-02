import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataProvider extends ChangeNotifier {
  List productsList = [];
  List usdtproductsList = [];
  List eurproductsList = [];
  List btcproductsList = [];
  List gbpproductsList = [];
  List ethproductsList = [];

  Future fetchTrendingMovieData() async {
    var response =
        await http.get(Uri.parse("https://api.exchange.coinbase.com/products"));
    var jsonData = json.decode(response.body);
    productsList = jsonData.where((e) => e['quote_currency'] == 'USD').toList();

    for (int i = 0; i < productsList.length; i++) {
      try {
        var response = await http.get(Uri.parse(
            'https://api.exchange.coinbase.com/products/${productsList[i]['id']}/stats'));
        var jsonData = json.decode(response.body);
        productsList[i]['stats'] = jsonData;
      } catch (e) {
        print(e);
      }
    }
    notifyListeners();
  }

  Future fetchUSDTTrendingMovieData() async {
    var response =
        await http.get(Uri.parse("https://api.exchange.coinbase.com/products"));
    var jsonData = json.decode(response.body);
    usdtproductsList =
        jsonData.where((e) => e['quote_currency'] == 'USDT').toList();

    for (int i = 0; i < usdtproductsList.length; i++) {
      try {
        var response = await http.get(Uri.parse(
            'https://api.exchange.coinbase.com/products/${usdtproductsList[i]['id']}/stats'));
        var jsonData = json.decode(response.body);
        usdtproductsList[i]['stats'] = jsonData;
      } catch (e) {
        print(e);
      }
    }
    notifyListeners();
  }

  Future fetchEURTrendingMovieData() async {
    var response =
        await http.get(Uri.parse("https://api.exchange.coinbase.com/products"));
    var jsonData = json.decode(response.body);
    eurproductsList =
        jsonData.where((e) => e['quote_currency'] == 'EUR').toList();

    for (int i = 0; i < eurproductsList.length; i++) {
      try {
        var response = await http.get(Uri.parse(
            'https://api.exchange.coinbase.com/products/${eurproductsList[i]['id']}/stats'));
        var jsonData = json.decode(response.body);
        eurproductsList[i]['stats'] = jsonData;
      } catch (e) {
        print(e);
      }
    }
    notifyListeners();
  }

  Future fetchBTCTrendingMovieData() async {
    var response =
        await http.get(Uri.parse("https://api.exchange.coinbase.com/products"));
    var jsonData = json.decode(response.body);
    btcproductsList =
        jsonData.where((e) => e['quote_currency'] == 'BTC').toList();

    for (int i = 0; i < btcproductsList.length; i++) {
      try {
        var response = await http.get(Uri.parse(
            'https://api.exchange.coinbase.com/products/${btcproductsList[i]['id']}/stats'));
        var jsonData = json.decode(response.body);
        btcproductsList[i]['stats'] = jsonData;
      } catch (e) {
        print(e);
      }
    }
    notifyListeners();
  }

  Future fetchGBPTrendingMovieData() async {
    var response =
        await http.get(Uri.parse("https://api.exchange.coinbase.com/products"));
    var jsonData = json.decode(response.body);
    gbpproductsList =
        jsonData.where((e) => e['quote_currency'] == 'GBP').toList();

    for (int i = 0; i < gbpproductsList.length; i++) {
      try {
        var response = await http.get(Uri.parse(
            'https://api.exchange.coinbase.com/products/${gbpproductsList[i]['id']}/stats'));
        var jsonData = json.decode(response.body);
        gbpproductsList[i]['stats'] = jsonData;
      } catch (e) {
        print(e);
      }
    }
    notifyListeners();
  }

  Future fetchETHTrendingMovieData() async {
    var response =
        await http.get(Uri.parse("https://api.exchange.coinbase.com/products"));
    var jsonData = json.decode(response.body);
    ethproductsList =
        jsonData.where((e) => e['quote_currency'] == 'ETH').toList();

    for (int i = 0; i < ethproductsList.length; i++) {
      try {
        var response = await http.get(Uri.parse(
            'https://api.exchange.coinbase.com/products/${ethproductsList[i]['id']}/stats'));
        var jsonData = json.decode(response.body);
        ethproductsList[i]['stats'] = jsonData;
      } catch (e) {
        print(e);
      }
    }
    notifyListeners();
  }
}
