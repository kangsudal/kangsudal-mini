import 'package:flutter/material.dart';
import 'package:kangsudal_mini/models/stock.dart';

class TradingScreen extends StatelessWidget {
  bool isSell;
  Stock stock;

  TradingScreen({
    Key? key,
    required this.isSell,
    required this.stock,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isSell ? '판매하기' : '구매하기'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          selectAccountButton(),
          top(),
          Expanded(
            child: Row(
              children: [
                bottomLeft(),
                bottomRight(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container selectAccountButton() {
    return Container(
      height: 40,
      width: 200,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white12,
      ),
      child: Center(
        child: Text(
          '종합위탁 366-123-456 01',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Expanded bottomRight() {
    return Expanded(
      child: Placeholder(),
    );
  }

  Expanded bottomLeft() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Color(0xff1d2358),
              ),
            ),
            Expanded(
              child: Container(
                color: Color(0xff3e1d2a),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container top() {
    return Container(
      height: 200,
      child: Placeholder(),
    );
  }
}
