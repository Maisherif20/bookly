import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MayLikeWidget extends StatelessWidget {
  const MayLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("You can also like", style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: ListView.builder(scrollDirection: Axis.horizontal,
              itemCount: 20,itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 100.w,
                height: 112.h,
                child: Image.asset("assets/images/Book 2 Hightligh.png",fit: BoxFit.contain,),
              );
            },

            ),
          ),
        ],
      ),
    );
  }
}
