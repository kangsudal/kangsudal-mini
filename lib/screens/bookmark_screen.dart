import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'DetailScreen.dart';

class BookMarkScreen extends StatelessWidget {
  BookMarkScreen({Key? key}) : super(key: key);

  List<Stock> stocks = [
    Stock(
      name: '호멜 푸즈',
      price: 39.26,
      updownPrice: 0.61,
      updownPercent: 1.54,
      isUp: false,
      ticker: 'HRL',
    ),
    Stock(
      name: 'JPM 제이피모간 체이스',
      price: 138.73,
      updownPrice: 9.74,
      updownPercent: 7.55,
      isUp: true,
      ticker: 'JPM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          '찜한주식',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: stocks
            .map(
              (stock) => ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(stock: stock),
                    ),
                  );
                },
                leading: CircleAvatar(),
                title: Row(
                  children: [
                    Text(
                      stock.name,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    FaIcon(
                      FontAwesomeIcons.seedling,
                      color: Colors.green,
                      size: 10,
                    ),
                  ],
                ),
                trailing: Container(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${stock.price}',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FaIcon(
                              stock.isUp == true
                                  ? FontAwesomeIcons.caretUp
                                  : FontAwesomeIcons.caretDown,
                              color: stock.isUp == true
                                  ? Colors.redAccent
                                  : Colors.indigo,
                              size: 12,
                            ),
                            Text(
                              '\$${stock.updownPrice}(${stock.updownPercent}%)',
                              style: TextStyle(
                                color: stock.isUp == true
                                    ? Colors.redAccent
                                    : Colors.indigo,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class Stock {
  double price; //현재가격
  String name; //주식이름
  double updownPrice; //등락금액
  double updownPercent; //등락률
  bool isUp; //상승세인지
  String ticker; //주식 ticker

  Stock({
    required this.name,
    required this.price,
    required this.updownPrice,
    required this.updownPercent,
    required this.isUp,
    required this.ticker,
  });
}
