import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin/model/dashboard_model_list.dart';
import 'package:flutter_admin/model/recentOrders.dart';
import 'package:flutter_admin/widget/brand_colors.dart';
import 'package:flutter_admin/widget/responsive_ui.dart';

import 'dashboard_header.dart';


class DashBoardScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      color: bgColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            HeaderDashboard(),
            SizedBox(height: defaultPadding,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                    child: Column(
                      children: [

                        Responsive(
                          mobile: cart_items_dashboard(crossAxisCount: _size.width <850?2:2,childAspectRatio: _size.width<650?1.3:2,),
                          tablet: cart_items_dashboard(crossAxisCount: _size.width <850?2:4,childAspectRatio: _size.width<650?1.3:1,),
                          desktop: cart_items_dashboard(childAspectRatio: _size.width <1400? 1.1 :1.4 ),
                        ),
                      //  cart_items_dashboard(),


                        SizedBox(height: defaultPadding,),
                        Container(
                          padding: EdgeInsets.all( defaultPadding),
                          decoration: BoxDecoration(
                            color: secondaryColor,

                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Recent Orders",style: myStyle(16,Colors.white,FontWeight.w700),),
                              SizedBox(
                                width: double.infinity,
                                child: DataTable(
                                  horizontalMargin: 0,
                                  columnSpacing: defaultPadding,
                                  columns: [
                                    DataColumn(
                                        label: Text("Order Title",style: myStyles14(),)),
                                    DataColumn(
                                        label: Text("Date",style: myStyles14())),
                                    DataColumn(
                                        label: Text("Serial",style: myStyles14())),
                                  ],
                                  rows: List.generate(
                                      demoRecentFiles.length,
                                          (index) => recentOrders(demoRecentFiles[index])
                                  )
                                ),
                              )
                            ],
                          ),
                        ),
                        if (Responsive.isMobile(context) || Responsive.isTablet(context))
                          SizedBox(
                          height: defaultPadding,
                        ),
                        if (Responsive.isMobile(context) || Responsive.isTablet(context))
                          StorageDetails(),
                      ],
                    )
                ),
                if (Responsive.isDesktop(context)) SizedBox(
                  width: defaultPadding,
                ),
               if (Responsive.isDesktop(context)) Expanded(
                  flex: 2,
                    child: StorageDetails()),
              ],
            )
          ],
        ),
      ),
    );
  }

  DataRow recentOrders(RecentFile fileInfo) {
    return DataRow(cells: [
                                    DataCell(
                                      Row(
                                        children: [
                                          /*Icon(
                                            fileInfo.icon,size:30 ,color: Colors.pinkAccent,
                                          ),*/
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: defaultPadding /2,vertical: defaultPadding /2),
                                            child: ClipRRect(

                                              borderRadius: BorderRadius.circular(defaultPadding /2),
                                              child: Image.network(fileInfo.img,fit: BoxFit.cover,width: 40,height: 40,),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                                            child: Text(fileInfo.title,style: myStyles14(),),
                                          ),
                                        ],
                                      )
                                    ),
                                    DataCell(
                                      Text(fileInfo.date,style: myStyles12(),)
                                    ),DataCell(
                                      Text(fileInfo.size,style: myStyles12(),)
                                    )
                                  ]);
  }
}

class cart_items_dashboard extends StatelessWidget {
  const cart_items_dashboard({
    Key key, this.crossAxisCount =4,
    this.childAspectRatio = 1 ,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Products Available",style:myStyle(14, BrandColors.colorWhite),),
            ElevatedButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric( horizontal: defaultPadding / 2)
              ),
                onPressed:(){} ,
                child: Text("Add New",style: myStyle(14,BrandColors.colorText),),

            )
          ],
        ),
        SizedBox(height: defaultPadding,),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:crossAxisCount,
                childAspectRatio: childAspectRatio,
                crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
            ),
            shrinkWrap: true,
            itemCount:  demoMyFiles.length,
            itemBuilder: (context,index){
              return FileInfoCard(
                info: demoMyFiles[index],
              );
            }
        )
      ],
    );
  }
}

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    this.info,
    Key key,
  }) : super(key: key);

  final CloudStorageInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,width: 40,
                decoration: BoxDecoration(
                  color: info.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)
                ),
                
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultPadding / 2),
                  child: Image.network(info.img,fit: BoxFit.cover,),
                ),
                //
              ),
              Icon(Icons.more_horiz,color: BrandColors.colorText,)
            ],
          ),
          Text(
            info.title,maxLines: 1,overflow: TextOverflow.ellipsis,style: myStyle(16,Colors.white),
          ),
          Stack(
            children: [
              Container(
                width: double.infinity,height: 5,
                decoration: BoxDecoration(
                    color: info.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),
              LayoutBuilder(
                  builder: (context,constraints)=>Container(
                    width: constraints.maxWidth * (info.percentage / 100),
                    height: 5,
                    decoration: BoxDecoration(
                        color: info.color,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.numOfFiles} Orders",style: myStyle(12,Colors.white70),overflow: TextOverflow.ellipsis,
              ),
              Text(
                "${info.totalStorage} Items",style: myStyle(12,Colors.white70),overflow: TextOverflow.ellipsis,
              )
            ],
          )
        ],
      ),
    );
  }
}

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text("Today sell",style: myStyle(18,Colors.white,FontWeight.w500),),
          ),

          SizedBox(
            height: 200,
          child: Stack(
            children: [
              PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 70,
                  startDegreeOffset: -90,
                  sections: [
                    PieChartSectionData(
                      color: primaryColor,
                        title: "Burger",
                        titleStyle: myStyles12(),
                        value: 30,
                        showTitle: true,radius: 25
                    ),
                    PieChartSectionData(
                        color: Colors.red,
                        value: 20,
                        title: "Pizza",
                        titleStyle: myStyles12(),
                        showTitle: true,radius: 20
                    ),PieChartSectionData(
                        color: primaryColor.withOpacity(0.5),
                        value: 25,
                        title: "Fish",
                        titleStyle: myStyles12(),
                        showTitle: true,radius: 15
                    ),
                    PieChartSectionData(
                        color: Colors.yellow,
                        title: "Sub sandwich",
                        titleStyle: myStyles12(),
                        value: 10,
                        showTitle: true,radius: 10
                    ),
                  ]
                )
              ),
              Positioned.fill(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("505",style:TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w800,height: 0.5)),
                      SizedBox(height:8),
                      Text("Orders",style: myStyle(12,BrandColors.colorText),),

                    ],
                  ) )
            ],
          ),
          ),

          StorageInfoCard(
            icon: Icons.file_copy_rounded,
            name: "Pizza",
            amount: "1526",
            total: "1.6",
            clr: primaryColor,
          ),StorageInfoCard(
            icon: Icons.file_copy_rounded,
            name: "Burger",
            amount: "1526",
            total: "1.6",
              clr: Colors.red
          ),StorageInfoCard(
            icon: Icons.file_copy_rounded,
            name: "Sub sandwich",
            amount: "1526",
            total: "1.6",
            clr: primaryColor.withOpacity(0.5),
          ),StorageInfoCard(
            icon: Icons.file_copy_rounded,
            name: "Sea Fish",
            amount: "1526",
            total: "1.6",
          ),StorageInfoCard(
            icon: Icons.file_copy_rounded,
            name: "Polaw",
            amount: "1526",
            total: "1.6",
              clr: Colors.yellow
          ),StorageInfoCard(
            icon: Icons.file_copy_rounded,
            name: "Kacchi biryani",
            amount: "1526",
            total: "1.6",
              clr: Colors.green
          ),StorageInfoCard(
            icon: Icons.file_copy_rounded,
            name: "Documents",
            amount: "1526",
            total: "1.6",
          ),StorageInfoCard(
            icon: Icons.file_copy_rounded,
            name: "Documents",
            amount: "1526",
            total: "1.6",
          ),

        ],
      ),
    );
  }
}

class StorageInfoCard extends StatelessWidget {
  final String name;
  final String amount;
  final String total;
  final IconData icon;
  final Color clr;
  StorageInfoCard({this.total,this.clr,
    this.amount,this.name,this.icon
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,color: BrandColors.colorText.withOpacity(0.6),
        ),
        borderRadius: BorderRadius.circular(defaultPadding)
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,width: 20,
              child:CircleAvatar(
                backgroundColor: clr,
                maxRadius: 20,
              ) ,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(name,style: myStyle(16,BrandColors.colorText,FontWeight.w500),),
                Text("Total: ${amount}",style: myStyle(12,Colors.grey,FontWeight.w300),)
            ],
          ),
              )),
          Text("$total GB",style: myStyle(16,BrandColors.colorText,),)
        ],
      ),
    );
  }
}


