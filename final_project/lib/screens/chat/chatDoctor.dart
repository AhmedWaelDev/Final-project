import 'package:final_project/CustomWidgets/chats.dart';
import 'package:final_project/cubits/doctor/get_all_pateint_for_doctor/get_all_pateint_for_doctor_cubit.dart';
import 'package:final_project/screens/chat/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientChat extends StatefulWidget {
  const PatientChat({
    Key? key,
  }) : super(key: key);

  @override
  State<PatientChat> createState() => _PatientChatState();
}

class _PatientChatState extends State<PatientChat> {
  List<Characters> allCharacters = [];
  List<Characters> searchedCharacters = [];
  bool _isSearching = false;
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<GetAllPateintForDoctorCubit>().GetAllPateintForDoctor();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffe5e9f0),
      appBar: AppBar(
        toolbarHeight: size.height * 70 / 932,
        backgroundColor: const Color(0xffe5e9f0),
        title: _isSearching ? _buildSearchField() : const Text("Chats"),
        actions: _buildAppBarActions(),
      ),
      body:
          BlocBuilder<GetAllPateintForDoctorCubit, GetAllPateintForDoctorState>(
        builder: (context, state) {
          if (state is GetAllPateintForDoctorLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetAllPateintForDoctorsuccess) {
            allCharacters = state.patients.map((patient) {
              return Characters.fromJson(patient);
            }).toList();
            if (!_isSearching) {
              searchedCharacters = allCharacters;
            }

            return buildChatList(context, size);
          } else if (state is GetAllPateintForDoctorFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildChatList(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(size.width * 10 / 320),
        color: const Color(0xffe5e9f0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 10 / 932),
            Padding(
              padding: EdgeInsets.only(left: size.width * 15 / 320),
              child: Text(
                "My Patients",
                style: TextStyle(
                  fontSize: size.width * 20 / 320,
                  color: const Color(0xff757575),
                ),
              ),
            ),
            SizedBox(height: size.height * 15 / 932),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: size.height * 60 / 932,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allCharacters.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatterScreen()),
                            );
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.only(right: size.width * 15 / 320),
                            child: Container(
                              width: size.width * 50 / 320,
                              height: size.height * 60 / 932,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xffe5e9f0),
                                  width: 2,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/images/person.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 10 / 932),
            if (searchedCharacters.isEmpty)
              Padding(
                padding: EdgeInsets.all(size.width * 8 / 320),
                child: Text(
                  "Not Found",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 20 / 320,
                  ),
                ),
              )
            else
              Column(
                children: searchedCharacters.map((character) {
                  return CustomChatItem(
                    imagePath: "assets/images/drchat.png",
                    name: character.name,
                    message: "How are you?",
                    unreadMessages: 5,
                    time: "10:30 PM",
                  );
                }).toList(),
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
        hintText: "Find a chat....",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
      ),
      style: const TextStyle(color: Colors.black),
      onChanged: _searchCharacter,
    );
  }

  void _searchCharacter(String searchedCharacter) {
    setState(() {
      searchedCharacters = allCharacters
          .where((character) => character.name
              .toLowerCase()
              .contains(searchedCharacter.toLowerCase()))
          .toList();
    });
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
      searchedCharacters = allCharacters;
    });
  }
}

class Characters {
  final String name;

  Characters({
    required this.name,
  });

  factory Characters.fromJson(Map<String, dynamic> json) {
    return Characters(
      name: json['name'],
    );
  }
}
