import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String name;
  final Function onTap;
  final Color color;
  BigButton({this.name , this.onTap,this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(name , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold,fontSize: 16),),
        ),
      ),
    );
  }
}