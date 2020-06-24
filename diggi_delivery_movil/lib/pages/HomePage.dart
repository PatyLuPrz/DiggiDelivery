import 'package:diggi_delivery_movil/helpers/style.dart';
import 'package:diggi_delivery_movil/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.5,
        title: CustomText(
          text: 'Diggi Delivery',
          color: Colors.white,
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
            ],
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              accountName: CustomText(
                text: 'Diggi',
                color: white,
                weight: FontWeight.bold,
                size: 18.0,
              ),
              accountEmail:
                  CustomText(text: 'Delivery@gmail.com', color: Colors.white),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: CustomText(text: 'home'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "My orders"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Cart"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.exit_to_app),
              title: CustomText(text: "Log out"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.red,
              ),
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Find food and restaurant",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
