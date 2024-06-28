import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/online%20doctor/cubit/online_doc_cubit.dart';
import '../../CustomWidgets/screensappbar.dart';
import '../CustomWidgets/DoctorsAppoint.dart';

class Doctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnlineDocCubit(),
      child: DoctorsView(),
    );
  }
}

class DoctorsView extends StatefulWidget {
  @override
  _DoctorsViewState createState() => _DoctorsViewState();
}

class _DoctorsViewState extends State<DoctorsView> {
  int _selectedIndex = 0;
  final int _specialtyId = 5; // Replace with the actual specialty ID
  List<dynamic> allDoctors = [];
  List<dynamic> searchedDoctors = [];
  bool _isSearching = false;
  final TextEditingController _searchTextController = TextEditingController();

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
            : Text(
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
                  if (state is OnlineDocLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is OnlineDocLoaded) {
                    allDoctors = state.doctors;
                    searchedDoctors =
                        _isSearching ? searchedDoctors : allDoctors;

                    // Check if searchedDoctors is empty
                    if (searchedDoctors.isEmpty) {
                      return Center(child: Text('No data available'));
                    }

                    return ListView.builder(
                      itemCount: searchedDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = searchedDoctors[index];
                        return DoctorsAppoint(
                          name: doctor['name'] ?? 'No Name Available',
                          onChatPressed: () {},
                          onVideoCallPressed: () {},
                          rating: 3, // Replace with actual rating data
                          specialty: doctor['specialtyId'] != null
                              ? _getSpecialtyNameById(doctor['specialtyId'])
                              : 'Unknown Specialty',
                        );
                      },
                    );
                  } else if (state is OnlineDocError) {
                    return Center(
                        child: Text(state.message ?? 'An error occurred'));
                  } else {
                    return Center(child: Text('No data available'));
                  }
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

  String _getSpecialtyNameById(int specialtyId) {
    switch (specialtyId) {
      case 1:
        return 'Cardiology'; // Replace with actual specialty names as needed
      case 2:
        return 'Dermatology';
      // Add more cases as per your specialty IDs
      default:
        return 'Unknown Specialty';
    }
  }
}
