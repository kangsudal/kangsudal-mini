class Stock {
  double price; //현재가격
  String name; //주식이름
  double updownPrice; //등락금액
  double updownPercent; //등락률
  bool isUp; //상승세인지
  String ticker; //주식 ticker
  bool isKor; //한국주식인지

  Stock({
    required this.name,
    required this.price,
    required this.updownPrice,
    required this.updownPercent,
    required this.isUp,
    required this.ticker,
    required this.isKor,
  });

  @override
  String toString() {
    return 'Stock{price: $price, name: $name, updownPrice: $updownPrice, updownPercent: $updownPercent, isUp: $isUp, ticker: $ticker, isKor: $isKor}';
  }
}
