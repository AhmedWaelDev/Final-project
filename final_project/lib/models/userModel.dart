class UserModel {
  final String? image;
  final String name;
  final String? date_of_birth;
  final String? gender;
  final String? blood_group;
  final String phone;
  final String? price;
  final String email;
  final String specialtyId;
  final String isDoctor;
  final String? experience;
  final String? stars;
  final String? p_counter;

  UserModel(
      {this.image,
      required this.name,
      this.date_of_birth,
      this.gender,
      this.blood_group,
      required this.phone,
      this.price,
      required this.email,
      required this.specialtyId,
      required this.isDoctor,
      this.experience,
      this.stars,
      this.p_counter});

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
        image: jsonData["image"],
        name: jsonData["name"],
        date_of_birth: jsonData["date_of_birth"],
        gender: jsonData["gender"],
        blood_group: jsonData["blood_group"],
        phone: jsonData["phone"],
        price: jsonData["price"],
        email: jsonData["email"],
        specialtyId: jsonData["specialtyId"],
        isDoctor: jsonData["isDoctor"],
        experience: jsonData["experience"],
        stars: jsonData["stars"],
        p_counter: jsonData["p_counter"]);
  }
}
