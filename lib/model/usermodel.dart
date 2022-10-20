class Usermodel {
  String? sponserid;
  String? firstname;
  String? lastname;
  String? email;
  String? mobileno;
  Usermodel({
    required this.sponserid,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.mobileno,
  });
  Map<String, dynamic> toMap() => {
        'Sponser Id': sponserid,
        'First Name': firstname,
        'Last Name': lastname,
        'Email Id': email,
        'Mobile No': mobileno
      };

  Usermodel.fromMap(Map<String, dynamic> map) {
    sponserid = map['Sponser Id'];
    firstname = map['First Name'];
    lastname = map['Last Name'];
    email = map['Email Id'];
    mobileno = map['Mobile No'];
  }
}
