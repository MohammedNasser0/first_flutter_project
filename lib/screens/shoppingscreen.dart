import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Shoppingscreen extends StatefulWidget {
  const Shoppingscreen({super.key});

  @override
  State<Shoppingscreen> createState() => _ShoppingscreenState();
}

class _ShoppingscreenState extends State<Shoppingscreen> {
  final List<int> listLength = [1, 2, 3, 4, 5];
  final List<String> imageslist = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            // Navigates back to the previous screen
            Navigator.of(context).pop();
          },
        ),
        title: Text("shoppingScreen.Shopping Screen".tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'shoppingScreen.Our Products'.tr(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .20,
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    Image.asset(imageslist[index], fit: BoxFit.fill),
                itemCount: 4,
              ),
            ),
            const SizedBox(height: 5),
            GridView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
              ),
              itemBuilder: ((context, index) {
                return Card(
                  color: Colors.lightBlue,
                  child: Column(
                    children: [
                      Text("Item"),
                      Image.asset(
                        height: MediaQuery.of(context).size.height / 8,
                        "assets/images/2.jpg",
                        fit: BoxFit.contain,
                      ),
                      IconButton(
                        iconSize: 30,
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: Text("Item added to the cart"),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),

            Text(
              'shoppingScreen.Hot Offers'.tr(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listLength.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        "assets/images/2.jpg",
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 10,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(child: Text("data")),
                  ],
                );
              },
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
