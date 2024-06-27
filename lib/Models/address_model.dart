class AddressModel {
  // int userId;
  String firstName;
  String lastName;
  String addressLine1;
  String? addressLine2 = '';
  String city;
  String state;
  String zipCode;
  String country;

  AddressModel({
    // required this.userId,
    required this.firstName,
    required this.lastName,
    required this.addressLine1,
    this.addressLine2,
    required this.state,
    required this.city,
    required this.country,
    required this.zipCode
  });


  factory AddressModel.fromJson(Map<String,dynamic>json){
    return AddressModel(
      // userId: json['user_id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        addressLine1: json['address_line_1'],
        addressLine2: json['address_line_2'],
        city: json['city'],
        country: json['country'],
        state: json['state'] ,
        zipCode: json['zip_code']
    );
  }

}