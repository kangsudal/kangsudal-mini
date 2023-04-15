import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'DetailScreen.dart';

class BookMarkScreen extends StatelessWidget {
  BookMarkScreen({Key? key}) : super(key: key);

  List<Stock> stocks = [
    Stock(name: '호멜 푸즈', price: 39.26, updownPrice: 0.61, updownPercent: 1.54),
    Stock(name: '호멜 푸즈', price: 39.26, updownPrice: 0.61, updownPercent: 1.54),
    Stock(name: '호멜 푸즈', price: 39.26, updownPrice: 0.61, updownPercent: 1.54),
    Stock(name: '호멜 푸즈', price: 39.26, updownPrice: 0.61, updownPercent: 1.54),
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
                              FontAwesomeIcons.caretDown,
                              color: Colors.blue,
                              size: 10,
                            ),
                            Text(
                              '\$${stock.updownPrice}(${stock.updownPercent}%)',
                              style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 10,
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
  double price;
  String name;
  double updownPrice;
  double updownPercent;

  Stock({
    required this.name,
    required this.price,
    required this.updownPrice,
    required this.updownPercent,
  });
}
