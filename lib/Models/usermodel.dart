class TUser {
  String id;
  String Fname;
  String Lname;
  String phone;
  String address;
  String email;
  String password;
  bool isAdmin;

  TUser({
    this.id,
    this.isAdmin,
    this.Fname,
    this.Lname,
    this.phone,
    this.address,
    this.email,
    this.password,
  });

  TUser .fromMap (Map map) {
    this.Fname = map['Fname'];
    this.Lname = map['Lname'];
    this.phone = map['phone'];
    this.address = map['address'];
    this.email = map['email'];
    this.id = map['id'];
    this.isAdmin = map['isAdmin'] ?? false;
  }

  toMap() {
    return {
      'Fname': this.Fname,
      'Lname': this.Lname,
      'phone': this.phone,
      'address': this.address,
      'email': this.email
    };
  }


}