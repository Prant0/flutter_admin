
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/screen/tab/home_page.dart';
import 'package:flutter_admin/screen/tab/profile.dart';
import 'package:flutter_admin/screen/tab/user_page.dart';
import 'package:flutter_admin/widget/brand_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Drawerr extends StatefulWidget {
 // final GlobalKey<ScaffoldState> sKey;
//  Drawerr(this.sKey);
  @override
  _DrawerrState createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {



  @override

  Widget build(BuildContext context) {

    return SizedBox(
      width: 300,
      child: Drawer(

        child: Container(
          color: BrandColors.colorPrimaryDark,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
               // color: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        children: [
                          SizedBox(height: 15,),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                            },
                            child: Container(

                                height: 50,
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/home.svg",
                                      alignment: Alignment.center,
                                      fit: BoxFit.contain,

                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text( "Home",style: myStyle(16,BrandColors.colorText),),  // home


                                  ],
                                )
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                            },
                            child: Container(
                                height: 50,
                                child: Row(
                                  children: [
                                    Icon(Icons.person,size: 25,color:  BrandColors.colorText,),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text( "My Profile",style: myStyle(16, BrandColors.colorDimText,),),  //my profile

                                  ],
                                )
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserPage()));
                            },
                            child: Container(

                                height: 50,
                                child: Row(
                                  children: [
                                    Icon(Icons.people_outline,size: 25,color:  BrandColors.colorText,),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text( "User",style: myStyle(16, BrandColors.colorDimText,),),

                                  ],
                                )
                            ),
                          ),

                        ],
                      ),
                    ),

                    ],
                ),
              )

            ],
          ),
        ),
        elevation: 10,
      ),
    );
  }

}
