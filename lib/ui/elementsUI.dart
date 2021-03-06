// Dart
import 'dart:ui';

// Flutter
import 'package:flutter/material.dart';
import 'package:songtube/provider/managerProvider.dart';

// Packages
import 'package:provider/provider.dart';

// Show toast with specified message/duration
void showToast(BuildContext context, String message, Duration duration) {
    SnackBar(
      backgroundColor: Theme.of(context).canvasColor,
      duration: duration,
      content: Text(message, style: TextStyle(color: Theme.of(context).textTheme.bodyText1.color)),
  );
}

// Show alertDialog for permissions
Future<void> showCustomDialog(BuildContext context) async {
  // set up the button
  ManagerProvider manager = Provider.of<ManagerProvider>(context);
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(
        color: Theme.of(context).accentColor
      ),
    ),
    onPressed: () {
      manager.downloadInfoSetList.forEach((object){
        object.finishDownload(null);
      });
      manager.downloadInfoSetList = [];
      Navigator.pop(context);
    },
  );
  Widget cancelButton = FlatButton(
    child: Text(
      "Cancel",
      style: TextStyle(
        color: Theme.of(context).accentColor
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: Theme.of(context).canvasColor,
    title: Text("SongTube",
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyText1.color
      ),
    ),
    content: Text(
      "Are you sure you want to cancel all downloads?",
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyText1.color
      ),
    ),
    actions: [
      cancelButton,
      okButton
    ],
  );

  // show the dialog
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// Show alertDialog for permissions
Future<void> showAlertDialog(BuildContext context, bool permanent) async {
  // set up the button
  Widget okButton = FlatButton(
    child: Text(
      "OK",
      style: TextStyle(
        color: Theme.of(context).accentColor
      ),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    title: Text("SongTube",
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyText1.color
      ),
    ),
    content: permanent == false
        ? Text(
          "This application needs external storage permission to convert or download from YouTube or other sites",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color
          ),
        )
        : Text(
          "External storage permission is permanently denied, please go to settings and enable it manually for this app to work...",
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1.color
          ),
        ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}