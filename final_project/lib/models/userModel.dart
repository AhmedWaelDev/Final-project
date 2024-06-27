class UserModel {
  final int userId;
  final String? image;
  final String name;
  final String? date_of_birth;
  final String? gender;
  final String? blood_group;
  final String phone;
  final int? price;
  final String email;
  final int? specialtyId;
  final int isDoctor;
  final int? experience;
  final int? stars;
  final int? p_counter;

  UserModel({
    required this.userId,
    this.image,
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
    required this.p_counter,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      userId: jsonData["userId"],
      image: jsonData["image"] as String?,
      name: jsonData["name"] ?? "",
      date_of_birth: jsonData["date_of_birth"] as String?,
      gender: jsonData["gender"] as String?,
      blood_group: jsonData["blood_group"] as String?,
      phone: jsonData["phone"] ?? "",
      price: jsonData["price"],
      email: jsonData["email"] ?? "",
      specialtyId: jsonData["specialtyId"],
      isDoctor: jsonData[
          "isDoctor"], // Ensure this correctly reflects your JSON structure
      experience: jsonData["experience"],
      stars: jsonData["stars"],
      p_counter: jsonData["p_counter"],
    );
  }
  bool isDoctorAsBool() {
    return isDoctor == 1;
  }
}
