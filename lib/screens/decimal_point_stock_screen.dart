import 'package:flutter/material.dart';
import 'package:kangsudal_mini/models/stock.dart';
import 'package:kangsudal_mini/screens/DetailScreen.dart';

class DecimalPointStockScreen extends StatefulWidget {
  DecimalPointStockScreen({Key? key}) : super(key: key);

  @override
  State<DecimalPointStockScreen> createState() =>
      _DecimalPointStockScreenState();
}

class _DecimalPointStockScreenState extends State<DecimalPointStockScreen> {
  TextEditingController _controller = TextEditingController();
  List<Stock> koreaStockList = [
    Stock(
      name: '삼성전자',
      price: 65000,
      updownPrice: 1000,
      updownPercent: 1.51,
      isUp: false,
      ticker: '005930',
      isKor: true,
    ),
    Stock(
      name: 'SK하이닉스',
      price: 89000,
      updownPrice: 600,
      updownPercent: 0.68,
      isUp: true,
      ticker: '000660',
      isKor: true,
    ),
    Stock(
      name: 'LG에너지솔루션',
      price: 594000,
      updownPrice: 5000,
      updownPercent: 0.83,
      isUp: false,
      ticker: '373220',
      isKor: true,
    ),
  ];

  List<Stock> abroadStockList = [
    Stock(
      name: '제이피모간 체이스',
      price: 138.73,
      updownPrice: 9.74,
      updownPercent: 7.55,
      isUp: true,
      ticker: 'JPM',
      isKor: false,
    ),
    Stock(
      name: '뱅크오브아메리카',
      price: 29.52,
      updownPrice: 0.96,
      updownPercent: 3.36,
      isUp: true,
      ticker: 'BAC',
      isKor: false,
    ),
    Stock(
      name: '호멜푸드',
      price: 39.26,
      updownPrice: 0.61,
      updownPercent: 1.54,
      isUp: false,
      ticker: 'HRL',
      isKor: false,
    ),
  ];

  List<Stock> items1 = [];
  List<Stock> items2 = [];
  List<Stock> resultItems = [];

  @override
  void initState() {
    super.initState();
    //초기데이터 설정
    items1 = koreaStockList;
    items2 = abroadStockList;

    _controller.addListener(() {
      String searchWord = _controller.text;
      List<Stock> resultItems1 = koreaStockList.where((element) {
        return element.name.contains(searchWord);
      }).toList();

      List<Stock> resultItems2 = abroadStockList.where((element) {
        return element.name.contains(searchWord);
      }).toList();

      setState(() {
        resultItems = resultItems1 + resultItems2;
        print(resultItems);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('소수점 종목 검색'),
        backgroundColor: Colors.black,
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: '종목명을 입력해 주세요.',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              resultItems.isEmpty
                  ? Expanded(
                      child: Column(
                        children: [
                          TabBar(
                            indicatorColor: Theme.of(context).primaryColor,
                            unselectedLabelColor: Colors.white,
                            labelColor: Theme.of(context).primaryColor,
                            tabs: [
                              Tab(
                                text: '국내소수점',
                              ),
                              Tab(
                                text: '해외소수점',
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                ListView(
                                  children: items1
                                      .map(
                                        (e) => ListTile(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen(stock: e),
                                              ),
                                            );
                                          },
                                          leading: CircleAvatar(),
                                          title: Text(
                                            e.name,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                                ListView(
                                  children: items2
                                      .map(
                                        (e) => ListTile(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen(stock: e),
                                              ),
                                            );
                                          },
                                          leading: CircleAvatar(),
                                          title: Text(
                                            e.name,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: ListView(
                        children: resultItems
                            .map(
                              (e) => ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(stock: e),
                                    ),
                                  );
                                },
                                title: Text(
                                  e.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
