import 'package:flutter/material.dart';
import 'package:flutter_admin/widget/brand_colors.dart';


class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("My Profile",style: myStyle(18,Colors.red),),
      ),
    );
  }
}
