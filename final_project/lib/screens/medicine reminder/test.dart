import 'package:final_project/roomDB/DatabaseHelper.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  String time = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Screen'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
          onPressed: () {
            _addDataToDatabase();
          },
          child: const Text('Add Data to Database'),
        ),
        ElevatedButton(
          onPressed: () {
            if (time == TimeOfDay.now().format(context).toString()) {
              print(
                  "yeeeeeeeeeeeeeeeeeeeeeeees\n${TimeOfDay.now().format(context)}");
            }
            print(TimeOfDay.now().format(context).toString());
          },
          child: const Text('compair'),
        ),
        ElevatedButton(
          onPressed: () async {
            await _databaseHelper.mydeleteDatabase();
          },
          child: const Text(' delete it '),
        ),
        ElevatedButton(
          onPressed: () async {
            final TimeOfDay? timeselected = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.dial);
            if (timeselected != null) {
              time = timeselected.format(context).toString();
              print(time);
            }
          },
          child: const Text(' time picker'),
        ),
        const PrintDataButton()
      ]),
    );
  }

  Future<void> _addDataToDatabase() async {
    // Example of adding data to the database
    Medicine medicine = Medicine(
      breakfastTime: "breakfastTime",
      dinnerTime: "dinnerTime",
      lunchTime: "lunchTime",
      type: "this is type",
      name: 'mymedicine',
      breakfast: 'Breakfast',
      lunch: 'Lunch',
      dinner: 'Dinner',
      amount: 120,
      cause: 'Some Cause',
      reminderTime: DateTime.now(),
      durationInDays: 1,
      capsize: 15,
    );

    // Insert the medicine into the database
    await _databaseHelper.insertMedicine(medicine);

    // Optionally, perform other actions like navigation, updating UI, etc.
  }
}

class PrintDataButton extends StatelessWidget {
  const PrintDataButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        printData(); // Call the printData function when the button is pressed
      },
      child: const Text('Print All Data'),
    );
  }

  void printData() async {
    // Initialize your database
    DatabaseHelper databaseHelper = DatabaseHelper();
    // Get all medicines from the database
    List<Medicine> medicines = await databaseHelper.getMedicines();

    // Print all medicines
    for (Medicine medicine in medicines) {
      print('id: ${medicine.id}');
      print('Medicine: ${medicine.name}');
      print('time: ${medicine.breakfastTime}');
      print('Breakfast: ${medicine.breakfast}');
      print('Lunch: ${medicine.lunch}');
      if (medicine.dinner == "") {
        print("dinier is null");
      } else {
        print('Dinner: ${medicine.dinner}');
      }
      print('Amount: ${medicine.amount}');
      print('type: ${medicine.type}');
      print('Cause: ${medicine.cause}');
      print('Reminder Time: ${medicine.reminderTime}');
      print('Duration in Days: ${medicine.durationInDays}');
      print('capsize in Days: ${medicine.capsize}');
      print('------------------------');
    }
  }
}
