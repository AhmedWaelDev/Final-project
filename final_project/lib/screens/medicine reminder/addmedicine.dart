import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/screens/homePage/navBar.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/screensappbar.dart';
import '../../CustomWidgets/textForm.dart';
import '../../roomDB/DatabaseHelper.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _addMedicineState();
}

class _addMedicineState extends State<AddMedicine> {
  int selectedIcon = -1;
  String? selectedphoto;
  String? breakfastChoice;
  String? lunchChoice;
  String? dinnerChoice;
  String? lunchTime;
  String? dinnerTime;
  String? breakfastTime;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController capsizeController = TextEditingController();
  final TextEditingController causeController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final List<String> medicineIcons = [
      "assets/images/medicine type/medicine 1.png",
      "assets/images/medicine type/medicine.png",
      "assets/images/medicine type/drugs 1.png",
      "assets/images/medicine type/syringe 1.png",
      "assets/images/medicine type/dropper.png",
    ];

    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: size.width * 35 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        height: size.height,
        width: size.width,
        color: bgCOlor,
        child: Column(
          children: [
            const screensappbar(name: "Medicine Reminder"),
            SizedBox(
              height: size.height * 50 / 932,
            ),
            Expanded(
              child: ListView(children: [
                myTextFrom(
                  mycontroller: nameController,
                  label: "Medicine name",
                ),
                SizedBox(
                  height: size.height * 20 / 932,
                ),

                Text(
                  "Starting day",
                  style: TextStyle(
                      fontSize: size.height * 20 / 932,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 20 / 932,
                ),
                SizedBox(
                  height: size.height * 0.15,
                  child: DatePicker(
                    DateTime.now(),
                    height: size.height * 100 / 932,
                    width: size.width * 60 / 320,
                    initialSelectedDate: DateTime.now(),
                    dayTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                    selectionColor: const Color(0xFF50B7C5),
                    onDateChange: (date) {
                      setState(() {
                        _selectedDate = date;
                      });
                      print(_selectedDate);
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 20 / 932,
                ),
                Text(
                  "Type",
                  style: TextStyle(
                      fontSize: size.height * 20 / 932,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 20 / 932,
                ),
                SizedBox(
                  height: size.height * 100 / 932,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: medicineIcons.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: MaterialButton(
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                width: size.height * 2 / 932,
                                color: selectedIcon == index
                                    ? const Color(0xFF50B7C5)
                                    : Colors.white,
                              )),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              selectedIcon = index;
                              selectedphoto = medicineIcons[index];
                              print(selectedIcon);
                            });
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 10 / 320),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Image.asset(medicineIcons[index])),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 20 / 932,
                ),
                Text(
                  "Time",
                  style: TextStyle(
                      fontSize: size.height * 20 / 932,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 20 / 932,
                ),
                //choice chip
                myChoiseChip(size),
                SizedBox(
                  height: size.height * 20 / 932,
                ),
                Text(
                  "Select the time",
                  style: TextStyle(
                      fontSize: size.height * 20 / 932,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 20 / 932,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          breakfastTime == null ? "" : breakfastTime!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                        MaterialButton(
                          color: Colors.grey[800],
                          onPressed: () async {
                            final TimeOfDay? timeselected =
                                await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    initialEntryMode: TimePickerEntryMode.dial);
                            if (timeselected != null) {
                              setState(() {
                                breakfastTime =
                                    timeselected.format(context).toString();
                              });
                            }
                          },
                          child: const Text(
                            'Breakfast time',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          lunchTime == null ? "" : lunchTime!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                        MaterialButton(
                          color: Colors.grey[800],
                          onPressed: () async {
                            final TimeOfDay? timeselected =
                                await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    initialEntryMode: TimePickerEntryMode.dial);
                            if (timeselected != null) {
                              setState(() {
                                lunchTime =
                                    timeselected.format(context).toString();
                              });
                            }
                          },
                          child: const Text(
                            'Lunch time',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          dinnerTime == null ? "" : dinnerTime!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                        MaterialButton(
                          color: Colors.grey[800],
                          onPressed: () async {
                            final TimeOfDay? timeselected =
                                await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    initialEntryMode: TimePickerEntryMode.dial);
                            if (timeselected != null) {
                              setState(() {
                                dinnerTime =
                                    timeselected.format(context).toString();
                              });
                            }
                          },
                          child: const Text(
                            'Dinner time',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 50 / 932,
                ),
                Row(
                  children: [
                    newTextForm(
                        mycontroller: amountController,
                        size: size,
                        labelText: "Amount",
                        suffixText: "pill/meal"),
                    newTextForm(
                        mycontroller: durationController,
                        size: size,
                        labelText: "duration",
                        suffixText: "days"),
                  ],
                ),
                SizedBox(
                  height: size.height * 15 / 932,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: size.height * 50 / 932,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 6 / 320),
                        child: TextFormField(
                          controller: causeController,
                          decoration: InputDecoration(
                              prefixStyle:
                                  const TextStyle(color: Color(0xFF50B7C5)),
                              labelText: "cause",
                              hintStyle:
                                  const TextStyle(color: Color(0xffB2AAAA)),
                              contentPadding:
                                  EdgeInsets.only(left: size.width * 18 / 430),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    newTextForm(
                        mycontroller: capsizeController,
                        size: size,
                        labelText: "cap size",
                        suffixText: "mg"),
                  ],
                ),
                SizedBox(
                  height: size.height * 50 / 932,
                ),

                Padding(
                  padding: EdgeInsets.all(size.height * 25 / 932),
                  child: SizedBox(
                    height: size.height * 50 / 932,
                    child: MaterialButton(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onPressed: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const NewScreen()),
                        // );

                        _addMedicine();
                      },
                      color: const Color(0xFF50B7C5),
                      child: const Text("Add Reminder",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox myChoiseChip(Size size) {
    return SizedBox(
      height: size.height * 130 / 932,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Column(
            children: [
              ChoiceChip(
                label: Text(
                  'Before Breakfast',
                  style: TextStyle(
                    color: breakfastChoice == 'Before Breakfast'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                selected: breakfastChoice == 'Before Breakfast',
                selectedColor: const Color(0xFF50B7C5),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      breakfastChoice = 'Before Breakfast';
                    } else if (breakfastChoice == 'Before Breakfast') {
                      breakfastChoice = null; // Unselect if already selected
                    }
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  'After Breakfast',
                  style: TextStyle(
                    color: breakfastChoice == 'After Breakfast'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                selected: breakfastChoice == 'After Breakfast',
                selectedColor: const Color(0xFF50B7C5),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      breakfastChoice = 'After Breakfast';
                    } else if (breakfastChoice == 'After Breakfast') {
                      breakfastChoice = null; // Unselect if already selected
                    }
                  });
                },
              ),
            ],
          ),
          Column(
            children: [
              ChoiceChip(
                label: Text(
                  'Before Lunch',
                  style: TextStyle(
                    color: lunchChoice == 'Before Lunch'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                selected: lunchChoice == 'Before Lunch',
                selectedColor: const Color(0xFF50B7C5),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      lunchChoice = 'Before Lunch';
                    } else if (lunchChoice == 'Before Lunch') {
                      lunchChoice = null; // Unselect if already selected
                    }
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  'After Lunch',
                  style: TextStyle(
                    color: lunchChoice == 'After Lunch'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                selected: lunchChoice == 'After Lunch',
                selectedColor: const Color(0xFF50B7C5),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      lunchChoice = 'After Lunch';
                    } else if (lunchChoice == 'After Lunch') {
                      lunchChoice = null; // Unselect if already selected
                    }
                  });
                },
              ),
            ],
          ),
          Column(
            children: [
              ChoiceChip(
                label: Text(
                  'Before Dinner',
                  style: TextStyle(
                    color: dinnerChoice == 'Before Dinner'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                selected: dinnerChoice == 'Before Dinner',
                selectedColor: const Color(0xFF50B7C5),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      dinnerChoice = 'Before Dinner';
                    } else if (dinnerChoice == 'Before Dinner') {
                      dinnerChoice = null; // Unselect if already selected
                    }
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  'After Dinner',
                  style: TextStyle(
                    color: dinnerChoice == 'After Dinner'
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                selected: dinnerChoice == 'After Dinner',
                selectedColor: const Color(0xFF50B7C5),
                onSelected: (selected) {
                  setState(() {
                    if (selected) {
                      dinnerChoice = 'After Dinner';
                    } else if (dinnerChoice == 'After Dinner') {
                      dinnerChoice = null; // Unselect if already selected
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addMedicine() async {
    String name = nameController.text;
    String cause = causeController.text;
    int capsize = int.tryParse(capsizeController.text) ?? 0;
    int duration = int.tryParse(durationController.text) ?? 0;
    int amount = int.tryParse(amountController.text) ?? 0;
    int id = int.parse(CacheHelper().getData(key: "id"));

    if (name.isNotEmpty &&
        duration > 0 &&
        cause.isNotEmpty &&
        selectedphoto != null &&
        capsize > 0 &&
        amount > 0) {
      if ((breakfastTime != null || dinnerTime != null || lunchTime != null) &&
          (breakfastChoice != null ||
              dinnerChoice != null ||
              lunchChoice != null)) {
        bool allTimesSelected = true;
        if (breakfastChoice != null && breakfastTime == null) {
          allTimesSelected = false;
        }
        if (lunchChoice != null && lunchTime == null) {
          allTimesSelected = false;
        }
        if (dinnerChoice != null && dinnerTime == null) {
          allTimesSelected = false;
        }

        if (allTimesSelected) {
          for (int i = 0; i < duration; i++) {
            if (breakfastChoice != null) {
              DateTime breakfastdate = _selectedDate;
              Medicine breakfastMedicine = Medicine(
                  breakfastTime: breakfastTime!,
                  dinnerTime: "",
                  lunchTime: "",
                  type: selectedphoto!,
                  name: name,
                  cause: cause,
                  amount: amount,
                  breakfast: breakfastChoice!,
                  dinner: "",
                  lunch: "",
                  reminderTime: breakfastdate,
                  durationInDays: 1,
                  capsize: capsize,
                  id: id);
              DatabaseHelper().insertMedicine(breakfastMedicine);
              breakfastdate = breakfastdate.add(const Duration(days: 1));
            }
            if (lunchChoice != null) {
              DateTime lunchdate = _selectedDate;
              Medicine lunchMedicine = Medicine(
                  breakfastTime: "",
                  dinnerTime: "",
                  lunchTime: lunchTime!,
                  type: selectedphoto!,
                  name: name,
                  cause: cause,
                  amount: amount,
                  breakfast: "",
                  dinner: "",
                  lunch: lunchChoice!,
                  reminderTime: lunchdate,
                  durationInDays: 1,
                  capsize: capsize,
                  id: id);
              DatabaseHelper().insertMedicine(lunchMedicine);
              lunchdate = lunchdate.add(const Duration(days: 1));
            }
            if (dinnerChoice != null) {
              DateTime dinnerdate = _selectedDate;
              Medicine dinnerMedicine = Medicine(
                  breakfastTime: "",
                  dinnerTime: dinnerTime!,
                  lunchTime: "",
                  type: selectedphoto!,
                  name: name,
                  cause: cause,
                  amount: amount,
                  breakfast: "",
                  dinner: dinnerChoice!,
                  lunch: "",
                  reminderTime: dinnerdate,
                  durationInDays: 1,
                  capsize: capsize,
                  id: id);
              DatabaseHelper().insertMedicine(dinnerMedicine);
              dinnerdate = dinnerdate.add(const Duration(days: 1));
            }
            _selectedDate = _selectedDate.add(const Duration(days: 1));
          }
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Center(child: Text("medicine added successfully")),
            duration: Duration(seconds: 3),
          ));
          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => myNavBar(
                        isDoctor: CacheHelper().getData(key: "isDoctorAsBool"),
                      )),
              (Route<dynamic> route) => false,
            );
          });
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Close"),
                  ),
                ],
                title: Text(
                  "Error",
                  style: TextStyle(color: Colors.red[400]),
                ),
                content: const Text(
                    "Please select time for each selected choice chip"),
              );
            },
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
              ],
              title: Text(
                "Error",
                style: TextStyle(color: Colors.red[400]),
              ),
              content: const Text("Pick one time at least"),
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              ),
            ],
            title: Text(
              "Error",
              style: TextStyle(color: Colors.red[400]),
            ),
            content: const Text("Please fill all empty spaces"),
          );
        },
      );
    }
  }
}

class newTextForm extends StatelessWidget {
  const newTextForm({
    super.key,
    required this.size,
    required this.suffixText,
    required this.labelText,
    required this.mycontroller,
  });

  final Size size;
  final String suffixText;
  final String labelText;
  final TextEditingController mycontroller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height * 50 / 932,
        margin: EdgeInsets.symmetric(horizontal: size.width * 6 / 320),
        child: TextFormField(
          controller: mycontroller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              prefixStyle: const TextStyle(color: Color(0xFF50B7C5)),
              suffix: Padding(
                  padding: EdgeInsets.only(right: size.width * 20 / 320),
                  child: Text(suffixText)),
              labelText: labelText,
              hintStyle: const TextStyle(color: Color(0xffB2AAAA)),
              contentPadding: EdgeInsets.only(left: size.width * 18 / 430),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }
}
