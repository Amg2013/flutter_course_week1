import 'package:flutter/material.dart';
import 'package:iti_project/list_view/list_view_data.dart';
import 'package:iti_project/utils/app_colors.dart';

class DataListView extends StatelessWidget {
  final DataGenerator dataGenerator;

  const DataListView({required this.dataGenerator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Example')),
      body: FutureBuilder<List<String>>(
        future: dataGenerator.generateData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final items = snapshot.data!;
          return ListView.separated(
            // scrollDirection: Axis.,
            separatorBuilder: (context, index) => Divider(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListItem(index, items[index]);
            },
          );
        },
      ),
    );
  }

  Widget ListItem(int index, String text) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 100,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(
          12,
        ), // Optional: adds rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            'https://miro.medium.com/v2/resize:fit:1400/1*QVkL_WEQN1Vo7m_IE7Q3vQ.png',
            height: 40,
            width: 60,
          ),
          Column(
            children: [
              Text(
                'Proudctu one ',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(text),
            ],
          ),
        ],
      ),
    );
  }
}
