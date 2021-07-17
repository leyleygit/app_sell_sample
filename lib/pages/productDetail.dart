import 'package:app_sell/data/fileData.dart';
import 'package:app_sell/package/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class ProductDetail extends StatefulWidget {
  final int index;
  const ProductDetail({Key? key, required this.index}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

var _proDetail = product;
int _listPicIndex = 0;

class _ProductDetailState extends State<ProductDetail> {
  var _counter = 1;
  void _plusCounter() {
    setState(() {
      if (_counter >= 1) {
        _counter++;
      }
    });
  }

  void _minusCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }
  // void _totalProPrice (index,qty){
  //   setState(() {
  //     _proDetail.forEach((e) {
  //       return e[index]['price'] * qty;
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            actions: [
              Icon(
                Icons.more_vert,
                color: MyTheme.iconBlack,
              ),
              SizedBox(
                width: 20,
              )
            ],
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Detail',
              style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.bold, color: MyTheme.title),
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: LineIcon.arrowLeft(
                  color: MyTheme.iconBlack,
                ))),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Durain Khmer',
                    style: GoogleFonts.ptSans(color: Color(0xff6CC617)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Somlot Mornthorng',
                    style: GoogleFonts.ptSans(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  //Detail Picture View
                  Row(
                    children: [
                      //small list pictures detail
                      Column(
                        children: [
                          Container(
                            //color: Colors.indigo,
                            width: 100,
                            height: size.height / 2.3,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: _proDetail[widget.index]['img'].length,
                              itemBuilder: (BuildContext context, int index) {
                                //list view objects
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _listPicIndex = index;
                                      });
                                      print(_listPicIndex);
                                    },
                                    child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                              image: AssetImage(
                                                  _proDetail[widget.index]
                                                      ['img'][index])),
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 0.1,
                                                blurRadius: 4.0,
                                                offset: Offset(2, 4.0),
                                                color: Color(0xffCDCDCD))
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          //bottom scroll
                          InkWell(
                            onTap: () {},
                            child: Container(
                                width: 50,
                                height: 25,
                                //color: Colors.indigoAccent,
                                //alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Color(0xffF2F2F2),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: LineIcon(LineIcons.angleDown)),
                          )
                        ],
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      //Big Detail picture
                      Container(
                          width: 220,
                          height: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            //border: Border.all(width: 1,color: Colors.black),
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage(
                                      _proDetail[widget.index]['img'][_listPicIndex])))),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, right: 50),
                    child: Row(
                      children: [
                        Text(
                           "${(_proDetail[widget.index]['price']*_counter).toString()} \រៀល",
                          style: GoogleFonts.ptSans(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        //bottom value
                        Container(
                          width: 90,
                          height: 40,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 0.1,
                                    blurRadius: 4.0,
                                    offset: Offset(2, 4.0),
                                    color: Color(0xffCDCDCD))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  _minusCounter();
                                },
                                child: Container(
                                  width: 30,
                                  //color: Colors.red,
                                  child: LineIcon.minus(
                                    size: 18,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 30,
                                color: Colors.white,
                                child: Text(
                                  '${_counter.toString()}',
                                  style: GoogleFonts.ptSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _plusCounter();
                                },
                                child: Container(
                                  width: 30,
                                  //color: Colors.red,
                                  child: LineIcon.plus(
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //buy bottom
                  Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15.0),
                      highlightColor: Colors.grey.withOpacity(0.1),
                      onTap: () {},
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        width: 200,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Buy Now',
                            style: GoogleFonts.ptSans(color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0.1,
                                  blurRadius: 4.0,
                                  offset: Offset(2, 4.0),
                                  color: Color(0xffCDCDCD))
                            ],
                            color: MyTheme.iconBlack,
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
