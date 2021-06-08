

import 'package:flutter/material.dart';
import 'package:flutter_admin/widget/brand_colors.dart';

class CloudStorageInfo {
  final String svgSrc, title, totalStorage,img;
  final int numOfFiles, percentage;
  final Color color;
  final IconData icon;

  CloudStorageInfo({
    this.icon,
    this.img,
    this.svgSrc,
    this.title,
    this.totalStorage,
    this.numOfFiles,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Burger",
    numOfFiles: 1328,
    svgSrc: "assets/icons/Documents.svg",
    totalStorage: "2000",
    color: primaryColor,
    percentage: 35,
    icon: Icons.file_present,
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvxAJcSQRs2u2vkyS5GoKLm66Op0CqWt0rjg&usqp=CAU"
  ),
  CloudStorageInfo(
    title: "Pizza 12",
    numOfFiles: 56,
    svgSrc: "assets/icons/google_drive.svg",
    totalStorage: "200",
    color: Color(0xFFFFA113),
    percentage: 35,
      icon: Icons.drive_folder_upload,
      img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV123YSWK7TAjzSHz7W3IWSiZl5Y5MTwSEKw&usqp=CAU"

  ),
  CloudStorageInfo(
    icon: Icons.zoom_out_map,
    title: "Sea Fish",
    numOfFiles: 132,
    svgSrc: "assets/icons/one_drive.svg",
    totalStorage: "420",
    color: Color(0xFFA4CDFF),
    percentage: 10,
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7Jl-Tv6v0SOE33ctaMAPAOFKmDSBbItDy5Q&usqp=CAU"
  ),
  CloudStorageInfo(
    icon: Icons.wifi_tethering,
    title: "sub sandwich",
    numOfFiles: 15,
    svgSrc: "assets/icons/drop_box.svg",
    totalStorage: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
    img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV123YSWK7TAjzSHz7W3IWSiZl5Y5MTwSEKw&usqp=CAU"
  ),
];