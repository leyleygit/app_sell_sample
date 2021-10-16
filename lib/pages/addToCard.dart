import 'package:app_sell/data/fileData.dart';
import 'package:app_sell/package/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
class AddToCard extends StatefulWidget {
  const AddToCard({Key? key}) : super(key: key);

  @override
  _AddToCardState createState() => _AddToCardState();
}

List _cart = cart;

class _AddToCardState extends State<AddToCard> {
  var total;
  @override
  Widget build(BuildContext context) {
    total = 0;
    _cart.forEach((e) {
      total += e['qty'] * e['price'];
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          // leading: LineIcon(
          //   LineIcons.angleLeft,
          //   color: MyTheme.iconBlack,
          // ),
        ),
        body: Column(
          children: [
            //List Items
            Container(
              width: size.width,
              height: size.height / 1.7,
              //color: Colors.red.withOpacity(0.3),
              child: _cart.isEmpty
                  ? Center(
                      child: Text('No fking data'),
                    )
                  : ListView.builder(
                      itemCount: _cart.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.2,
                          secondaryActions: [
                            IconSlideAction(
                              onTap: () {
                                setState(() {
                                  _cart.removeAt(index);
                                });
                                print(_cart);
                              },
                              iconWidget: Text(
                                'delete',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                              color: Colors.red.withOpacity(0.2),
                              icon: Icons.delete,
                            )
                          ],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 8),
                            child: Container(
                              color: Colors.white,
                              height: 100,
                              child: Row(
                                children: [
                                  Container(
                                      width: 90,
                                      height: 90,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: AssetImage(_cart[index]
                                                      ['img'][0]
                                                  .toString())),
                                          color: Colors.grey.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(15.0))),
                                  Expanded(
                                      child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'hello',
                                                style: TextStyle(
                                                    color: Color(0xff6CC617),
                                                    fontSize: 20),
                                              ),
                                              Text(
                                                _cart[index]['proName'],
                                                style: TextStyle(
                                                    color: MyTheme.title,
                                                    fontSize: 23,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '${_cart[index]['price'].toString()} ៛',
                                                style: TextStyle(
                                                    color: MyTheme.title,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Spacer(
                                            flex: 1,
                                          ),
                                          //Value Bottom
                                          Container(
                                            width: 100,
                                            //color: Colors.orange,
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: _cart[index]['qty'] ==
                                                          1
                                                      ? null
                                                      : () {
                                                          setState(() {
                                                            _cart[index]
                                                                ['qty'] -= 1;
                                                          });
                                                        },
                                                  child: Container(
                                                    width: 35,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/img/minus.png')),
                                                        //color: Colors.greenAccent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                  ),
                                                ),
                                                Container(
                                                  width: 30,
                                                  height: 30,
                                                  color: Colors.white,
                                                  child: Center(
                                                      child: Text(
                                                    _cart[index]['qty']
                                                        .toString(),
                                                    style: GoogleFonts.ptSans(
                                                        fontSize: 20),
                                                  )),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _cart[index]['qty'] += 1;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 35,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        //color: Colors.pink,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                        image: DecorationImage(
                                                            image: AssetImage(
                                                                'assets/img/add.png'))),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    height: 100,
                                    //color: Colors.blue.withOpacity(0.2),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Expanded(
                child: Container(
                    width: size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Divider(
                          endIndent: 20,
                          indent: 20.0,
                          color: Colors.grey,
                          thickness: 1.5,
                        ),
                        ListTile(
                          trailing: Text(
                            '$total ៛',
                            style: GoogleFonts.ptSans(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            'Total',
                            style: GoogleFonts.ptSans(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                           
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Payment',
                              style: TextStyle(color: Colors.white),
                            ),
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 1.0,
                                      blurRadius: 5.0,
                                      offset: Offset(1.0, 1.0),
                                      color: Color(0xffb3b3b3))
                                ],
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xff181717)),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    )))
          ],
        ));
  }
}
