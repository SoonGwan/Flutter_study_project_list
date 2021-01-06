import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/160827590445440207.jpg?gif=1&w=640&h=640&c=c&webp=1',
  'https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/160827493756849168.jpg?gif=1&w=640&h=640&c=c&webp=1',
  'https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/160827494450689618.jpg?gif=1&w=640&h=640&c=c&webp=1',
  'https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/160827493756849168.jpg?gif=1&w=640&h=640&c=c&webp=1',
  'https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/images/160827493272498102.jpg?gif=1&w=640&h=640&c=c&webp=1',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '${imgList.indexOf(item)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class KlassMainPage extends StatelessWidget {
  final _isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 자식들을 왼쪽정렬로 배치함
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(children: <Widget>[
                        // Padding(
                        // padding: EdgeInsets.only(bottom: 10),
                        Text(
                          '클래스',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                  color: Colors.black, offset: Offset(0, -10))
                            ],
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.transparent,
                            decoration:
                                _isSelected ? TextDecoration.underline : null,
                            decorationColor: Colors.black,
                            decorationThickness: 2,
                          ),
                        ),
                        // ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        ),
                        Text('수강권',
                            style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.grey[400],
                                    offset: Offset(0, -10))
                              ],
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.transparent,
                              decoration:
                                  _isSelected ? TextDecoration.underline : null,
                              decorationColor: Colors.white,
                              decorationThickness: 2,
                            )),
                      ])),
                  CarouselSlider(
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        enlargeCenterPage: false,
                        viewportFraction: 0.7,
                        autoPlay: true,
                      ),
                      items: imageSliders),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(children: <Widget>[]))
                ])));
  }
}
