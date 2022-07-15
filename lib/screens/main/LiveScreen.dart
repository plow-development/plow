import 'package:flutter/material.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        itemCount: 6,
        itemBuilder: (BuildContext context, index) {
          return Stack(
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                      'https://avatars.mds.yandex.net/get-zen_doc/114080/pub_5a2a5046dcaf8e403ed362f5_5a2a50a779885e3496c417d7/scale_1200')),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        const Color(0x00000000),
                        const Color(0xff000000),
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    Text(
                      'Спартак – Зенит',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    Text(
                      'Стадион «Махад»',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12.0),
                    ),
                    SizedBox(
                      height: 8.0,
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
