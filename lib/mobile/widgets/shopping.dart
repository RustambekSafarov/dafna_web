import 'package:dafna_web/services/get_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShoppingWidget extends StatefulWidget {
  const ShoppingWidget({super.key});

  @override
  State<ShoppingWidget> createState() => _ShoppingWidgetState();
}

class _ShoppingWidgetState extends State<ShoppingWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.2;
    int numberOf = 1;
    return FutureBuilder(
      future: getCart(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!['carts'].length,
            itemBuilder: (context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  width: width,
                  child: Image.network(
                      'https://ogabek007.pythonanywhere.com/${snapshot.data!['carts'][index]['img_url']}'),
                ),
                SizedBox(
                    width: width + 10,
                    child: Text(
                      snapshot.data!['carts'][index]['name'],
                      maxLines: 1,
                    )),
                SizedBox(
                  width: width,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            numberOf != 0 ? numberOf -= 1 : 0;
                          });
                        },
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                      Text('$numberOf'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            numberOf += 1;
                          });
                        },
                        icon: Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width,
                  child: Column(
                    children: [
                      Text(snapshot.data!['carts'][index]['price'].toString() +
                          ' so\'m'),
                      InkWell(
                        onTap: () {
                          setState(() {
                            deleteCart(snapshot.data!['carts'][index]['id']);
                          });
                        },
                        child: Icon(Icons.delete),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SpinKitHourGlass(
              size: 30,
              color: Colors.black,
            ),
          );
        } else {
          throw Exception('Network Error');
        }
      },
    );
  }
}
