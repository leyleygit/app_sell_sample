import 'package:app_sell/package/theme.dart';
import 'package:app_sell/pages/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class AddToCard extends StatefulWidget {
  const AddToCard({Key? key}) : super(key: key);

  @override
  _AddToCardState createState() => _AddToCardState();
}

List storyName = [
  'spiderMan',
  'BatMan',
  'SuperMan',
  'ShitMan',
  'OnePunchMan',
  'Boroto',
];

class _AddToCardState extends State<AddToCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: LineIcon(
            LineIcons.angleLeft,
            color: MyTheme.iconBlack,
          ),
        ),
        body: Column(
          children: [
            //List Items
            Container(
              width: size.width,
              height: size.height / 1.7,
              color: Colors.red.withOpacity(0.3),
              child: ListView.builder(
                itemCount: storyName.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.white,
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(15.0))),
                          Expanded(
                              child: Container(
                            height: 100,
                            color: Colors.blue.withOpacity(0.2),
                          ))
                        ],
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
                        ListTile(
                          trailing: Text(
                            '២០០០០ រៀល',
                            style:
                                GoogleFonts.ptSans(fontSize: 25,fontWeight: FontWeight.bold),
                          ),
                          title: Text(
                            'Subtotal',
                            style:
                                GoogleFonts.ptSans(fontSize: 25.0,fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          endIndent: 20,
                          indent: 20.0,
                          color: Colors.grey,
                          thickness: 1.5,
                        )
                      ],
                    )))
          ],
        ));
  }
}
