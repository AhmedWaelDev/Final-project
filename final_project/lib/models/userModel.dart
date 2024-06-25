class UserModel {
  final int userId;
  final String? image;
  final String name;
  final String? date_of_birth;
  final String? gender;
  final String? blood_group;
  final String phone;
  final String? price;
  final String email;
  final int specialtyId;
  var isDoctor; // This should be an int representing 0 or 1
  final String? experience;
  final String? stars;
  final int p_counter;

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
    print('Parsing JSON data: $jsonData'); // Debug statement

    return UserModel(
      userId: jsonData["userId"] ?? 0,
      image: jsonData["image"] as String?,
      name: jsonData["name"] ?? "",
      date_of_birth: jsonData["date_of_birth"] as String?,
      gender: jsonData["gender"] as String?,
      blood_group: jsonData["blood_group"] as String?,
      phone: jsonData["phone"] ?? "",
      price: jsonData["price"] as String?,
      email: jsonData["email"] ?? "",
      specialtyId: jsonData["specialtyId"] ?? 0,
      isDoctor: jsonData[
          "isDoctor"], // Ensure this correctly reflects your JSON structure
      experience: jsonData["experience"] as String?,
      stars: jsonData["stars"] as String?,
      p_counter: jsonData["p_counter"] ?? 0,
    );
  }
  bool isDoctorAsBool() {
    return isDoctor == 1;
  }
}
