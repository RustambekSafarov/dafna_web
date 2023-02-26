import 'package:dafna_web/widget/footer.dart';
import 'package:flutter/material.dart';

import '../service/dafna_api.dart';
import '../widget/appbar_view.dart';

class Contactcreen extends StatelessWidget {
  const Contactcreen({super.key});
  static const routeName = '/contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarView(),
        toolbarHeight: 122,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder(
            future: getContact(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Column(
                        children: [
                          snapshot.data![index]['branches_name'],
                          snapshot.data![index]['address'.toString()],
                          snapshot.data![index]['datetime'.toString()],
                          snapshot.data![index]['menefer'.toString()],
                          snapshot.data![index]['main_contacts'.toString()]
                        ],
                      )
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                throw Exception('Error a');
              }
            },
          ),
          const Footer(),
        ],
      ),
    );
  }
}
