import 'package:arogga_copy/model/home_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'home_drawer.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Arogga Copy'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            toggleDrawer();
          },
        ),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: homeBody(),
      drawer: HomeDrawer(),
    );
  }

  toggleDrawer() async {
    if (_scaffoldKey.currentState.isDrawerOpen) {
      _scaffoldKey.currentState.openEndDrawer();
    } else {
      _scaffoldKey.currentState.openDrawer();
    }
  }

  Widget homeBody() {
    final items = getPulseAximeterList();
    final diabeticItems = getDiabeticMeter();
    return Container(
        child: ListView(
      children: [
        carousel(),
        getCategoryTitle('Covid 19 Special'),
        getListview(items),
        getCategoryTitle('Diabetic Care'),
        getListview(diabeticItems),
      ],
    ));
  }

  Widget getCategoryTitle(String title) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget carousel() {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1.0,
      ),
      items: imgList
          .map((item) => Container(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(item, fit: BoxFit.cover, width: 1000)),
              ))
          .toList(),
    );
  }

  Widget getListview(List<HomeItem> items) {
    return Container(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return listItem(context, items[index]);
          }),
    );
  }

  List<HomeItem> getPulseAximeterList() {
    List<HomeItem> items = [];
    for (int i = 0; i < 10; i++) {
      HomeItem item = HomeItem(
          'Fingertip pulse oximeter JPD-500E',
          'https://aleefsurgical.com/wp-content/uploads/2020/08/613Ufa2NwL._AC_SX679_.jpg',
          '1500',
          '1700',
          '10');
      items.add(item);
    }
    return items;
  }

  List<HomeItem> getDiabeticMeter() {
    List<HomeItem> items = [];
    for (int i = 0; i < 10; i++) {
      HomeItem item = HomeItem(
          'Care Touch Diabetes Testing Kit –',
          'https://images-na.ssl-images-amazon.com/images/I/71grSBGh9LL._AC_SX466_.jpg',
          '1500',
          '1700',
          '20');
      items.add(item);
    }
    return items;
  }

  Widget listItem(BuildContext context, HomeItem item) {
    return Container(
      height: 200,
      width: 150,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Text(
                    '${item.discount}% OFF',
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.all(5),
                  color: Colors.green.shade700),
              Expanded(child: Image.network(item.productUrl)),
              Text(
                item.productName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '৳${item.oldPrice}',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              Text('৳${item.price}'),
            ],
          ),
        ),
      ),
    );
  }
}
