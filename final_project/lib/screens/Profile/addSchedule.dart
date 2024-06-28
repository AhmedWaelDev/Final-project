import 'package:final_project/cubits/auth/login/login_cubit.dart';
import 'package:final_project/cubits/doctor/add_schedule/add_schedule_cubit.dart';
import 'package:final_project/models/Helper.dart';
import 'package:final_project/screens/Profile/doctorProfile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';

class AddSchedule extends StatefulWidget {
  const AddSchedule({Key? key}) : super(key: key);

  @override
  _AppointmentReservationState createState() => _AppointmentReservationState();
}

class _AppointmentReservationState extends State<AddSchedule> {
  List<String> selectedTimes = [];
  List<String> endTimes = [];
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;
  late String finalSelectedStartDate =
      selectedStartDate.toString().replaceFirst(" 00:00:00.000", "");
  late String finalSelectedEndtDate =
      selectedEndDate.toString().replaceFirst(" 00:00:00.000", "");
  int timeDurationForSession = 30; // Default session duration

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgColor = Color(0xffe5e9f0);

    void showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
    }

    String getFormattedDate(DateTime? date) {
      return date != null
          ? DateFormat('yyyy-MM-dd').format(date)
          : 'No date selected';
    }

    void updateEndTimes() {
      endTimes = selectedTimes.map((time) {
        DateTime startTime = DateFormat("HH:mm:ss").parse(time);
        DateTime endTime =
            startTime.add(Duration(minutes: timeDurationForSession));
        return DateFormat("HH:mm:ss").format(endTime);
      }).toList();
    }

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is getUserDataLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.only(
                    top: size.width * 35 / 320,
                    right: size.width * 10 / 320,
                    left: size.width * 10 / 320,
                  ),
                  height: size.height,
                  width: size.width,
                  color: bgColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                              state is getUserDataSuccess
                                                  ? Text(
                                                      state.user.name,
                                                      style: TextStyle(
                                                        fontSize: size.height *
                                                            19 /
                                                            932,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  : Text(
                                                      "unknown",
                                                      style: TextStyle(
                                                        fontSize: size.height *
                                                            19 /
                                                            932,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                              state is getUserDataSuccess
                                                  ? Text(
                                                      specialties[state
                                                          .user.specialtyId!],
                                                      style: TextStyle(
                                                        fontSize: size.height *
                                                            16 /
                                                            932,
                                                        color: Colors.grey,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  : Text(
                                                      'unknow',
                                                      style: TextStyle(
                                                        fontSize: size.height *
                                                            16 /
                                                            932,
                                                        color: Colors.grey,
                                                      ),
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MaterialButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: selectedStartDate ??
                                              DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            selectedStartDate = DateTime(
                                              pickedDate.year,
                                              pickedDate.month,
                                              pickedDate.day,
                                            );
                                            finalSelectedStartDate =
                                                selectedStartDate
                                                    .toString()
                                                    .replaceFirst(
                                                        " 00:00:00.000", "");
                                          });
                                        }
                                      },
                                      color: const Color(0xff050b7c5),
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: size.height * 10 / 932,
                                        horizontal: size.height * 20 / 932,
                                      ),
                                      child: Text(selectedStartDate == null
                                          ? 'Select Start Date'
                                          : getFormattedDate(
                                              selectedStartDate)),
                                    ),
                                    SizedBox(height: size.height * 10 / 932),
                                    MaterialButton(
                                      onPressed: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate:
                                              selectedEndDate ?? DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            // Create new DateTime object without time
                                            selectedEndDate = DateTime(
                                              pickedDate.year,
                                              pickedDate.month,
                                              pickedDate.day,
                                            );
                                            finalSelectedEndtDate =
                                                selectedEndDate
                                                    .toString()
                                                    .replaceFirst(
                                                        " 00:00:00.000", "");
                                          });
                                        }
                                      },
                                      color: const Color(0xff050b7c5),
                                      textColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: size.height * 10 / 932,
                                        horizontal: size.height * 20 / 932,
                                      ),
                                      child: Text(selectedEndDate == null
                                          ? 'Select End Date'
                                          : getFormattedDate(selectedEndDate)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: size.height * 20 / 932),
                              Text(
                                'Select Time',
                                style: TextStyle(
                                  fontSize: size.height * 20 / 932,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: size.height * 200 / 932,
                                child: ListView(
                                  children: [
                                    Wrap(
                                      children: selectedTimes
                                          .map(
                                            (time) => Container(
                                              margin: EdgeInsets.all(
                                                  size.height * 20 / 932),
                                              padding: EdgeInsets.symmetric(
                                                vertical:
                                                    size.height * 10 / 932,
                                                horizontal:
                                                    size.height * 20 / 932,
                                              ),
                                              decoration: BoxDecoration(
                                                color: const Color(0xff050b7c5),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    time,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: const Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        selectedTimes
                                                            .remove(time);
                                                        updateEndTimes();
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                onPressed: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (pickedTime != null) {
                                    setState(() {
                                      String formattedTime =
                                          '${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}:00';
                                      selectedTimes.add(formattedTime);
                                      updateEndTimes();
                                    });
                                  }
                                },
                                color: const Color(0xff050b7c5),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: size.height * 10 / 932,
                                  horizontal: size.height * 20 / 932,
                                ),
                                child: const Text('+ Add Time'),
                              ),
                              SizedBox(height: size.height * 20 / 932),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Session Duration:',
                                    style: TextStyle(
                                      fontSize: size.height * 18 / 932,
                                    ),
                                  ),
                                  SizedBox(width: size.width * 10 / 320),
                                  TextButton(
                                    onPressed: () {
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (BuildContext context) {
                                          int initialMinutes =
                                              timeDurationForSession;

                                          return Container(
                                            height:
                                                300, // Adjusted height to fit content
                                            color: Colors.white,
                                            child: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        250, // Adjusted height to fit content
                                                    child: CupertinoTimerPicker(
                                                      mode:
                                                          CupertinoTimerPickerMode
                                                              .ms,
                                                      initialTimerDuration:
                                                          Duration(
                                                              minutes:
                                                                  initialMinutes),
                                                      onTimerDurationChanged:
                                                          (Duration duration) {
                                                        setState(() {
                                                          timeDurationForSession =
                                                              duration
                                                                  .inMinutes;
                                                          updateEndTimes();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  CupertinoButton(
                                                    color: const Color(
                                                        0xff050b7c5), // Main color
                                                    child: const Text(
                                                      'Done',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                              const Color(0xff050b7c5)),
                                      foregroundColor:
                                          WidgetStateProperty.all<Color>(
                                              Colors.white),
                                    ),
                                    child: Text(
                                      '$timeDurationForSession minutes',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: size.height * 20 / 932,
                                  vertical: size.height * 20 / 932,
                                ),
                                width: size.width,
                                child: BlocListener<AddScheduleCubit,
                                    AddScheduleState>(
                                  listener: (context, state) {
                                    if (state is AddScheduleSuccess) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.message),
                                        ),
                                      );
                                    } else if (state is AddScheduleFailure) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(state.errMessage),
                                        ),
                                      );
                                    }
                                  },
                                  child: state is AddScheduleLoading
                                      ? const CircularProgressIndicator()
                                      : MaterialButton(
                                          shape: BeveledRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          onPressed: () async {
                                            context
                                                .read<AddScheduleCubit>()
                                                .chaneToLoadingState();
                                            if (selectedStartDate == null ||
                                                selectedEndDate == null) {
                                              showErrorDialog(
                                                'Please select both start date and end date.',
                                              );
                                            } else if (selectedTimes.isEmpty) {
                                              showErrorDialog(
                                                'Please select at least one time slot.',
                                              );
                                            } else {
                                              for (int i = 0;
                                                  i < selectedTimes.length;
                                                  i++) {
                                                await context
                                                    .read<AddScheduleCubit>()
                                                    .AddSchedule(
                                                        finalSelectedStartDate,
                                                        finalSelectedEndtDate,
                                                        selectedTimes[i],
                                                        endTimes[i]);
                                              }
                                            }
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const doctorProfile()),
                                            );
                                          },
                                          color: const Color(0xff050b7c5),
                                          textColor: Colors.white,
                                          child: const Text('Save Schedule'),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
