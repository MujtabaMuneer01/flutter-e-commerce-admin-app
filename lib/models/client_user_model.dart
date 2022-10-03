class ClientModel {
  
  String name, password;
  int phone;

  ClientModel(
      {required this.name, required this.password, required this.phone});
  toMap() {
    return {'name': name, 'phone': phone, 'password': password};
  }

}
