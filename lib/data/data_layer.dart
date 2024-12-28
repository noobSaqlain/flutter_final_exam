import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    DocumentSnapshot snapshot =
        await _firestore.collection('data').doc('mzkP8XKavsL70j3aVlii').get();
    return snapshot.data() as Map<String, dynamic>?;
  } catch (e) {
    throw Exception('Failed to fetch data');
  }
}
