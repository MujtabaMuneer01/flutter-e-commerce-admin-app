import 'package:e_commerce_admin_app/widgets/texts/bold_text.dart';
import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  List list;
  int index;
  Orders({
    super.key,
    required this.index,
    required this.list,
  });

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView.builder(
          itemCount: list[index]['products'].length,
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  list[index]['products'][index]['image'],
                ),
              ),
              BoldText(text: list[index]['products'][index]['name']),
              CircleAvatar(
                backgroundColor: Colors.red,
                child: Text('${list[index]['products'][index]['count']}'),
              )
            ],
          ),
        ),
      );
}
