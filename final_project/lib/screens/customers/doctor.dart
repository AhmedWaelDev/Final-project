import 'package:final_project/cubits/paitent/get_all_doctors_for_spciality/get_doctors_for_spciality_cubit.dart';
import 'package:final_project/models/Helper.dart';
import 'package:final_project/screens/AppointmentScreen/getAppointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../CustomWidgets/DoctorsAppoint.dart';

class Doctors extends StatelessWidget {
  const Doctors({super.key});

  @override
  Widget build(BuildContext context) {
    return const DoctorsView();
  }
}

class DoctorsView extends StatefulWidget {
  const DoctorsView({super.key});

  @override
  _DoctorsViewState createState() => _DoctorsViewState();
}

class _DoctorsViewState extends State<DoctorsView> {
  int _selectedIndex = 1;
  int _selectedSpecialtyIndex = 0;
  List<dynamic> allDoctors = [];
  List<dynamic> searchedDoctors = [];
  bool _isSearching = false;
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context
        .read<GetDoctorsForSpcialityCubit>()
        .getAllDoctorsForSpciality(_selectedSpecialtyIndex + 1);
    context
        .read<GetDoctorsForSpcialityCubit>()
        .getOnlineDoctorsForSpciality(_selectedSpecialtyIndex + 1);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      context
          .read<GetDoctorsForSpcialityCubit>()
          .getOnlineDoctorsForSpciality(_selectedSpecialtyIndex + 1);
    } else {
      context
          .read<GetDoctorsForSpcialityCubit>()
          .getAllDoctorsForSpciality(_selectedSpecialtyIndex + 1);
    }
  }

  void _searchDoctor(String searchedDoctor) {
    setState(() {
      searchedDoctors = allDoctors
          .where((doctor) =>
              doctor['name'] != null &&
              doctor['name']
                  .toLowerCase()
                  .contains(searchedDoctor.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 90 / 932,
        backgroundColor: const Color(0xffe5e9f0),
        title: _isSearching
            ? _buildSearchField()
            : const Text(
                "Doctors",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
        actions: _buildAppBarActions(),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.5),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          right: size.width * 10 / 320,
          left: size.width * 10 / 320,
        ),
        height: size.height,
        width: size.width,
        color: const Color(0xffe5e9f0),
        child: Column(
          children: [
            SizedBox(height: size.height * 20 / 932),
            SizedBox(
                height: size.height * 50 / 932,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: specialties.length,
                    itemBuilder: (context, index) {
                      bool isSelected = _selectedSpecialtyIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedSpecialtyIndex = index;
                            if (_selectedIndex == 1) {
                              context
                                  .read<GetDoctorsForSpcialityCubit>()
                                  .getAllDoctorsForSpciality(
                                      _selectedSpecialtyIndex + 1);
                            } else if (_selectedIndex == 0) {
                              context
                                  .read<GetDoctorsForSpcialityCubit>()
                                  .getOnlineDoctorsForSpciality(
                                      _selectedSpecialtyIndex + 1);
                            }
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 8.0),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.cyan : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: isSelected ? Colors.cyan : Colors.white,
                            ),
                          ),
                          child: Text(
                            specialties[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    })),
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
              child: _selectedIndex == 1
                  ? BlocBuilder<GetDoctorsForSpcialityCubit,
                      GetAllDoctorsForSpcialityState>(
                      builder: (context, state) {
                        return state is GetAllDoctorsForSpcialityLoading
                            ? const Center(child: CircularProgressIndicator())
                            : state is GetAllDoctorsForSpcialitySuccess
                                ? state.doctors.isEmpty
                                    ? const Center(
                                        child: Text("there is no doctors"),
                                      )
                                    : ListView.builder(
                                        itemCount: state.doctors.length,
                                        itemBuilder: (context, index) {
                                          final doctor = state.doctors[index];
                                          return DoctorsAppoint(
                                            image:
                                                "http://egyclinic.c1.is/items/image/${doctor["image"]}",
                                            name: doctor['name'] ??
                                                'No Name Available',
                                            onChatPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        GetAppointment(
                                                      image:
                                                          "http://egyclinic.c1.is/items/image/${doctor["image"]}",
                                                      doctorId:
                                                          doctor["id"] ?? 0,
                                                      price:
                                                          doctor["price"] ?? 0,
                                                      listIndex: index,
                                                      spcialityId: doctor[
                                                              "specialtyId"] ??
                                                          1,
                                                      name:
                                                          "${doctor['name'] ?? 'unKown'}",
                                                      experiance: doctor[
                                                              'experience'] ??
                                                          0,
                                                      patientNumber:
                                                          doctor['p_counter'] ??
                                                              0,
                                                      rating:
                                                          "${doctor["stars"] ?? "0"}",
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
                                                    ),
                                                  ));
                                            },
                                            rating: "${doctor["stars"] ?? 0}",
                                            specialty: doctor['specialtyId'] !=
                                                    null
                                                ? specialties[
                                                    doctor['specialtyId'] - 1]
                                                : 'Unknown Specialty',
                                          );
                                        },
                                      )
                                : state is GetAllDoctorsForSpcialityFailure
                                    ? Text(state.message)
                                    : TextButton(
                                        onPressed: () {
                                          context
                                              .read<
                                                  GetDoctorsForSpcialityCubit>()
                                              .getAllDoctorsForSpciality(
                                                  _selectedSpecialtyIndex + 1);
                                        },
                                        child: const Text("try again"));

                        //   return ListView.builder(
                        //     // itemCount: searchedDoctors.length,
                        //     itemBuilder: (context, index) {
                        //       // final doctor = searchedDoctors[index];
                        //       final doctor = state.doctors[index];
                        //       return DoctorsAppoint(
                        //         name: doctor['name'] ?? 'No Name Available',
                        //         onChatPressed: () {},
                        //         onVideoCallPressed: () {},
                        //         rating: 3, // Replace with actual rating data
                        //         specialty: doctor['specialtyId'] != null
                        //             ? _getSpecialtyNameById(doctor['specialtyId'])
                        //             : 'Unknown Specialty',
                        //       );
                        //     },
                        //   );
                        // } else if (state is GetAllDoctorsForSpcialityFailure) {
                        //   return  Center(child: Text(state.message));
                        // } else {
                        //   return const Center(child: Text('No data available'));
                        // }
                      },
                    )
                  :
                  //online doctors
                  BlocBuilder<GetDoctorsForSpcialityCubit,
                      GetAllDoctorsForSpcialityState>(
                      builder: (context, state) {
                        return state is GetOnlineDoctorsForSpcialityLoading
                            ? const Center(child: CircularProgressIndicator())
                            : state is GetOnlineDoctorsForSpcialitySuccess
                                ? state.doctors.isEmpty
                                    ? const Center(
                                        child: Text("there is no doctors"),
                                      )
                                    : ListView.builder(
                                        itemCount: state.doctors.length,
                                        itemBuilder: (context, index) {
                                          final doctor =
                                              state.doctors[index]["doctor"];
                                          return DoctorsAppoint(
                                            image:
                                                "http://egyclinic.c1.is/items/image/${doctor["image"]}",
                                            name: doctor['name'] ??
                                                'No Name Available',
                                            onChatPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        GetAppointment(
                                                      image:
                                                          "http://egyclinic.c1.is/items/image/${doctor["image"]}",
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
                                                          .toString(),
                                                      spciality: doctor[
                                                                  'specialtyId'] !=
                                                              null
                                                          ? specialties[doctor[
                                                              'specialtyId']]
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
                                            rating: doctor["stars"]
                                                .toString(), // Replace with actual rating data
                                            specialty: doctor['specialtyId'] !=
                                                    null
                                                ? specialties[
                                                    doctor['specialtyId'] - 1]
                                                : 'Unknown Specialty',
                                          );
                                        },
                                      )
                                : state is GetOnlineDoctorsForSpcialityFailure
                                    ? Text(state.message)
                                    : TextButton(
                                        onPressed: () {
                                          context
                                              .read<
                                                  GetDoctorsForSpcialityCubit>()
                                              .getAllDoctorsForSpciality(
                                                  _selectedSpecialtyIndex + 1);
                                        },
                                        child: const Text("try again"));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.lightBlue,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        hintText: "Find a doctor....",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black, fontSize: 25),
      ),
      style: const TextStyle(color: Colors.black),
      onChanged: _searchDoctor,
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: _stopSearching,
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: const Icon(Icons.search),
        )
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
      _searchTextController.clear();
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
      searchedDoctors = allDoctors;
    });
  }
}
