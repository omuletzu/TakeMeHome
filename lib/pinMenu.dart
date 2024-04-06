import 'package:flutter/material.dart';

class MenuPin extends StatelessWidget{
  const MenuPin({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          height: 60,
          color: Colors.deepPurple,
        ),

        Container(
          height: 60,
          color: Colors.deepOrange,
        )
      ],
    );
  }
}