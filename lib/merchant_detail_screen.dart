import 'package:flutter/material.dart';
import 'package:flutter_project_2/tag_card.dart';

import 'merchant.dart';

class MerchantDetailScreen extends StatelessWidget {
  final Merchant merchant;
  const MerchantDetailScreen({Key? key, required this.merchant})
      : super(key: key);

  static const TextStyle headingStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: Colors.purple,
  );

  @override
  Widget build(BuildContext context) {
    final int tagLength = merchant.tag.length;
    // Saving each menu to menuData, then pass to the widget
    final menuData = <Widget>[];
    for (final menuList in merchant.menu.entries) {
      final key = menuList.key;
      final value = menuList.value;
      menuData.add(Text('$key: Rp $value,-'));
    }
    ;

    final BoxDecoration detailDecoration = BoxDecoration(
      color: const Color.fromARGB(255, 228, 228, 228).withOpacity(0.2),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(252, 225, 208, 1),
              Color.fromRGBO(255, 173, 214, 1),
              Color.fromRGBO(162, 186, 245, 1),
            ],
          ),
        ),
        // background-image: linear-gradient( 103.3deg,  rgba(252,225,208,1) 30%, rgba(255,173,214,1) 55.7%, rgba(162,186,245,1) 81.8% );
        child: ListView(
          children: [
            Stack(
              children: <Widget>[
                /// Merchant background image
                Image.asset(
                  merchant.img[0],
                ),

                /// Back arrow button
                Container(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.purple,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),

                /// Merchant Little Summary Box
                Container(
                  width: 300,
                  height: 200,
                  margin: const EdgeInsets.only(top: 290, left: 50, right: 50),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 161, 60, 255)
                        .withOpacity(0.3),
                    border: Border.all(
                        color: const Color.fromARGB(255, 106, 1, 175),
                        width: 3),
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /// Box Merchant name
                        SizedBox(
                          child: Text(
                            merchant.name,
                            style: const TextStyle(
                                fontSize: 36,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        /// Box Merchant Tags
                        Container(
                          height: 70,
                          // align all tag to center based on cross axis
                          alignment: Alignment.center,
                          child: Wrap(
                            // align all tag to center based on main axis
                            alignment: WrapAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < tagLength; i++)
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  child: TagCard(
                                    merchant: merchant,
                                    index: i,
                                    color:
                                        const Color.fromRGBO(198, 50, 224, 0.8),
                                    textColor: Colors.white,
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Open Time
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  Text(
                                    merchant.openTime,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  const Icon(
                                    Icons.star_rounded,
                                    color: Colors.yellow,
                                    size: 30,
                                  ),
                                  Text(
                                    merchant.rating.toString(),
                                    style: const TextStyle(
                                        color: Colors.yellow,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            ),

            // Overview
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: detailDecoration,
              // height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Overview',
                      style: headingStyle,
                    ),
                  ),
                  Text(merchant.overview),
                ],
              ),
            ),

            // Menu
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: detailDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Menu',
                      style: headingStyle,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: menuData,
                  ),
                ],
              ),
            ),

            // Location
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: detailDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Location',
                      style: headingStyle,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var i in merchant.location) Text(i),
                    ],
                  ),
                ],
              ),
            ),

            // Contact
            Container(
              padding: const EdgeInsets.all(20),
              // margin: const EdgeInsets.only(bottom: 10),
              decoration: detailDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Contact',
                      style: headingStyle,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (var i in merchant.contact) Text(i),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
