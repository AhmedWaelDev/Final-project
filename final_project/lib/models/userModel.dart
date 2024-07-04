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
  final String? stars;
  final int? p_counter;
  final int? points;
  final int? ratings_count;

  UserModel({
    required this.userId,
    this.image,
    this.points,
    this.ratings_count,
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
    this.p_counter,
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
      stars: jsonData["stars"].toString(),
      p_counter: jsonData["p_counter"],
      points: jsonData["points"],
      ratings_count: jsonData["ratings_count"],
    );
  }
  bool isDoctorAsBool() {
    return isDoctor == 1;
  }
}
