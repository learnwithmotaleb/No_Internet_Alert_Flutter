import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Connectivity Check'),

      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);

          },
          child: Text('Back'),
        ),
      ),
    );
  }
}
