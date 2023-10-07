import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommerceListPage(),
    );
  }
}

class CommerceListPage extends StatefulWidget {
  @override
  _CommerceListPageState createState() => _CommerceListPageState();
}

class _CommerceListPageState extends State<CommerceListPage> {
  List<String> commerces = [
    "Café de Quartier",
    "Librairie de Quartier",
    "Pharmacie de Quartier",
    // Ajoutez d'autres noms de commerce ici...
  ];

  List<String> filteredCommerces = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCommerces.addAll(commerces);
  }

  void filterCommerces(String query) {
    filteredCommerces.clear();
    if (query.isEmpty) {
      filteredCommerces.addAll(commerces);
    } else {
      filteredCommerces.addAll(commerces.where((commerce) =>
          commerce.toLowerCase().contains(query.toLowerCase())));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Commerces'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: filterCommerces,
              decoration: InputDecoration(
                labelText: 'Rechercher un commerce',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCommerces.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredCommerces[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}