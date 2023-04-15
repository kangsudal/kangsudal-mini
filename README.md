# kangsudal-mini

**목표**: M-able 앱 레이아웃 클론하기

**데이터**: 더미 데이터

**프레임워크**: Flutter
<br/>
<br/>

## Web App
https://kangsudal-mini.web.app/#/
<br/>
<br/>

## 구현영상

<br/>
<br/>

### 사용 라이브러리와 위젯

**사용 라이브러리**: `font_awesome_flutter`, `flutter_riverpod`, `chat_bubbles`, `rive`, `intl`, `fl_chart`

`font_awesome_flutter`: 다양한 아이콘 사용

`flutter_riverpod`: bottomNavigatorBar index, 로그인 상태 관리

`chat_bubbles`: 말풍선 모양 생성

`rive`: 첫 시작화면 이미지

`intl`: 1,000,000,000 처럼 숫자 세자리마다 쉼표 들어가게 함

`fl_chart`: 주식 linear 그래프 그리기

**사용 위젯**: `BottomNavigationBar`, `DefaultTabController`, `TabBar` & `TabBarView`, `CustomScrollView` & `SliverAppBar` & `SliverPadding` & `SliverToBoxAdapter` & `SliverFixedExtentList` & `SliverPersistentHeader`, `RichText` & `TextSpan`, `TextField`, `Switch`

`SliverPersistentHeader`: Pinned 되는 리스트 헤더

`Switch`: 총자산 금액 숨김 기능

<br/>
<br/>

### 기억해두고싶은 코드들
**검색기능**
```
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
```
<br/>

**찜한주식에서 상세페이지로 넘어갈때 넘겨주는 객체**

```
class Stock {
  double price;
  String name;
  double updownPrice;
  double updownPercent;
  bool isUp;
  String ticker;

  Stock({
    required this.name,
    required this.price,
    required this.updownPrice,
    required this.updownPercent,
    required this.isUp,
    required this.ticker,
  });
}
```
