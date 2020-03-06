import 'package:flutter/material.dart';
import 'package:nrnr/models/Post.dart';
import 'package:nrnr/screens/mainpage/tabs/search/detail/ImageSlider.dart';

class Detail extends StatelessWidget {
  final Post arguments;

  Detail(this.arguments);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                // center the children
                children: <Widget>[
                  CarouselWithIndicator(
                      this.arguments.images.map((d) => d).toList()),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      this.arguments.title,
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.black,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: new Stack(
                      children: <Widget>[
                        Icon(Icons.location_on, color: const Color(0xffff664c)),
                        Center(
                            child: Text(this.arguments.address,
                                style: const TextStyle(
                                  color: const Color(0xff6e6e6e),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "NanumGothic",
                                  fontStyle: FontStyle.normal,
                                )))
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: const Color(0xffd8d8d8)))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: new Stack(
                      children: <Widget>[
                        Icon(Icons.monetization_on,
                            color: const Color(0xffff664c)),
                        Center(
                            child: Text(
                                "월세 ${this.arguments.deposit}/${this.arguments.rent_price}",
                                style: const TextStyle(
                                  color: const Color(0xff6e6e6e),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "NanumGothic",
                                  fontStyle: FontStyle.normal,
                                )))
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: const Color(0xffd8d8d8)))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: new Stack(
                      children: <Widget>[
                        Icon(Icons.home, color: const Color(0xffff664c)),
                        Center(
                            child: Text(this.arguments.home,
                                style: const TextStyle(
                                  color: const Color(0xff6e6e6e),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "NanumGothic",
                                  fontStyle: FontStyle.normal,
                                )))
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: const Color(0xffd8d8d8)))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: new Stack(
                      children: <Widget>[
                        Icon(Icons.watch_later, color: const Color(0xffff664c)),
                        Center(
                            child: Text(
                                "${this.arguments.start_at.substring(0, 10)} ~ ${this.arguments.end_at.substring(0, 10)}",
                                style: const TextStyle(
                                  color: const Color(0xff6e6e6e),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "NanumGothic",
                                  fontStyle: FontStyle.normal,
                                )))
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: const Color(0xffd8d8d8)))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: new Stack(
                      children: <Widget>[
                        Icon(Icons.phone, color: const Color(0xffff664c)),
                        Center(
                            child: Text(this.arguments.phone,
                                style: const TextStyle(
                                  color: const Color(0xff6e6e6e),
                                  fontWeight: FontWeight.w800,
                                  fontFamily: "NanumGothic",
                                  fontStyle: FontStyle.normal,
                                )))
                      ],
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 3, color: const Color(0xffd8d8d8)))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.15),
                      child: Text(
                        "상세내용",
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: size.width * 0.7,
                      alignment: Alignment.centerLeft,
                      child: Text(this.arguments.text)),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => {Navigator.of(context).pop()},
                    child: Container(
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          color: const Color(0xffff664c),
                          border: Border.all(color: const Color(0xfffff664c)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("뒤로가기",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontFamily: "JalnanOTF",
                                fontStyle: FontStyle.normal,
                                fontSize: 14),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
