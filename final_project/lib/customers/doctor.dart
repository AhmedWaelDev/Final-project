import 'package:final_project/cubits/online%20doctor/cubit/online_doc_cubit.dart';
import 'package:final_project/models/Helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../CustomWidgets/screensappbar.dart';
import '../CustomWidgets/DoctorsAppoint.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnlineDocCubit(),
      child: const DoctorsView(),
    );
  }
}

class DoctorsView extends StatefulWidget {
  const DoctorsView({super.key});

  @override
  _DoctorsViewState createState() => _DoctorsViewState();
}

class _DoctorsViewState extends State<DoctorsView> {
  int _selectedIndex = 0;
  final int _specialtyId = 1;

  @override
  void initState() {
    super.initState();
    context.read<OnlineDocCubit>().fetchOnlineDoctors(_specialtyId);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      context.read<OnlineDocCubit>().fetchOnlineDoctors(_specialtyId);
    } else {
      context.read<OnlineDocCubit>().fetchAllDoctors();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: size.width * 35 / 320,
          right: size.width * 10 / 320,
          left: size.width * 10 / 320,
        ),
        height: size.height,
        width: size.width,
        color: const Color(0xffe5e9f0),
        child: Column(
          children: [
            const screensappbar(name: "Doctors"),
            SizedBox(height: size.height * 20 / 932),
            SizedBox(
              height: size.height * 70 / 932,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size.height * 25 / 932),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 20 / 932),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                  left: size.width * 35 / 430,
                  right: size.width * 35 / 430,
                  top: size.height * 20 / 932,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                width: size.width * 115 / 320,
                                color: _selectedIndex == 0
                                    ? Colors.cyan
                                    : Colors.white,
                                child: TextButton(
                                  child: Text(
                                    "Online",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 18 / 430,
                                      color: _selectedIndex == 0
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  onPressed: () => _onItemTapped(0),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                width: size.width * 115 / 320,
                                color: _selectedIndex == 1
                                    ? Colors.cyan
                                    : Colors.white,
                                child: TextButton(
                                  child: Text(
                                    "All",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * 18 / 430,
                                      color: _selectedIndex == 1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  onPressed: () => _onItemTapped(1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 20 / 932),
            Expanded(
              child: BlocBuilder<OnlineDocCubit, OnlineDocState>(
                builder: (context, state) {
                  print('DoctorsView - Current state: $state');
                  if (state is OnlineDocLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is OnlineDocLoaded) {
                    return ListView.builder(
                      itemCount: state.doctors.length,
                      itemBuilder: (context, index) {
                        final doctor = state.doctors[index];
                        print('Doctor data: $doctor'); // Add this line
                        return DoctorsAppoint(
                          name: doctor['name'] ?? 'No Name Available',
                          onChatPressed: () {},
                          onVideoCallPressed: () {},
                          rating: 3,
                          specialty: doctor['specialtyId'] != null
                              ? specialties[doctor['specialtyId']]
                              : 'Unknown Specialty',
                        );
                      },
                    );
                  } else if (state is OnlineDocError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('No data available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
