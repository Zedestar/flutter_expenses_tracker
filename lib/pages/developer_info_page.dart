import 'package:expenses_tracker/components/appBar_widget.dart';
import 'package:flutter/material.dart';

class DeveloperInfoPage extends StatelessWidget {
  const DeveloperInfoPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: buildResponsiveAppBar(
          context: context, appBarTitle: "Developer Info"),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //       colors: [Colors.teal.shade900, Colors.teal],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight),
        // ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage("assets/images/zeddyProfile.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Melkizedeki",
                style: TextStyle(
                  fontSize: 40,
                  // color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontFamily: "Pacifico",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "SOFTWARE ENGINEER",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SourceSans",
                  letterSpacing: 2.5,
                  // color: Colors.teal.shade100,
                ),
              ),
              SizedBox(
                height: 20,
                width: 150.0,
                child: Divider(
                    // color: Colors.teal.shade100,
                    ),
              ),
              Card(
                // color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.black87,
                  ),
                  title: Text(
                    "+255672743515",
                    style: TextStyle(fontFamily: "SourceSans", fontSize: 25.0),
                  ),
                ),
              ),
              Card(
                // color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.black87,
                  ),
                  title: Text(
                    "mmagota2@gmail.com",
                    style: TextStyle(fontFamily: "SourceSans", fontSize: 25.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
