import 'package:flutter/material.dart';

class DecimalPointStockScreen extends StatefulWidget {
  DecimalPointStockScreen({Key? key}) : super(key: key);

  @override
  State<DecimalPointStockScreen> createState() =>
      _DecimalPointStockScreenState();
}

class _DecimalPointStockScreenState extends State<DecimalPointStockScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> koreaStockList = [
    '삼성전자',
    'SK하이닉스',
    'LG에너지솔루션',
    '삼성전자',
    'SK하이닉스',
    'LG에너지솔루션',
    '삼성전자',
    'SK하이닉스',
    'LG에너지솔루션',
    '삼성전자',
    'SK하이닉스',
    'LG에너지솔루션',
    '삼성전자',
    'SK하이닉스',
    'LG에너지솔루션',
  ];

  List<String> abroadStockList = [
    '제이피모간 체이스',
    '뱅크오브아메리카',
    '호멜푸드',
    '제이피모간 체이스',
    '뱅크오브아메리카',
    '호멜푸드',
    '제이피모간 체이스',
    '뱅크오브아메리카',
    '호멜푸드',
    '제이피모간 체이스',
    '뱅크오브아메리카',
    '호멜푸드',
  ];

  List items1 = [];
  List items2 = [];
  List<String> resultItems = [];

  @override
  void initState() {
    super.initState();
    //초기데이터 설정
    items1 = koreaStockList;
    items2 = abroadStockList;

    _controller.addListener(() {
      String searchWord = _controller.text;
      List<String> resultItems1 = koreaStockList.where((element) {
        return element.contains(searchWord);
      }).toList();

      List<String> resultItems2 = abroadStockList.where((element) {
        return element.contains(searchWord);
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
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('소수점 종목 검색'),
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
                  decoration: InputDecoration(
                    hintText: '종목명을 입력해 주세요.',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 10),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                resultItems.isEmpty
                    ? Expanded(
                        child: Column(
                          children: [
                            TabBar(
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
                                            leading: CircleAvatar(),
                                            title: Text(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  ListView(
                                    children: items2
                                        .map(
                                          (e) => ListTile(
                                            leading: CircleAvatar(),
                                            title: Text(e),
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
                                  title: Text(e),
                                ),
                              )
                              .toList(),
                        ),
                      ),
              ],
            )),
      ),
    );
  }
}
