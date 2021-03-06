import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class QuickAccessTile extends StatelessWidget {
  final Icon tileIcon;
  final String title;
  final Function onTap;
  QuickAccessTile({
    @required this.tileIcon,
    @required this.title,
    @required this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          left: 32,
          right: 32,
          top: 8,
          bottom: 8
        ),
        child: Container(
          height: kToolbarHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.05),
                offset: Offset(0, 3), //(x,y)
                blurRadius: 6.0,
                spreadRadius: 0.01 
              )
            ]
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 32),
              tileIcon,
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Varela",
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).iconTheme.color
                ),
              ),
              Spacer(),
              Icon(EvaIcons.arrowForwardOutline),
              SizedBox(width: 32)
            ],
          ),
        ),
      ),
    );
  }
}