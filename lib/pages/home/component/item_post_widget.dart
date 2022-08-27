import 'package:blog/data/response/post.dart';
import 'package:blog/utils/key_utils.dart';
import 'package:flutter/material.dart';

class ItemPostWidget extends StatelessWidget {
  final Post item;
  final Function(Post item) onClickItemPostWidget;

  const ItemPostWidget({
    Key? key,
    required this.item,
    required this.onClickItemPostWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: KeyUtils.keyItemPostWidget,
      onTap: () {
        onClickItemPostWidget(item);
      },
      child: ListTile(
        title: Text(item.title ?? ''),
        subtitle: Text(
          item.body ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
