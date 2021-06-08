import 'package:flutter/material.dart';
import 'package:flutter_admin/widget/brand_colors.dart';
import 'package:flutter_admin/widget/dashboard_screen.dart';
import 'package:flutter_admin/widget/menu_controller.dart';
import 'package:flutter_admin/widget/responsive_ui.dart';
import 'package:provider/provider.dart';

class HeaderDashboard extends StatelessWidget {
  const HeaderDashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       if(! Responsive.isDesktop(context)) IconButton(
            icon: Icon(Icons.menu,color: Colors.white,),
            onPressed: context.read<MenuController>().controlMenu,
            ),
       if(!Responsive.isMobile(context)) Text("Antopolis Admin",style: myStyle(20,BrandColors.colorWhite,FontWeight.w500),),
        Responsive.isDesktop(context)? Spacer(flex: 2,) :Padding(padding: EdgeInsets.symmetric(horizontal: defaultPadding)),
        Expanded(
          child: SearchField(),
        ),
        AppBarCard()
      ],
    );
  }
}


class AppBarCard extends StatelessWidget {
  const AppBarCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding/2.5) ,
      margin: EdgeInsets.only(left: defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        border: Border.all(color: Colors.white10),
        borderRadius: BorderRadius.circular(8),),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network("https://scontent.fdac45-1.fna.fbcdn.net/v/t1.6435-9/193962083_1369323840116141_3081421925447490015_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=0ZeG0RqDGmgAX-3JGvI&_nc_ht=scontent.fdac45-1.fna&oh=7b511b92d990be687ccca2b98b3734df&oe=60E46BEA",height: 40,)),
          if(!Responsive.isMobile(context))   Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("Shirajul Islam",style: myStyle(14,BrandColors.colorText),),
          ),
          Icon(Icons.keyboard_arrow_down,color: BrandColors.colorText,)
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: InputDecoration(
          fillColor: secondaryColor,
          filled: true,
          hintText: "Search Here",
          hintStyle: myStyle(14,BrandColors.colorText),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          suffixIcon: InkWell(
            onTap: (){

            },
            child: Container(
              padding: EdgeInsets.all(defaultPadding *0.75),
              margin: EdgeInsets.only(left:defaultPadding / 2 ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(Icons.search),
            ),
          )
      ),
    );
  }
}
