import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
//Add firebase_options.dart to the lib folder
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Export',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firestore Export'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Export Items'),
            onPressed: () {
              exportItems();
            },
          ),
        ),
      ),
    );
  }

  void exportItems() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final List<Map<String, dynamic>> items = [
      {
        'Name': 'Test2',
      },
      {
        'Name': 'Test',
        'Id': '2',
      },
      {
        //Add your items like the two above
      },
    ];

    // Export each item to Firestore
    for (int i = 0; i < items.length; i++) {
      try {
        await firestore.collection('Enter Collection Name Here').add(items[i]);
        print('Item ${i + 1} exported successfully');
      } catch (e) {
        print('Error exporting item ${i + 1}: $e');
      }
    }

    print('Export completed');
  }
}
