import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/screen/tab/home_page.dart';
import 'package:flutter_admin/screen/tab/profile.dart';
import 'package:flutter_admin/screen/tab/user_page.dart';
import 'package:flutter_admin/widget/brand_colors.dart';
import 'package:flutter_admin/widget/drawer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_builder/responsive_builder.dart';


class NavigationBar extends StatefulWidget {


  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedItem = 0;
  PageController _pageController = PageController();

  List<Widget> _page = [HomePage(),UserPage(),ProfilePage(),];

  void _onPageChange(int index) {
    setState(() {
      return _selectedItem = index;
    });
  }


  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  void initState() {
    check().then((intenet) {
      if (intenet != null && intenet) {
        if (mounted) {
          //  addEntryesHomee();
        }
      } else showInSnackBar("No Internet Connection");
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return HomePage();
        }
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return HomePage();
        }
        return HomePage();
      },

    );
  }

  Widget buildForPc(){
    return Scaffold(
      key: _scaffoldKey,
     drawer: Drawerr(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            _scaffoldKey.currentState.openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.indigo,
        ),
      ),
      body: Container(
        child: Text("Drawer"),
      ),
    );
  }



  Widget buildForMobile(){
    return Scaffold(

      backgroundColor: BrandColors.colorWhite,
      key: _scaffoldKey,

      //drawer: Drawerr(),
      body: WillPopScope(
        onWillPop: onBackPressed,
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChange,
          children: _page,
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        // padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
        //margin: EdgeInsets.only(bottom: 13, right: 17, left: 17, top: 8),
        decoration: BoxDecoration(
          // color: BrandColors.colorPrimary,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(0.4),
                offset: Offset(0, 25),
              ),
            ]),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Row(
            children: [
              navigationIcon("assets/home.svg", 'Home', 0),
              navigationIcon("assets/user1.svg", 'Users', 1),
              navigationIcon("assets/email.svg", 'Profile', 2),
            ],
          ),
        ),
      ),);
  }

  Future<bool> onBackPressed() {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13.0)),
            title: Text(
              "Are You Sure ?",
              style: myStyle(16, Colors.white, FontWeight.w500),
            ),
            content: Text("You are going to exit the app !"),
            titlePadding:
            EdgeInsets.only(top: 30, bottom: 12, right: 30, left: 30),
            contentPadding: EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            backgroundColor: BrandColors.colorPrimaryDark,
            contentTextStyle: myStyle(
                14, BrandColors.colorText.withOpacity(0.7), FontWeight.w400),
            titleTextStyle: myStyle(18, Colors.white, FontWeight.w500),
            actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "No",
                    style: myStyle(14, BrandColors.colorText),
                  )),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: BrandColors.colorPurple,
                child: Text(
                  'Yes',
                  style: myStyle(14, Colors.white, FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }

  Widget navigationIcon(String icon, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItem = index;
          _pageController.jumpToPage(_selectedItem);
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.grey,width: 0.003)
        ),
        height: 60,
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: index == _selectedItem ? Colors.grey: Colors.black ,
              ),
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: SvgPicture.asset(
                  icon,
                  color: index == _selectedItem ? Colors.black : Colors.grey,
                  height: 21,
                  width: 21,
                ),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                  color: index == _selectedItem ? Colors.grey : Colors.grey,
                  fontSize: 13.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: index == _selectedItem ? FontWeight.w500 : FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
  }


  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: Text(
        value,
        style: myStyle(15, BrandColors.colorText),
      ),
      backgroundColor: Colors.purple,
    ));
  }
}
