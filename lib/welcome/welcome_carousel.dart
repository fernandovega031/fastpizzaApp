import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fastpizzaapp/welcome/welcome.dart';

final List<String> imgList = [
  'assets/images/imagen1.jpg',
  'assets/images/imagen2.jpg',
  'assets/images/imagen3.jpg',
 ];

final List<String> titleList = [
  'Select pizza ingredients',
  'Our chefs cook',
  'Fast delivery',
 ];

final List<String> descriptionList = [
  'Discovered the best pizzas from  all our resturants',
  'From all the best chefs in the word we cook for you',
  'Fast delivery to your home, office or wherever you are',
 ];



final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        child: Stack(children: <Widget>[
          Image.asset(i, fit: BoxFit.cover),
          Positioned(
            top: 10.0,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0)
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  String textTitle = titleList[0];
  String textDescription = descriptionList[0];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: child,
        height: 350,
        viewportFraction: 1.5,
        autoPlay: true,
        enlargeCenterPage: false,
        aspectRatio: 1.0,
        onPageChanged: (index) {
          setState(() {
            _current = index;
            textTitle = titleList[_current];
            textDescription = descriptionList[_current];
          });
        },
      ),
      Container(
        padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 15.0),
        child:  Text(
          '$textTitle',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
              color: Color.fromRGBO(232, 79, 84, 1.0),
              fontWeight: FontWeight.w600,
              fontSize: 30
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(80.0, 15.0, 80.0, 20.0),
        child:  Text(
          '$textDescription',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              fontWeight: FontWeight.w400,
              fontSize: 17
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          imgList,
              (index, url){
            return Container(
              width: 10.0,
              height: 10.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(232, 79, 84, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.1)),
            );
          },
        ),
      ),
    ]);
  }
}




/*
*
*
* */