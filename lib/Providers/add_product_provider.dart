import 'dart:developer';
import 'dart:io';
import 'package:finalprojectflutter/Firebase/firebase_firestore_helper.dart';
import 'package:finalprojectflutter/Models/productmodel.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:finalprojectflutter/Screens/AddProductScreen/add_product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddProductProvider extends ChangeNotifier {
  File file;
  String imageUrl;
  List<Product> allProducts;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  pickNewImage() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file.path);
    notifyListeners();
  }

  addProduct() async {
    String imageUrl =
        await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    Product product = Product(
        name: nameController.text,
        descriptionProduct: descriptionController.text,
        price: num.parse(priceController.text));
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.addNewProduct(product);
    getAllProducts();
    Navigator.of(RouterClass.routerClass.routerKey.currentState.context).pop();
  }

  editProduct(String productiD) async {
    log(productiD ?? 'null');
    if (file != null) {
      this.imageUrl =
          await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    }
    Product product = Product(
        id: productiD,
        name: nameController.text,
        descriptionProduct: descriptionController.text,
        price: num.parse(priceController.text));
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.editProduct(product);
    getAllProducts();
    Navigator.of(RouterClass.routerClass.routerKey.currentState.context).pop();
  }

  goToEditProduct(Product product) {
    this.file = null;
    this.nameController.text = product.name;
    this.descriptionController.text = product.descriptionProduct;
    this.priceController.text = product.price.toString();
    this.imageUrl = product.imageUrl;
    notifyListeners();
    RouterClass.routerClass.pushToSpecificScreenUsingWidget(AddProductScreen(
      isForEdit: true,
      productId: product.id,
    ));
  }

  getAllProducts() async {
    this.allProducts = await FirestoreHelper.firestoreHelper.getAllProducts();
    notifyListeners();
  }

  deleteProduct(String productiD) async {
    await FirestoreHelper.firestoreHelper.deleteProruct(productiD);
    getAllProducts();
  }
}
