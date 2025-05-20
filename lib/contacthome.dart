import 'package:flutter/material.dart';

class ContactHomePage extends StatefulWidget {
  @override
  _ContactHomePageState createState() => _ContactHomePageState();
}

class _ContactHomePageState extends State<ContactHomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  List<Map<String, String>> contacts = [];

  void addContact() {
    final name = nameController.text.trim();
    final number = numberController.text.trim();

    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contacts.add({'name': name, 'number': number});
        nameController.clear();
        numberController.clear();
      });
    }
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }
  void confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Confirmation"),
        content: Text("Are you sure to delete?"),
        actions: [
          TextButton(
            child: Icon(Icons.cancel),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Icon(Icons.delete),
            onPressed: () {
              deleteContact(index);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
            title: Text("Contact List")
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    children: [
    TextField(
    controller: nameController,
    decoration: InputDecoration(labelText: "Name",
    ),
    ),
    TextField(
    controller: numberController,
    decoration: InputDecoration(labelText: "Number"),
    keyboardType: TextInputType.phone,
    ),
    SizedBox(height: 12),
      ElevatedButton(
        onPressed: addContact,
        child: Text('Add'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,

        ),
      ),

      SizedBox(height: 16),
    Expanded(
    child: ListView.builder(
    itemCount: contacts.length,
    itemBuilder: (context, index) {
    final contact = contacts[index];
    return GestureDetector(
    onLongPress: () => confirmDelete(index),
    child: ListTile(
    leading: Icon(Icons.person),
    title: Text(contact['name']!),
      subtitle: Text(contact['number']!),
      trailing: Icon(Icons.call),
    ),
    );
    },
    ),
    ),
    ],
    ),
        ),
    );
  }
}

