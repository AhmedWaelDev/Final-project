import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/Appointment/create_appointment/create_appointment_cubit.dart';
import 'package:final_project/cubits/paitent/get_all_doctors_for_spciality/get_doctors_for_spciality_cubit.dart';
import 'package:final_project/models/Helper.dart';
import 'package:final_project/screens/homePage/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

final String formated = DateFormat('yyyy-MM-dd').format(DateTime.now());
String formatedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

class appointmentReservation extends StatefulWidget {
  const appointmentReservation(
      {Key? key,
      required this.name,
      required this.speciality,
      required this.price,
      required this.doctorID,
      required this.image})
      : super(key: key);
  final String name;
  final String speciality;
  final String image;
  final int price;
  final int doctorID;

  @override
  _AppointmentReservationState createState() => _AppointmentReservationState();
}

class _AppointmentReservationState extends State<appointmentReservation> {
  int _selectedTimeIndex = -1;
  String selctedTime = "0";
  late int schdualeId;
  String dateSelcted = formatedDate;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgColor = Color(0xffe5e9f0);

    return BlocProvider(
      create: (context) => GetDoctorsForSpcialityCubit()
        ..getDoctorSchedule(widget.doctorID, formatedDate),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: size.height * 20 / 932,
                        ),
                        padding: EdgeInsets.all(size.height * 20 / 932),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xff050b7c5)
                              .withAlpha((255 * 0.07).toInt()),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: size.width * 100 / 320,
                                  height: size.width * 100 / 320,
                                  child: ClipOval(
                                    child: Image.network(
                                      widget.image,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        // Fallback to default image if there's an error
                                        return Image.asset(
                                          'assets/images/default-avatar.jpg',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
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
                                        widget.name,
                                        style: TextStyle(
                                          fontSize: size.height * 19 / 932,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        widget.speciality,
                                        style: TextStyle(
                                          fontSize: size.height * 16 / 932,
                                          color: Colors.grey,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Price : ${widget.price} pts',
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
                          ],
                        ),
                      ),
                      Text(
                        'Select Date',
                        style: TextStyle(
                            fontSize: size.height * 20 / 932,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      BlocBuilder<GetDoctorsForSpcialityCubit,
                          GetAllDoctorsForSpcialityState>(
                        builder: (context, state) {
                          return SizedBox(
                            height: size.height * 150 / 932,
                            child: DatePicker(
                              DateTime.now(),
                              height: size.height * 100 / 932,
                              width: size.width * 60 / 320,
                              initialSelectedDate: DateTime.now(),
                              dayTextStyle:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              selectionColor: const Color(0xFF50B7C5),
                              onDateChange: (date) {
                                dateSelcted = date
                                    .toString()
                                    .replaceFirst("00:00:00.000", "");
                                context
                                    .read<GetDoctorsForSpcialityCubit>()
                                    .getDoctorSchedule(
                                        widget.doctorID, dateSelcted);
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(height: size.height * 20 / 932),
                      Text(
                        'Available Time',
                        style: TextStyle(
                            fontSize: size.height * 20 / 932,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      BlocBuilder<GetDoctorsForSpcialityCubit,
                          GetAllDoctorsForSpcialityState>(
                        builder: (context, state) {
                          return state is GetDoctorsSchedulesLoading
                              ? SizedBox(
                                  height: size.height * 100 / 932,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : state is GetDoctorsSchedulesSuccess
                                  ? SizedBox(
                                      height: size.height * 100 / 932,
                                      child: state.schedule.isEmpty
                                          ? Center(
                                              child: Text(
                                              "no Time Available",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize:
                                                      size.height * 20 / 932,
                                                  fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,
                                            ))
                                          : ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: state.schedule.length,
                                              itemBuilder: (context, index) {
                                                schdualeId =
                                                    state.schedule[index]["id"];
                                                final time =
                                                    state.schedule[index]
                                                        ["start_time"];
                                                final isReserved =
                                                    state.schedule[index]
                                                            ["is_reserved"] ==
                                                        1;

                                                return Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal:
                                                          size.width * 5 / 320),
                                                  child: ChoiceChip(
                                                    label: Text(
                                                      convertTimeFormat(time),
                                                      style: TextStyle(
                                                        color: isReserved
                                                            ? Colors.red[900]
                                                            : (_selectedTimeIndex ==
                                                                    index
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                    ),
                                                    selected:
                                                        _selectedTimeIndex ==
                                                            index,
                                                    onSelected: isReserved
                                                        ? null // Disable the chip if reserved
                                                        : (selected) {
                                                            setState(() {
                                                              if (selected) {
                                                                _selectedTimeIndex =
                                                                    index;
                                                                selctedTime =
                                                                    time;
                                                              } else {
                                                                _selectedTimeIndex =
                                                                    -1;
                                                                selctedTime =
                                                                    "0";
                                                              }
                                                            });
                                                          },
                                                    selectedColor: isReserved
                                                        ? Colors.red
                                                        : const Color(
                                                            0xFF50B7C5),
                                                    backgroundColor: isReserved
                                                        ? Colors.red
                                                        : Colors.transparent,
                                                    selectedShadowColor:
                                                        Colors.transparent,
                                                    shadowColor:
                                                        Colors.transparent,
                                                  ),
                                                );
                                              },
                                            ),
                                    )
                                  : state is GetDoctorsSchedulesFailure
                                      ? Text(state.message)
                                      : Container();
                        },
                      ),
                      BlocConsumer<CreateAppointmentCubit,
                          CreateAppointmentState>(
                        listener: (context, state) {
                          if (state is CreateAppointmentsuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Appointment booked successfully"),
                              ),
                            );
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => myNavBar(
                                        isDoctor: CacheHelper()
                                            .getData(key: "isDoctorAsBool"),
                                      )),
                              (Route<dynamic> route) => false,
                            );
                          } else if (state is CreateAppointmentFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.errMessage),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return state is CreateAppointmentLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.height * 20 / 932,
                                      vertical: size.height * 100 / 932),
                                  width: size.width,
                                  child: MaterialButton(
                                    shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    onPressed: () {
                                      if (selctedTime != "0") {
                                        final int PatientId = int.parse(
                                            CacheHelper().getData(key: "id"));
                                        context
                                            .read<CreateAppointmentCubit>()
                                            .CreateAppointment(
                                                PatientId,
                                                widget.doctorID,
                                                schdualeId,
                                                dateSelcted,
                                                selctedTime);
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text("please select time"),
                                          ),
                                        );
                                      }
                                    },
                                    color: const Color(0xFF50B7C5),
                                    child: const Text(
                                      "Book appointment",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
