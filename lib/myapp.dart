import 'package:flutter/material.dart';
import 'contacthome.dart';

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      title: 'Contact List',
      debugShowCheckedModeBanner: false,
      home: ContactHomePage(),
    );
  }
}
