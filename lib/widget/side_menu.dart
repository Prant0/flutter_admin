import 'package:flutter/material.dart';
import 'package:flutter_admin/widget/brand_colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        alignment: Alignment.topLeft,
        height: MediaQuery.of(context).size.height,
        color: BrandColors.colorPrimaryDark,
        child: SingleChildScrollView(
          child: Column(
            children: [
                /*Padding(
                  padding: const EdgeInsets.all(defaultPadding *3),
                  child: ClipRRect(

                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJblmG352FTrVDWaSGC-e67GuM0_WnY5WgEQ&usqp=CAU")),
                ),*/


              Container(
                padding: EdgeInsets.symmetric(vertical: 40),
              ),

              DrawerListTile(
                icon: Icons.menu,
                name: "DashBoard",
                onTap: (){},
              ),
              DrawerListTile(
                icon: Icons.person,
                name: "Profile",
                onTap: (){},
              ),
              DrawerListTile(
                icon: Icons.card_travel,
                name: "Orders",
                onTap: (){},
              ),
              DrawerListTile(
                icon: Icons.ac_unit_sharp,
                name: "Campaign",
                onTap: (){},
              ),
              DrawerListTile(
                icon: Icons.admin_panel_settings_outlined,
                name: "Admins",
                onTap: (){},
              ),
              DrawerListTile(
                icon: Icons.tablet,
                name: "Campaign",
                onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {

  final VoidCallback onTap;
  final String name;
  final IconData icon;
  DrawerListTile({
    this.name,this.icon,this.onTap
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          horizontalTitleGap: 0.0,
          leading: Icon(icon,color: Colors.grey,),
          title: Text(name,style: myStyle(16,Colors.white,FontWeight.w500),),
        ),
        Divider(
          color: BrandColors.colorText.withOpacity(0.4),
          height: 20,
          thickness: 0.3,

        )
      ],
    );
  }
}
