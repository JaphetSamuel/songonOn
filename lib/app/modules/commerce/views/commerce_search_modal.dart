import 'package:flutter/material.dart';

class CommerceSearchModal extends StatelessWidget {
  final TextEditingController nomSearchController = TextEditingController(text:null);
  CommerceSearchModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 250,
        child: Column(
          children: [
            TextField(
              controller: nomSearchController,
              decoration: InputDecoration(
                hintText: "Rechercher un commerce",
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  onPressed: () => nomSearchController.clear(),
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, nomSearchController.text);
              },
              child: Text("Rechercher"),
            )
          ],
        ),
      ),
    );
  }
}
