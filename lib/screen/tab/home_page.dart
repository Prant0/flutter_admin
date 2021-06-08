import 'package:flutter/material.dart';
import 'package:flutter_admin/model/user_model.dart';
import 'package:flutter_admin/widget/brand_colors.dart';
import 'package:flutter_admin/widget/dashboard_screen.dart';
import 'package:flutter_admin/widget/drawer.dart';
import 'package:flutter_admin/widget/menu_controller.dart';
import 'package:flutter_admin/widget/responsive_ui.dart';
import 'package:flutter_admin/widget/side_menu.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return buildForPc();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return buildForPc();
        }
        return buildForPc();
      },

    );
  }

  Widget buildForPc(){
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           if(Responsive.isDesktop(context))  Expanded(
              flex: 1,
             child: SideMenu(context: context),
            ),
            Expanded(
              flex: 6,
              child: DashBoardScreen(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildForMobile() {
    return Container();
  }
}

