import 'dart:async';
import 'package:cripto/home_page.dart';
import 'package:cripto/providers/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.fetchTrendingMovieData();
    dataProvider.fetchBTCTrendingMovieData();
    dataProvider.fetchETHTrendingMovieData();
    dataProvider.fetchEURTrendingMovieData();
    dataProvider.fetchGBPTrendingMovieData();
    dataProvider.fetchUSDTTrendingMovieData();
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
