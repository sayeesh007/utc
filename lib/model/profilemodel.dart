class ProfileModel {
  String? sponserid;
  String? phoneno;
  String? gender;
  String? city;
  String? dob;
  String? dateofjoin;
  ProfileModel({
    this.sponserid,
    this.phoneno,
    this.gender,
    this.city,
    this.dob,
    this.dateofjoin,
  });
  Map<String, dynamic> toMap() => {
        'Sponser Id': sponserid,
        'Phone No': phoneno,
        'Gender': gender,
        'City': city,
        'Dob': dob,
        'Date of joining': dateofjoin
      };

  ProfileModel.fromMap(Map<String, dynamic> map) {
    sponserid = map['Sponser Id'];
    phoneno = map['Phone No'];
    gender = map['Gender'];
    city = map['City'];
    dob = map['Dob'];
    dateofjoin = map['Date of joining'];
  }
}
