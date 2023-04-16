import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kangsudal_mini/models/stock.dart';

class TradingScreen extends StatefulWidget {
  bool isSell;
  Stock stock;

  TradingScreen({
    Key? key,
    required this.isSell,
    required this.stock,
  }) : super(key: key);

  @override
  State<TradingScreen> createState() => _TradingScreenState();
}

class _TradingScreenState extends State<TradingScreen> {
  int shares = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSell ? '판매하기' : '구매하기'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          selectAccountButton(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10,
            ),
            child: top(widget.stock),
          ),
          Expanded(
            child: Row(
              children: [
                bottomLeft(),
                bottomRight(widget.stock),
              ],
            ),
          ),
          if (widget.isSell)
            Container(
              margin: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              height: 40,
              color: Color(0xff1d2358),
              child: Center(
                child: Text('판매'),
              ),
            )
          else
            Container(
              margin: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              height: 40,
              color: Color(0xff3e1d2a),
              child: Center(
                child: Text('구매'),
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

  Expanded bottomRight(
    Stock stock,
  ) {
    return Expanded(
      child: Column(
        children: [
          Text(
            widget.isSell ? '판매수량(주)' : '구매수량(주)',
          ),
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  FontAwesomeIcons.minus,
                  color: Colors.grey,
                  size: 15,
                ),
                Text(
                  shares.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.plus,
                  color: Colors.grey,
                  size: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          if (stock.isKor)
            Text(
              '희망가격(원)',
            )
          else
            Text(
              '희망가격(\$)',
            ),
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  FontAwesomeIcons.minus,
                  color: Colors.grey,
                  size: 15,
                ),
                Text(
                  shares.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.plus,
                  color: Colors.grey,
                  size: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded bottomLeft() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '상한가',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (ctx, idx) {
                  double price = widget.stock.price;
                  Color color;
                  double d; //공차
                  if (widget.stock.isKor) {
                    d = 100;
                  } else {
                    d = 0.5;
                  }
                  if (idx < 10) {
                    color = Color(0xff1d2358);
                  } else {
                    color = Color(0xff3e1d2a);
                  }
                  return Container(
                    color: color,
                    height: 40,
                    child: Text(
                      (-9 * d + price + d * (idx - 1)).toStringAsFixed(2),
                      // toStringAsFixed : 소수점 2자리수
                      // -9 * d + price : 첫째항, idx : n
                      // 등차수열 a_n = 첫째항+d(n-1)
                      textAlign: TextAlign.right,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '하한가',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget top(Stock stock) {
    Color upDownColor = stock.isUp ? Colors.red : Colors.blueAccent;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${widget.stock.ticker} ',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            Text(
              widget.stock.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              widget.stock.isKor
                  ? '${widget.stock.price}원'
                  : '\$${widget.stock.price}',
              style: TextStyle(
                color: upDownColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: FaIcon(
                stock.isUp
                    ? FontAwesomeIcons.caretUp
                    : FontAwesomeIcons.caretDown,
                color: upDownColor,
                size: 15,
              ),
            ),
            Text(
              '${stock.updownPrice}(${stock.updownPercent}%)',
              style: TextStyle(
                color: upDownColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
