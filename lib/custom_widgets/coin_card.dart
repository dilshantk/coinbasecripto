// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CoinCard extends StatefulWidget {
  String baseCurrency;
  String displayName;
  String lastRate;
  String change;
  Color colour;
  Function onTap;
  CoinCard(
      {required this.baseCurrency,
      required this.displayName,
      required this.lastRate,
      required this.change,
      required this.colour,
      required this.onTap});

  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15,
      ),
      child: GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          color: Colors.black,
          height: 50,
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.baseCurrency,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.displayName,
                      style: TextStyle(color: Colors.white38),
                    )
                  ],
                ),
              ),
              SizedBox(width: 110),
              SizedBox(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.lastRate,
                      style: TextStyle(
                        color: widget.colour,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.change,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
