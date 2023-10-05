
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'SecondPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late StreamSubscription subscription;

  var isDeviceConnected = false;
  bool isAlertSet = false;




  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  void getConnectivity()=>
      subscription = Connectivity().onConnectivityChanged.listen(
              (ConnectivityResult result) async {

                isDeviceConnected = await InternetConnectionChecker().hasConnection;

                if(!isDeviceConnected && isAlertSet == false){
                  showDialogBox();
                  setState(()=> isAlertSet = true);

                }
      },

      );
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  showDialogBox()=> showCupertinoDialog(
      context: context,
      builder: (BuildContext context)=> CupertinoAlertDialog(
        title: Text('No Internet Connection!'),
        content: Text('Please Check Your Internet Connection!'),
        actions: [
          TextButton(onPressed: ()async{
            Navigator.pop(context, 'Cancel');
            setState(()=> isAlertSet = false);
            isDeviceConnected =
                await InternetConnectionChecker().hasConnection;
            if(!isDeviceConnected){
              showDialogBox();
              setState(()=> isAlertSet = true);
            }

          }, child: Text('Ok'))
        ],

      ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connectivity Check'),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> SecondPage()));

            }, child: Text('Next Page'))


          ],
        ),
      ),

    );
  }





}

