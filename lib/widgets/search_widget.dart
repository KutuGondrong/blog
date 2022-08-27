import 'dart:async';

import 'package:blog/utils/colors.dart';
import 'package:blog/utils/const_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final bool loading;
  final Function(String) onTextChange;
  final String defaultSearch;

  const SearchWidget(
      {Key? key,
      required this.loading,
      required this.onTextChange,
      this.defaultSearch = ''})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _deBouncer = DeBouncerSearch(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
            color: darkPrimaryColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: darkPrimaryColor,
          ),
          Flexible(
            child: TextField(
              style: TextStyle(fontSize: 15.0, color: darkPrimaryColor),
              decoration: InputDecoration.collapsed(
                hintText: ConstString.search,
                hintStyle: TextStyle(
                    fontSize: 15.0, color: darkPrimaryColor.withOpacity(0.4)),
              ),
              onChanged: (text) {
                _deBouncer.run(() {
                  widget.onTextChange(
                      text.isEmpty ? widget.defaultSearch : text);
                });
              },
            ),
          ),
          if (widget.loading)
            const SizedBox(
              height: 24,
              width: 24,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CupertinoActivityIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

class DeBouncerSearch {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  DeBouncerSearch({this.milliseconds = 1000});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
