import 'package:cripto/custom_widgets/coin_card.dart';
import 'package:cripto/providers/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    var dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.fetchTrendingMovieData();
    dataProvider.fetchBTCTrendingMovieData();
    dataProvider.fetchETHTrendingMovieData();
    dataProvider.fetchEURTrendingMovieData();
    dataProvider.fetchGBPTrendingMovieData();
    dataProvider.fetchUSDTTrendingMovieData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<DataProvider>(context);
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            title: Container(
              height: 60,
              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: GestureDetector(
                      onTap: () {
                        // launchUrl(Uri.parse(
                        //     'https://pro.coinbase.com/trade/RAD-BTC'));
                      },
                      child: const Text(
                        'Marketwatch',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: "USD",
                ),
                Tab(
                  text: "EUR",
                ),
                Tab(
                  text: "BTC",
                ),
                Tab(
                  text: "GBP",
                ),
                Tab(
                  text: "ETH",
                ),
                Tab(
                  text: "USDT",
                )
              ],
              isScrollable: true,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataProvider.productsList.length,
                    itemBuilder: (context, index) {
                      if (dataProvider.productsList[index] == null) {
                        return const SizedBox();
                      } else {
                        double changeRate = double.parse(
                                dataProvider.productsList[index]['stats'] ==
                                        null
                                    ? '0'
                                    : dataProvider.productsList[index]['stats']
                                            ['last'] ??
                                        '0') -
                            double.parse(dataProvider.productsList[index]
                                        ['stats'] ==
                                    null
                                ? '0'
                                : dataProvider.productsList[index]['stats']
                                        ['open'] ??
                                    '0');
                        Color colour =
                            changeRate > 0 ? Colors.green : Colors.red;
                        String change = changeRate.toStringAsFixed(4);
                        return Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              CoinCard(
                                baseCurrency: dataProvider.productsList[index]
                                        ['base_currency'] ??
                                    '',
                                displayName: dataProvider.productsList[index]
                                        ['display_name'] ??
                                    '',
                                lastRate: dataProvider.productsList[index]
                                            ['stats'] ==
                                        null
                                    ? 'No Data'
                                    : dataProvider.productsList[index]['stats']
                                            ['last'] ??
                                        'No Data',
                                change: change,
                                colour: colour,
                                onTap: () async {
                                  launchUrl(Uri.parse(
                                      'https://pro.coinbase.com/trade/${dataProvider.productsList[index]['id']}'));
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 1,
                              )
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
            ListView(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataProvider.eurproductsList.length,
                    itemBuilder: (context, index) {
                      if (dataProvider.eurproductsList[index] == null) {
                        return SizedBox();
                      } else {
                        double changeRate = double.parse(
                                dataProvider.eurproductsList[index]['stats'] ==
                                        null
                                    ? '0'
                                    : dataProvider.eurproductsList[index]
                                            ['stats']['last'] ??
                                        '0') -
                            double.parse(dataProvider.eurproductsList[index]
                                        ['stats'] ==
                                    null
                                ? '0'
                                : dataProvider.eurproductsList[index]['stats']
                                        ['open'] ??
                                    '0');
                        Color colour =
                            changeRate > 0 ? Colors.green : Colors.red;
                        String change = changeRate.toStringAsFixed(4);
                        return Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              CoinCard(
                                onTap: () async {
                                  launchUrl(Uri.parse(
                                      'https://pro.coinbase.com/trade/${dataProvider.eurproductsList[index]['id']}'));
                                },
                                baseCurrency:
                                    dataProvider.eurproductsList[index]
                                            ['base_currency'] ??
                                        '',
                                displayName: dataProvider.eurproductsList[index]
                                        ['display_name'] ??
                                    '',
                                lastRate: dataProvider.eurproductsList[index]
                                            ['stats'] ==
                                        null
                                    ? 'No Data'
                                    : dataProvider.eurproductsList[index]
                                            ['stats']['last'] ??
                                        'No Data',
                                change: change,
                                colour: colour,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 1,
                              )
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
            ListView(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataProvider.btcproductsList.length,
                    itemBuilder: (context, index) {
                      if (dataProvider.btcproductsList[index] == null) {
                        return SizedBox();
                      } else {
                        double changeRate = double.parse(
                                dataProvider.btcproductsList[index]['stats'] ==
                                        null
                                    ? '0'
                                    : dataProvider.btcproductsList[index]
                                            ['stats']['last'] ??
                                        '0') -
                            double.parse(dataProvider.btcproductsList[index]
                                        ['stats'] ==
                                    null
                                ? '0'
                                : dataProvider.btcproductsList[index]['stats']
                                        ['open'] ??
                                    '0');
                        Color colour =
                            changeRate > 0 ? Colors.green : Colors.red;
                        String change = changeRate.toStringAsFixed(4);
                        return Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              CoinCard(
                                onTap: () async {
                                  launchUrl(Uri.parse(
                                      'https://pro.coinbase.com/trade/${dataProvider.btcproductsList[index]['id']}'));
                                },
                                baseCurrency:
                                    dataProvider.btcproductsList[index]
                                            ['base_currency'] ??
                                        '',
                                displayName: dataProvider.btcproductsList[index]
                                        ['display_name'] ??
                                    '',
                                lastRate: dataProvider.btcproductsList[index]
                                            ['stats'] ==
                                        null
                                    ? 'No Data'
                                    : dataProvider.btcproductsList[index]
                                            ['stats']['last'] ??
                                        'No Data',
                                change: change,
                                colour: colour,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 1,
                              )
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
            ListView(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataProvider.gbpproductsList.length,
                    itemBuilder: (context, index) {
                      if (dataProvider.gbpproductsList[index] == null) {
                        return SizedBox();
                      } else {
                        double changeRate = double.parse(
                                dataProvider.gbpproductsList[index]['stats'] ==
                                        null
                                    ? '0'
                                    : dataProvider.gbpproductsList[index]
                                            ['stats']['last'] ??
                                        '0') -
                            double.parse(dataProvider.gbpproductsList[index]
                                        ['stats'] ==
                                    null
                                ? '0'
                                : dataProvider.gbpproductsList[index]['stats']
                                        ['open'] ??
                                    '0');
                        Color colour =
                            changeRate > 0 ? Colors.green : Colors.red;
                        String change = changeRate.toStringAsFixed(4);
                        return Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              CoinCard(
                                onTap: () async {
                                  launchUrl(Uri.parse(
                                      'https://pro.coinbase.com/trade/${dataProvider.gbpproductsList[index]['id']}'));
                                },
                                baseCurrency:
                                    dataProvider.gbpproductsList[index]
                                            ['base_currency'] ??
                                        '',
                                displayName: dataProvider.gbpproductsList[index]
                                        ['display_name'] ??
                                    '',
                                lastRate: dataProvider.gbpproductsList[index]
                                            ['stats'] ==
                                        null
                                    ? 'No Data'
                                    : dataProvider.gbpproductsList[index]
                                            ['stats']['last'] ??
                                        'No Data',
                                change: change,
                                colour: colour,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 1,
                              )
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
            ListView(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataProvider.ethproductsList.length,
                    itemBuilder: (context, index) {
                      if (dataProvider.ethproductsList[index] == null) {
                        return SizedBox();
                      } else {
                        double changeRate = double.parse(
                                dataProvider.ethproductsList[index]['stats'] ==
                                        null
                                    ? '0'
                                    : dataProvider.ethproductsList[index]
                                            ['stats']['last'] ??
                                        '0') -
                            double.parse(dataProvider.ethproductsList[index]
                                        ['stats'] ==
                                    null
                                ? '0'
                                : dataProvider.ethproductsList[index]['stats']
                                        ['open'] ??
                                    '0');
                        Color colour =
                            changeRate > 0 ? Colors.green : Colors.red;
                        String change = changeRate.toStringAsFixed(4);
                        return Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              CoinCard(
                                onTap: () async {
                                  launchUrl(Uri.parse(
                                      'https://pro.coinbase.com/trade/${dataProvider.ethproductsList[index]['id']}'));
                                },
                                baseCurrency:
                                    dataProvider.ethproductsList[index]
                                            ['base_currency'] ??
                                        '',
                                displayName: dataProvider.ethproductsList[index]
                                        ['display_name'] ??
                                    '',
                                lastRate: dataProvider.ethproductsList[index]
                                            ['stats'] ==
                                        null
                                    ? 'No Data'
                                    : dataProvider.ethproductsList[index]
                                            ['stats']['last'] ??
                                        'No Data',
                                change: change,
                                colour: colour,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 1,
                              )
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
            ListView(
              children: [
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: dataProvider.usdtproductsList.length,
                    itemBuilder: (context, index) {
                      if (dataProvider.usdtproductsList[index] == null) {
                        return SizedBox();
                      } else {
                        double changeRate = double.parse(
                                dataProvider.usdtproductsList[index]['stats'] ==
                                        null
                                    ? '0'
                                    : dataProvider.usdtproductsList[index]
                                            ['stats']['last'] ??
                                        '0') -
                            double.parse(dataProvider.usdtproductsList[index]
                                        ['stats'] ==
                                    null
                                ? '0'
                                : dataProvider.usdtproductsList[index]['stats']
                                        ['open'] ??
                                    '0');
                        Color colour =
                            changeRate > 0 ? Colors.green : Colors.red;
                        String change = changeRate.toStringAsFixed(4);
                        return Container(
                          color: Colors.black,
                          child: Column(
                            children: [
                              CoinCard(
                                onTap: () async {
                                  launchUrl(Uri.parse(
                                      'https://pro.coinbase.com/trade/${dataProvider.usdtproductsList[index]['id']}'));
                                },
                                baseCurrency:
                                    dataProvider.usdtproductsList[index]
                                            ['base_currency'] ??
                                        '',
                                displayName:
                                    dataProvider.usdtproductsList[index]
                                            ['display_name'] ??
                                        '',
                                lastRate: dataProvider.usdtproductsList[index]
                                            ['stats'] ==
                                        null
                                    ? 'No Data'
                                    : dataProvider.usdtproductsList[index]
                                            ['stats']['last'] ??
                                        'No Data',
                                change: change,
                                colour: colour,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.white60,
                                thickness: 1,
                              )
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
