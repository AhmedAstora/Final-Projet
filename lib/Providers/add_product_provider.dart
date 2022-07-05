import 'dart:developer';
import 'dart:io';
import 'package:finalprojectflutter/Firebase/firebase_auth_helper.dart';
import 'package:finalprojectflutter/Firebase/firebase_firestore_helper.dart';
import 'package:finalprojectflutter/Models/productmodel.dart';
import 'package:finalprojectflutter/Models/usermodel.dart';
import 'package:finalprojectflutter/Router/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AddProductProvider extends ChangeNotifier {

  int Qty = 1;

  AddProductProvider() {
    getAllProducts();
    Future.delayed(Duration(seconds: 3)).then((value) => getSpacificProduct());
    getUserFromFirebase();
  }

  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();
  GlobalKey<FormState> CreatProductFormKey = GlobalKey<FormState>();
  TUser loggedUser;
  File file;
  String imageUrl;
  List<Product> allProducts;
  List<Product> SearchProductsList = [Product()];
  int selected = 0;
  bool isFave = false;

  num SearchResult = 1;

  List<Product> sapcificProductStore = [Product(isLast: true)];
  List<Product> ProductStore = [];
  List<Product> AllFaveProduct = [];
  List<Product> FaveProduct = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController CategoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController OfferpriceController = TextEditingController();
  TextEditingController LocationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController ConditionController = TextEditingController();
  TextEditingController PriceTypeController = TextEditingController();
  String AdditionalDetailsController;

  /////////////////////////////////////////////

  TextEditingController searchController = TextEditingController();
  String valueSearch = '';

  SearchProduct(String value) {
    valueSearch = value;
    SearchProductsList = allProducts
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
    log(SearchProductsList.length.toString());
    log(searchController.text.toString());
  }

  getFaveProducts() async {
   await getUserFromFirebase();
    FaveProduct.clear();
    for (int i = 0; i < loggedUser.favProduct.length; i++) {
      FaveProduct.addAll(allProducts
          .where((element) => element.id == loggedUser.favProduct[i]));
    }
    log(FaveProduct.length.toString());
  }

  ////////////////////////////////////////////
  String nullValidator(String value) {
    if (value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  getSpacificProduct() {
    sapcificProductStore.clear();
    sapcificProductStore.add(Product(isLast: true));
    
    sapcificProductStore.addAll(
        allProducts.where((element) => element.idStore == loggedUser.id));

    notifyListeners();
  }

  getSpacificProductStore(String id) {
    ProductStore =
        allProducts.where((element) => element.idStore == id).toList();
    notifyListeners();
  }

  CreatProductValidate() {
    bool isSuccess = CreatProductFormKey.currentState.validate();
    return isSuccess;
  }

  pickNewImage() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file.path);
    notifyListeners();
  }

  addProduct() async {
    String imageUrl =
        await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    await getUserFromFirebase();
    Product product = Product(
      Storename: loggedUser.StoreName,
      idStore: FirebaseAuth.instance.currentUser.uid,
      name: nameController.text,
      category: CategoryController.text,
      descriptionProduct: descriptionController.text,
      price: num.parse(priceController.text),
      offerPrice: num.parse(OfferpriceController.text),
      locationDetails: LocationController.text,
      condition: ConditionController.text,
      priceType: PriceTypeController.text,
      AdditionalDetails: AdditionalDetailsController??'',
    );
    getUserFromFirebase();
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.addNewProduct(product);
    loggedUser.numproducts++;
    FirebaseAuthHelper.firebaseAuthHelper.editUser(loggedUser);
    getUserFromFirebase();
    await getAllProducts();
    Future.delayed(Duration(seconds: 3)).then((value) => getSpacificProduct());
    file = null;
    RouterClass.routerClass.popwidget();
    notifyListeners();
  }

  getUserFromFirebase() async {
    if (FirebaseAuth.instance.currentUser != null) {
      String userId = FirebaseAuth.instance.currentUser.uid;
      this.loggedUser =
          await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
      notifyListeners();
    }
  }

  editProduct(String productiD) async {
    log(productiD ?? 'null');
    if (file != null) {
      this.imageUrl =
          await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    }
    await getUserFromFirebase();
    Product product = Product(
      id: productiD,
      Storename: loggedUser.StoreName,
      idStore: FirebaseAuth.instance.currentUser.uid,
      name: nameController.text,
      category: CategoryController.text,
      descriptionProduct: descriptionController.text,
      price: num.parse(priceController.text),
      offerPrice: num.parse(OfferpriceController.text),
      locationDetails: LocationController.text,
      condition: ConditionController.text,
      priceType: PriceTypeController.text,
      AdditionalDetails: AdditionalDetailsController,
    );
    getUserFromFirebase();
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.editProduct(product);
    getUserFromFirebase();
    await getAllProducts();
    btnController.success();
    Future.delayed(Duration(seconds: 3)).then((value) => getSpacificProduct());
    RouterClass.routerClass.popwidget();
    notifyListeners();
  }

  goToEditProduct(Product product) {
    this.file = null;
    this.nameController.text = product.name;
    this.descriptionController.text = product.descriptionProduct;
    this.priceController.text = product.price.toString();
    this.imageUrl = product.imageUrl;
    notifyListeners();
    RouterClass.routerClass
        .pushToSpecificScreenUsingWidget('/AddProductScreen');
  }

  getAllProducts() async {
    this.allProducts = await FirestoreHelper.firestoreHelper.getAllProducts();
    notifyListeners();
  }

  deleteProduct(String productiD) async {
    await FirestoreHelper.firestoreHelper.deleteProruct(productiD);
    loggedUser.numproducts--;
    FirebaseAuthHelper.firebaseAuthHelper.editUser(loggedUser);
    getAllProducts();
    Future.delayed(Duration(seconds: 3)).then((value) => getSpacificProduct());
    notifyListeners();
  }

  EditFaveUser(TUser user) async {
    await FirebaseAuthHelper.firebaseAuthHelper.editUser(user);
    getUserFromFirebase();
  }
}
