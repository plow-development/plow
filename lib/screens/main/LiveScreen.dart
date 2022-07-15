import 'package:flutter/material.dart';
import 'package:plow/models/BroadcastsModels.dart';
import 'package:plow/services/ApiService.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BroadcastsModel>>(
      future: ApiService().getAllBroadcast(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index) {
                return Stack(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(width: double.infinity,
                            height: double.infinity,
                            child: Image.network(snapshot.data![index].preview, fit: BoxFit.fitWidth,)),),
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
                            snapshot.data![index].title,
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                            textAlign: TextAlign.center,
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
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );

  }
}
