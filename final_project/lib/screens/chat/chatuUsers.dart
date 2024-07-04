import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/cubits/online%20doctor/cubit/online_doc_cubit.dart';
import 'package:final_project/screens/chat/chatScreen.dart';
import 'package:final_project/CustomWidgets/chats.dart';

class Chat extends StatefulWidget {
  const Chat({
    Key? key,
  }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Characters> allCharacters = [];
  List<Characters> searchedCharacters = [];
  bool _isSearching = false;
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<OnlineDocCubit>().fetchAllDoctors();
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
      body: BlocBuilder<OnlineDocCubit, OnlineDocState>(
        builder: (context, state) {
          if (state is OnlineDocLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is OnlineDocLoaded) {
            allCharacters = state.doctors.map((doctor) {
              return Characters.fromJson(doctor);
            }).toList();
            if (!_isSearching) {
              searchedCharacters = allCharacters;
            }

            return buildChatList(context, size);
          } else if (state is OnlineDocError) {
            return Center(child: Text(state.message));
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
                "Online Doctors",
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
                      itemCount: searchedCharacters.length,
                      itemBuilder: (context, index) {
                        var character = searchedCharacters[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatterScreen(
                                  receiverId: character.id,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: size.width * 15 / 320,
                            ),
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
                    receiverId: character.id,
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
  final String id; // Define id as a String
  final String name;

  Characters({
    required this.id,
    required this.name,
  });

  factory Characters.fromJson(Map<String, dynamic> json) {
    return Characters(
      id: json['id'].toString(), // Convert id to String during parsing
      name: json['name'],
    );
  }
}
