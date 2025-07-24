abstract class DataGenerator {
  Future<List<String>> generateData();
}

class ApiDataGenerator extends DataGenerator {
  // final String apiUrl;

  ApiDataGenerator();

  @override
  Future<List<String>> generateData() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate delay
    return List.generate(
      10,
      (index) => 'APi Data repo >>>>>>>>Item ${index + 20}',
    );

    // final response = await http.get(Uri.parse(apiUrl));
    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body) as List;
    //   return data.map((item) => item.toString()).toList();
    // } else {
    //   throw Exception('Failed to load data from API');
    // }
  }
}

class DummyDataGenerator extends DataGenerator {
  @override
  Future<List<String>> generateData() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate delay
    return List.generate(
      10,
      (index) => 'Dummy Item <<<<<<<<<<<<<<<<<<<<<< ${index + 1}',
    );
  }
}
