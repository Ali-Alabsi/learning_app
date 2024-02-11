
import 'package:flutter/material.dart';
import '../../../core/shared/theming/text_style.dart';

class Lang extends StatelessWidget {
  const Lang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('اللغات', style: TextStyles.font18BlackBold,),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 15 , vertical: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('اللغات الشائعة ' ,style: TextStyles.font16BlackBold,),
            Container(
              padding: EdgeInsetsDirectional.only(start: 30),
              child: Column(
                children: [
                  CheckboxListTile(value: true, onChanged: (value){} ,title:  Text('العربية' , style: TextStyles.font14BlackBold,), ),
                  CheckboxListTile(value: true, onChanged: (value){} ,title:  Text('الفرنسي' , style: TextStyles.font14BlackBold,), ),
                  CheckboxListTile(value: true, onChanged: (value){} ,title:  Text('الانجليزي' , style: TextStyles.font14BlackBold,), ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
