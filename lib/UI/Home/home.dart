import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var prefixIconColor = Color(0xFFcfcfcf);
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    _searchFocusNodeListener() {
      if (searchFocusNode.hasFocus) {
        setState(() {
          prefixIconColor = Theme.of(context).primaryColorDark;
        });
      } else {
        setState(() {
          prefixIconColor = Color(0xFFcfcfcf);
        });
      }
    }

    searchFocusNode.addListener(_searchFocusNodeListener);
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [BottomNavigationBarItem(icon: Icon(Icons.home, color: Theme.of(context).primaryColorDark,), title: Text('Home')), BottomNavigationBarItem(icon: Icon(Icons.people),title: Text('Contacts'))]
      // ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            buildSearchField(context),
            GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/avatar1.jpg'),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Oporto Almacén',
                                            style: GoogleFonts.aBeeZee(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: Text(
                                              '35 min. ago',
                                              style: GoogleFonts.aBeeZee(
                                                color: Color(0xFFcfcfcf),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        'by Emiliano Arroyo',
                                        style: GoogleFonts.aBeeZee(),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 15),
                                        child: Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                          style: GoogleFonts.openSans(color: Colors.black54,),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSearchField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFededed), borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        focusNode: searchFocusNode,
        onEditingComplete: () {
          setState(() {
            FocusScope.of(context).requestFocus(
              FocusNode(),
            );
          });
        },
        maxLines: 1,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: prefixIconColor,
            ),
            hintText: 'Find a restaurant',
            hintStyle: TextStyle(
              color: Color(0xFFcfcfcf),
            ),
            enabledBorder: InputBorder.none,
            border: InputBorder.none),
      ),
    );
  }
}
