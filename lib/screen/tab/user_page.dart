import 'package:flutter/material.dart';
import 'package:flutter_admin/model/user_model.dart';
import 'package:flutter_admin/widget/brand_colors.dart';
import 'package:flutter_admin/widget/drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';


class UserPage extends StatefulWidget {


  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<UserModel> userList=[
    UserModel(
        email: "Shirajpranto89@gmail.com",
        id: 1,isAdmin: true,name: "Pranto",phone: "01833548800",
        image: "https://www.investmentweek.co.uk/api/v1/wps/84a174a/8f57286c-89c6-497d-ab12-e101ecafc040/4/James-Houlden-Man-GLG-580x358.jpg"
    ),
    UserModel(
        email: "Mitu@gmail.com",
        id: 1,isAdmin: true,name: "Mitu",phone: "018335465635",
        image: "https://i.insider.com/5dc098e0d8d84605b9674ef9?width=600&format=jpeg&auto=webp"
    ),
    UserModel(
        email: "Rizwan89@gmail.com",
        id: 1,isAdmin: false,name: "Rizwan",phone: "01745659854",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsvxcu-yCzd9lDvNFY4hbBIiRgKIW5CHhvCg&usqp=CAU"
    ),
    UserModel(
        email: "Habu4589@gmail.com",
        id: 1,isAdmin: false,name: "Habu",phone: "01548745841",
        image: "https://thumbs.dreamstime.com/b/portrait-poor-bangladeshi-man-portrait-poor-bangladeshi-man-dhaka-bangladesh-144067839.jpg"
    ),
    UserModel(
        email: "Waliur420@gmail.com",
        id: 1,isAdmin: true,name: "Waliur",phone: "01745879854",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKTut45QYrAjGbhf1fKapQ2Myw2iQpDk_yzg&usqp=CAU"
    ),UserModel(
        email: "Onavi20@gmail.com",
        id: 1,isAdmin: true,name: "Onavi",phone: "01745879854",
        image: "https://img.freepik.com/free-photo/beautiful-girl-stands-near-walll-with-leaves_8353-5378.jpg?size=626&ext=jpg"
    ),UserModel(
        email: "Mucking@gmail.com",
        id: 1,isAdmin: true,name: "Mucking",phone: "01745879854",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKTut45QYrAjGbhf1fKapQ2Myw2iQpDk_yzg&usqp=CAU"
    ),UserModel(
        email: "Shewly@gmail.com",
        id: 1,isAdmin: true,name: "Shewly",phone: "01745879854",
        image: "https://image.shutterstock.com/image-photo/dhaka-bangladesh-march-12-2017-260nw-606121508.jpg"
    ),

  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(


        body: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            // Check the sizing information here and return your UI
            if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
              return buildForPc();
            }


            return buildForMobile();
          },

        )

    );
  }


  Widget buildForPc(){
    return Scaffold(

      key: _scaffoldKey,
      drawer: Drawerr(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("All Users",style: myStyle(16,Colors.indigo,FontWeight.w800),),
        leading: IconButton(
          onPressed: (){
            _scaffoldKey.currentState.openDrawer();
          },
          icon: Icon(Icons.menu),
          color: Colors.indigo,
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text("",style: myStyle(20,Colors.indigo,FontWeight.w700),),
                ),

                GridView.builder(
                  shrinkWrap: true,
                  itemCount: userList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:   4),
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                        height: 100,
                        child:Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.network(userList[index].image,fit: BoxFit.cover,width: 200,height: 200,)),
                            Flexible(
                              child: Padding(padding: EdgeInsets.symmetric(vertical: 15),
                                child: Column(
                                  children: [
                                    Row(

                                      children: [
                                        Text(userList[index].name,style: myStyle(22,Colors.indigo,FontWeight.w500),),
                                        Text(userList[index].isAdmin? "  (Admin)" :"  (User)",style: myStyle(16,Colors.indigo,FontWeight.w500),),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.center,
                                    ),
                                    Column(
                                      children: [
                                        Text(userList[index].email,style: myStyle(18,Colors.indigo,),),
                                        Text(userList[index].phone,style: myStyle(18,Colors.indigo,),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        )
                    );
                  },
                ),

              ],
            ),
          )
      ),
    );
  }

  Widget buildForMobile(){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("HomePage",style: myStyle(16,Colors.indigo,FontWeight.w800),),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 20),
          height: double.infinity,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: userList.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(userList[index].image,fit: BoxFit.cover,width: 80,height: 80,)),
                    title: Text(userList[index].name,style: myStyle(16,Colors.indigo,FontWeight.w700),),
                    subtitle: Text(userList[index].email,style: myStyle(14,Colors.indigo,FontWeight.w500)),
                    trailing: Text(userList[index].isAdmin==true?"Admin":"User",style: myStyle(14,Colors.black54),),
                  );
                },
              ),
            ],
          )
      ),
    );
  }
}

