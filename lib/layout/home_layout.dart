import 'package:flutter/material.dart';
import 'package:news/models/soura_response.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder<SouraResponse>(
        future: APIManger.getSources(context),
        builder: (context, snaphot) {
          if (snaphot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snaphot.hasError || snaphot.data?.status!='ok') {
            return Center(child: Text('${snaphot.data?.message}'));
          }
          var source=snaphot.data?.sources;
          return ListView.builder(
            itemCount: source?.length,
            itemBuilder: (context, index) {
              return Text('${source?[index].name}');
            },
          );
        },
      ),
    );
  }
}
