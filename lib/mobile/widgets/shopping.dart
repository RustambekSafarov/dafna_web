import 'package:dafna_web/mobile/services/get_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShoppingWidget extends StatelessWidget {
  const ShoppingWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                  width: 100,
                  child: Image.network(
                      'https://ogabek007.pythonanywhere.com/${snapshot.data!['carts'][index]['img_url']}'),
                ),
                Text(snapshot.data!['carts'][index]['name']),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_circle_outline),
                    ),
                    Text('$numberOf'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.remove_circle_outline),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(snapshot.data!['carts'][index]['price'].toString()),
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.delete),
                    ),
                  ],
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
