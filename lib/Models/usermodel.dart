class TUser {
  String id;
  String Fname;
  String Lname;
  String phone;
  String address;
  String email;
  String password;
  bool isseller;
  String StoreName;
  String StoreWebAddress;
  String StoreDescription;
  String StoreType;
  String StoreCity;
  String StoreState;
  String StoreCourier;
  String StoreTagLine;
  bool haveStore;
  int numproducts ;
  int numfollowers;
  List<dynamic> favProduct ;
  List<dynamic> cartProduct ;

  TUser({
    this.id,
    this.numproducts = 0,
    this.numfollowers = 0,
    this.isseller ,
    this.Fname,
    this.Lname,
    this.phone,
    this.address,
    this.email,
    this.password,
    this.StoreName,
    this.StoreWebAddress,
    this.StoreDescription,
    this.StoreType,
    this.StoreCity,
    this.StoreState,
    this.StoreCourier,
    this.StoreTagLine,
    this.haveStore = false,
    this.favProduct ,
    this.cartProduct,

  });



  TUser.fromMap(Map map) {
    this.Fname = map['Fname'];
    this.numfollowers = map['numfollowers'];
    this.numproducts = map['numproducts'];
    this.Lname = map['Lname'];
    this.phone = map['phone'];
    this.address = map['address'];
    this.email = map['email'];
    this.id = map['id'];
    this.StoreName = map['StoreName'];
    this.StoreWebAddress = map['StoreWebAddress'];
    this.StoreDescription = map['StoreDescription'];
    this.StoreType = map['StoreType'];
    this.StoreCity = map['StoreCity'];
    this.StoreState = map['StoreState'];
    this.StoreCourier = map['StoreCourier'];
    this.StoreTagLine = map['StoreTagLine'];
    this.isseller = map['isseller'];
    this.haveStore = map['haveStore'];
    this.favProduct = map['favProduct'];
    this.cartProduct = map['cartProduct'];
  }

  toMap() {
    return {
      'Fname': this.Fname,
      'numproducts': this.numproducts,
      'numfollowers': this.numfollowers,
      'Lname': this.Lname,
      'phone': this.phone,
      'address': this.address,
      'email': this.email,
      'isseller': this.isseller,
      'StoreName': this.StoreName,
      'StoreWebAddress': this.StoreWebAddress,
      'StoreDescription': this.StoreDescription,
      'StoreType': this.StoreType,
      'StoreCity': this.StoreCity,
      'StoreState': this.StoreState,
      'StoreCourier': this.StoreCourier,
      'StoreTagLine': this.StoreTagLine,
      'haveStore': this.haveStore,
      'favProduct': this.favProduct,
      'cartProduct': this.cartProduct,
    };
  }
}
