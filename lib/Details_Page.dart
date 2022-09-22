import 'package:flutter/Material.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;
    return Container(
      child: Stack(
        children:[
         Container(
           width: double.infinity,
           height: height/2,
           child: Image.asset("assets/person.png",fit: BoxFit.fill,),

         )
        ]

      ),
    );
  }
}
