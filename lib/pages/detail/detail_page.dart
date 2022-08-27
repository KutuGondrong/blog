import 'package:blog/args/detail_page_args.dart';
import 'package:blog/utils/const_string.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final DetailPageArgs args;

  const DetailPage({Key? key, required this.args}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ConstString.detailTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListTile(
        title: Text(widget.args.data.title ?? ''),
        subtitle: Text(
          widget.args.data.body ?? '',
        ),
      )
    );
  }
}
