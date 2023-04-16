import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kangsudal_mini/models/stock.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:kangsudal_mini/screens/trading_screen.dart';

class DetailScreen extends StatelessWidget {
  Stock stock;

  DetailScreen({
    required this.stock,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double currentCurrency = 1299.50;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
            children: [
              RichText(
                text: TextSpan(
                  text: stock.ticker,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: stock.name,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stock.isKor
                      ? Text(
                          '${stock.price} 원',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        )
                      : Text(
                          '\$${stock.price}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                  //시간되면 환전버튼
                  // Placeholder(
                  //   fallbackWidth: 10,
                  //   fallbackHeight: 10,
                  // ),
                ],
              ),
              Row(
                children: [
                  stock.isUp
                      ? FaIcon(
                          FontAwesomeIcons.caretUp,
                          color: Colors.redAccent,
                        )
                      : FaIcon(
                          FontAwesomeIcons.caretDown,
                          color: Colors.blueAccent,
                        ),
                  stock.isKor
                      ? Text(
                          '${stock.updownPrice}원(${stock.updownPercent}%)',
                          style: TextStyle(
                            color: stock.isUp
                                ? Colors.redAccent
                                : Colors.blueAccent,
                          ),
                        )
                      : Text(
                          '\$${stock.updownPrice}(${stock.updownPercent}%)',
                          style: TextStyle(
                            color: stock.isUp
                                ? Colors.redAccent
                                : Colors.blueAccent,
                          ),
                        ),
                  if (stock.isKor == false)
                    Text(
                      '· 환율 $currentCurrency원',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.7,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        color:
                            stock.isUp ? Colors.redAccent : Colors.blueAccent,
                        spots: [
                          FlSpot(0, 40),
                          FlSpot(10, 50),
                          FlSpot(15, 30),
                          FlSpot(20, 40),
                          FlSpot(30, 10),
                          FlSpot(40, 20),
                          FlSpot(45, 15),
                          FlSpot(50, 40),
                        ],
                        isCurved: true,
                        //꼭짓점을 없애준다.
                        dotData: FlDotData(
                          show: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              TradingScreen(isSell: true, stock: stock),
                        ),
                      );
                    },
                    child: Text('판매하기'),
                    color: Colors.blueAccent,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              TradingScreen(isSell: false, stock: stock),
                        ),
                      );
                    },
                    child: Text('구매하기'),
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///https://blog.logrocket.com/build-beautiful-charts-flutter-fl-chart/#creating-line-chart
  ///https://afgprogrammer.com/blog/how-to-use-charts-in-flutter/
  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (x, meta) {
          String text = '';
          switch (x.toInt()) {
            case 0:
              text = '23/01/19';
              break;
            case 15:
              text = '23/02/16';
              break;
            case 30:
              text = '23/03/17';
              break;
            case 45:
              text = '23/04/14';
              break;
          }

          return Text(
            text,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          );
        },
      );
}
