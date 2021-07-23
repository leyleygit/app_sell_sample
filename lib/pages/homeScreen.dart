import 'package:app_sell/data/fileData.dart';
import 'package:app_sell/package/theme.dart';
import 'package:app_sell/pages/productDetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

var _product = product;
var _cart = cart;

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   items: bottomItem,
        //   currentIndex: 0,
        //   onTap: (val){
        //     setState(() {
        //       pageIndex=val;
        //     });
        //     print(pageIndex);
        //   },
        // ),
        backgroundColor: MyTheme.bg,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: MyTheme.bg,
              actions: [
                LineIcon(
                  LineIcons.search,
                  color: MyTheme.iconBlack,
                ),
                SizedBox(
                  width: 20,
                ),
                LineIcon(
                  LineIcons.filter,
                  color: MyTheme.iconBlack,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (_) {
                              return ProductDetail(
                                index: index,
                              );
                            }));
                          },
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 4.0,
                                    blurRadius: 10.0,
                                    offset: Offset(1.0, 7.0),
                                    color: Color(0xffb3b3b3))
                              ],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Column(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //name products
                                Text(_product[index]['proName'],
                                    style: TextStyle(color: MyTheme.texts)),
                                //price
                                Text(
                                  "${_product[index]['price'].toString()}​ រៀល",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff6CC617)),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          alignment: Alignment.bottomCenter,
                                          image: AssetImage(
                                              _product[index]['img'][0])),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       spreadRadius: 4.0,
                                      //       blurRadius: 10.0,
                                      //       offset: Offset(1.0, 7.0),
                                      //       color: Color(0xffb3b3b3))
                                      // ],
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                //_cart = []
                                var results = _cart.indexWhere((e) =>
                                   e['_proID']== _product[index]['_proID']);
                                    
                                    if(results>=0){
                                      _product[index]['qty']+=1;
                                    }else{
                                      _cart.add(_product[index]);
                                    }
                              });
                              print(cart);
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 4.0,
                                        blurRadius: 10.0,
                                        offset: Offset(1.0, 7.0),
                                        color: Color(0xffb3b3b3))
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  'Add',
                                  style: GoogleFonts.passionOne(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }, childCount: _product.length),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    mainAxisExtent: 250, maxCrossAxisExtent: 200.0))
          ],
        ));
  }
}
