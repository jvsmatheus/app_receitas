import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  DatabaseService._();
  static final DatabaseService _instance = DatabaseService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DatabaseService._instance._firestore;
  }

}