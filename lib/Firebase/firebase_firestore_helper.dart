import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalprojectflutter/Models/productmodel.dart';
import 'package:finalprojectflutter/Models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirestoreHelper {
  FirestoreHelper._();

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
    TUser gdUser = TUser.fromMap(userData);
    return gdUser;
  }

  addNewProduct(Product product) async {
    DocumentReference<Map<String, dynamic>> doc =
        await firebaseFirestore.collection('products').add(product.toMap());
    product.id = doc.id;
  }

  Future<String> uploadImage(File file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('products/$fileName');
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }

  editProduct(Product newProduct) async {
    await firebaseFirestore
        .collection('products')
        .doc(newProduct.id)
        .update(newProduct.toMap());
  }

  deleteProruct(String productId) async {
    await firebaseFirestore.collection('products').doc(productId).delete();
  }

  Future<Product> getOneProduct(String productId) async {
    DocumentSnapshot<Map<String, dynamic>> productSnapshot =
        await firebaseFirestore.collection('products').doc(productId).get();
    Map<String, dynamic> productMap = productSnapshot.data();
    productMap['id'] = productSnapshot.id;
    Product product = Product.fromMap(productMap);
    return product;
  }

  Future<List<Product>> getAllProducts() async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore.collection('products').get();

    List<Product> allProducts = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      Product product = Product.fromMap(documentMap);
      return product;
    }).toList();
    return allProducts;
  }

  Future<List<TUser>> getAllUsers() async {
    QuerySnapshot<Map<String, dynamic>> alluserssSnapshot =
        await firebaseFirestore.collection('users').get();

    List<TUser> user = alluserssSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      TUser user = TUser.fromMap(documentMap);
      return user;
    }).toList();
    return user;
  }

  addProductToCart(Product product) async {
    String myid = FirebaseAuth.instance.currentUser.uid;
    firebaseFirestore
        .collection('users')
        .doc(myid)
        .collection('cart')
        .add(product.toMap());
  }
}
