import 'package:blog/pages/home/component/body_widget.dart';
import 'package:blog/pages/home/component/search_home_widget.dart';
import 'package:blog/utils/const_string.dart';
import 'package:blog/utils/key_utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstString.title),
      ),
      body: Column(
        children: const [
          SearchHomeWidget(
            key: KeyUtils.keySearchHomeWidget,
          ),
          Expanded(
              child: BodyWidget(
            key: KeyUtils.keyBodyWidget,
          )),
        ],
      ),
    );
  }
}
