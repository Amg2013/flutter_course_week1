import 'package:flutter/material.dart';
import 'package:iti_project/list_view/list_view_data.dart';

class DataListView extends StatelessWidget {
  final DataGenerator dataGenerator;

  DataListView({required this.dataGenerator});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView Example')),
      body: FutureBuilder<List<String>>(
        future: dataGenerator.generateData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(items[index]));
              },
            );
          }
        },
      ),
    );
  }
}
