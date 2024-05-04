import 'package:final_project/CustomWidgets/chats.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({
    Key? key,
  }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late List<Characters> allCharacters;
  late List<Characters> searchedCharacters;
  bool _isSearching = false;
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    allCharacters = [
      Characters(name: "Waled"),
      Characters(name: "John"),
      Characters(name: "Jana"),
      Characters(name: "Ahmed"),
      Characters(name: "karim"),
      Characters(name: "nada"),
      Characters(name: "Waled"),
      Characters(name: "John"),
      Characters(name: "Jana"),
      Characters(name: "Ahmed"),
      Characters(name: "karim"),
      Characters(name: "nada"),
    ];
    searchedCharacters = allCharacters;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffe5e9f0),
      appBar: AppBar(
        toolbarHeight: size.height * 70 / 932,
        backgroundColor: Color(0xffe5e9f0),
        title: _isSearching ? _buildSearchField() : Text("Chats"),
        actions: _buildAppBarActions(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(size.width * 10 / 320),
          color: Color(0xffe5e9f0),
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
                    color: Color(0xff757575),
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
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding:
                                  EdgeInsets.only(right: size.width * 15 / 320),
                              child: Container(
                                width: size.width * 50 / 320,
                                height: size.height * 60 / 932,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Color(0xffe5e9f0),
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
                for (var character in searchedCharacters)
                  CustomChatItem(
                    imagePath: "assets/images/drchat.png",
                    name: character.name,
                    message: "How are you?",
                    unreadMessages: 5,
                    time: "10:30 PM",
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: Colors.lightBlue,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Find a chat....",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black, fontSize: 15),
      ),
      style: TextStyle(color: Colors.black),
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
          icon: Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(Icons.search),
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
}
