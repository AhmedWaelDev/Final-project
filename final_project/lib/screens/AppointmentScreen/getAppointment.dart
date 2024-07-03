import 'package:final_project/CustomWidgets/getAppointmentOtherDoctors.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';
import 'package:final_project/cubits/paitent/get_all_doctors_for_spciality/get_doctors_for_spciality_cubit.dart';
import 'package:final_project/models/Helper.dart';
import 'package:final_project/screens/AppointmentScreen/appointmentReservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GetAppointment extends StatelessWidget {
  const GetAppointment(
      {super.key,
      required this.name,
      required this.spciality,
      required this.spcialityId,
      required this.patientNumber,
      required this.experiance,
      required this.rating,
      required this.ratingCOunt,
      required this.listIndex,
      required this.price,
      required this.doctorId});
  final String name;
  final String spciality;
  final int spcialityId;
  final int patientNumber;
  final int experiance;
  final double rating;
  final int ratingCOunt;
  final int listIndex;
  final int price;
  final int doctorId;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgColor = Color(0xffe5e9f0);
    return BlocProvider(
      create: (context) =>
          GetDoctorsForSpcialityCubit()..getAllDoctorsForSpciality(spcialityId),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: size.width * 35 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320,
          ),
          height: size.height,
          width: size.width,
          color: bgColor,
          child: Column(
            children: [
              const screensappbar(name: "Appointment"),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 25 / 932,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.height * 20 / 932),
                        padding: EdgeInsets.all(size.height * 20 / 932),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xff050b7c5)
                                .withAlpha((255 * 0.07).toInt())),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                                    width: size.width * 100 / 320,
                                    height: size.width * 100 / 320,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 20 / 320,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                          fontSize: size.height * 19 / 932,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        spciality,
                                        style: TextStyle(
                                          fontSize: size.height * 16 / 932,
                                          color: Colors.grey,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: size.height * 40 / 932),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '+$patientNumber',
                                        style: TextStyle(
                                          fontSize: size.height * 19 / 932,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'patients',
                                        style: TextStyle(
                                          fontSize: size.height * 16 / 932,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 30 / 932,
                                  child: const VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 2,
                                    width: 20,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$experiance years',
                                        style: TextStyle(
                                          fontSize: size.height * 19 / 932,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Experience',
                                        style: TextStyle(
                                          fontSize: size.height * 16 / 932,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 30 / 932,
                                  child: const VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 1,
                                    width: 20,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$rating',
                                        style: TextStyle(
                                          fontSize: size.height * 19 / 932,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Rating',
                                        style: TextStyle(
                                          fontSize: size.height * 16 / 932,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 20 / 932,
                      ),
                      Container(
                        width: size.width,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.height * 20 / 932),
                        padding: EdgeInsets.all(size.height * 20 / 932),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: const Color(0xff050b7c5)
                              .withAlpha((255 * 0.07).toInt()),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '$rating',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 60 / 932,
                                    color: Colors.black,
                                  ),
                                ),
                                RatingBarIndicator(
                                  rating: rating,
                                  itemSize: 20,
                                  itemBuilder: (context, index) {
                                    return const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: size.height * 10 / 932,
                                ),
                                Text(
                                  '($ratingCOunt)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 20 / 932,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: size.height * 50 / 932,
                              child: const VerticalDivider(
                                color: Colors.grey,
                                thickness: 2,
                                width: 20,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '$price pts',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 35 / 932,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'price',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 25 / 932,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 20 / 932,
                      ),
                      BlocBuilder<GetDoctorsForSpcialityCubit,
                          GetAllDoctorsForSpcialityState>(
                        builder: (context, state) {
                          return state is GetAllDoctorsForSpcialityLoading
                              ? const Center(child: CircularProgressIndicator())
                              : state is GetAllDoctorsForSpcialitySuccess
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: state.doctors.length - 1,
                                      itemBuilder: (context, index) {
                                        if (index >= listIndex) {
                                          index += 1;
                                        }
                                        final doctor = state.doctors[index];

                                        return getAppointmentOtherDoctors(
                                            function: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        GetAppointment(
                                                      doctorId:
                                                          doctor["id"] ?? 0,
                                                      price:
                                                          doctor["price"] ?? 0,
                                                      listIndex: index,
                                                      name:
                                                          "${doctor['name'] ?? 'unKown'}",
                                                      experiance: doctor[
                                                              'experience'] ??
                                                          0,
                                                      patientNumber:
                                                          doctor['p_counter'] ??
                                                              0,
                                                      rating: doctor["stars"]
                                                              is int
                                                          ? intToDouble(
                                                              doctor["stars"])
                                                          : (doctor["stars"] ??
                                                              0),
                                                      spciality: doctor[
                                                                  'specialtyId'] !=
                                                              null
                                                          ? specialties[doctor[
                                                                  'specialtyId'] -
                                                              1]
                                                          : 'Unknown Specialty',
                                                      ratingCOunt: doctor[
                                                              "ratings_count"] ??
                                                          0,
                                                      spcialityId: doctor[
                                                              "specialtyId"] ??
                                                          1,
                                                    ),
                                                  ));
                                            },
                                            name: doctor['name'] ?? 'No Name',
                                            rate: doctor["stars"] is int
                                                ? intToDouble(doctor["stars"])
                                                : (doctor["stars"] ?? 0),
                                            speciality: doctor['specialtyId'] !=
                                                    null
                                                ? specialties[
                                                    doctor['specialtyId'] - 1]
                                                : 'Unknown Specialty',
                                            size: size);
                                      },
                                    )
                                  : state is GetAllDoctorsForSpcialityFailure
                                      ? Text(state.message)
                                      : Container();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.height * 20 / 932,
                    vertical: size.height * 20 / 932),
                width: size.width,
                child: MaterialButton(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => appointmentReservation(
                                name: name,
                                doctorID: doctorId,
                                price: price,
                                speciality: spciality,
                              )),
                    );
                  },
                  color: const Color(0xFF50B7C5),
                  child: const Text("Add appointment",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
