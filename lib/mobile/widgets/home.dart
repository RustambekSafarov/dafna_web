import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../services/get_service.dart';
import 'ideas_photos.dart';
import 'new_products.dart';
import 'recommended.dart';
import 'sponsors.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCatalog(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  // height: 600,
                  width: double.infinity,
                  child: Image(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                        'https://pg-edtr.archiproducts.com/desktop_1454x870_6c141cf8-889f-4604-890c-f8a1ec5644ad.jpg'),
                  ),
                ),
                // Image.network(
                //     'https://telegra.ph/file/9a476a924652ca1edfd9a.jpg'),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 100,
                    child: Divider(color: Colors.orangeAccent, thickness: 5),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        context.goNamed('/catalog-detail',
                            extra: snapshot.data![index]['id']);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://ogabek007.pythonanywhere.com/${snapshot.data![index]['img_url']}',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 8),
                child: Text(
                  'Yangilar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewProducts(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15, bottom: 8),
                child: Text(
                  'Tavsiyalar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RecommendationsM(),
              ),
              SponsorsM(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: IdeasPhotosM(),
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitHourGlass(
              size: 30,
              color: Colors.black,
            ),
          );
        } else {
          return Center(
            child: Text('Network Error!'),
          );
        }
      },
    );
  }
}
