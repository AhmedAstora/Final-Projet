import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalprojectflutter/Models/usermodel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreHelper {
  FirestoreHelper ._ ();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  createUserInFs(TUser gdUser) async {
    firebaseFirestore.collection('users').doc(gdUser.id).set(gdUser.toMap());
  }

  Future<TUser> getUserFromFs(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
    await firebaseFirestore.collection('users').doc(id).get();
    Map<String, dynamic> userData = document.data();
    userData['id'] = document.id;
    TUser gdUser =  TUser.fromMap (userData);
    return gdUser;
  }














}