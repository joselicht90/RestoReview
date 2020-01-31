import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var prefixIconColor = Color(0xFFffe8d6);
  FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    _searchFocusNodeListener() {
      if (searchFocusNode.hasFocus) {
        setState(() {
          prefixIconColor = Theme.of(context).primaryColorDark;
        });
      } else {
        setState(() {
          prefixIconColor = Theme.of(context).primaryColor;
        });
      }
    }

    searchFocusNode.addListener(_searchFocusNodeListener);

    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              TextField(
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
                    color: Color(0xFFd6d6d6),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFf9f6f7),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFd6d6d6),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                },
                child: SingleChildScrollView(
                  child: Container(height: 200,width: 100,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
