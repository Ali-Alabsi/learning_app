import 'package:flutter/material.dart';

import '../../../core/shared/theming/text_style.dart';

class ItemTeachers extends StatelessWidget {
  final snapshot;
  final int index;
  const ItemTeachers({
    super.key, required this.snapshot, required this.index,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.cyanAccent,
                  radius: 35,
                  backgroundImage: NetworkImage(snapshot.data!.docs[index].data()['image']),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text( snapshot.data!.docs[index].data()['name'], style: TextStyles.font18BlackBold),
                    Text(
                      snapshot.data!.docs[index].data()['work'],
                      style: TextStyles.font14GreyW300,
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.chat)
          ],
        ),
      ),
    );
  }
}
