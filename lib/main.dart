import 'package:flutter/material.dart';
import 'package:helloazisrpl2/container_widget/LatihanContainer.dart';
import 'package:helloazisrpl2/list_grid_view/GridBasic.dart';
import 'package:helloazisrpl2/list_grid_view/GridProductPage.dart';
import 'package:helloazisrpl2/list_grid_view/Instagram.dart';
import 'package:helloazisrpl2/row_column_widget/ColumnWidget.dart';
import 'package:helloazisrpl2/row_column_widget/RowWidget.dart';
import 'package:helloazisrpl2/row_column_widget/RowColumnWidget.dart';
import 'package:helloazisrpl2/row_column_widget/LatihanSatu.dart';
import 'package:helloazisrpl2/row_column_widget/LatihanDua.dart';
import 'package:helloazisrpl2/sized_expanded_stack/SizedBoxWidget.dart';
import 'package:helloazisrpl2/sized_expanded_stack/ExpandedWidget.dart';
import 'package:helloazisrpl2/sized_expanded_stack/StackWidget.dart';
import 'package:helloazisrpl2/sized_expanded_stack/LatihanTiga.dart';
import 'package:helloazisrpl2/layoutlatihan/LatihanLayout.dart';
import 'package:helloazisrpl2/layoutlatihan/LayoutDua.dart';
import 'package:helloazisrpl2/layoutlatihan/KartuDashboard.dart';
import 'package:helloazisrpl2/listview/ListBasic.dart';
import 'package:helloazisrpl2/listview/ListBuilder.dart';
import 'package:helloazisrpl2/listview/ListSeparated.dart';
import 'package:helloazisrpl2/listview/ListCustom.dart';
import 'package:helloazisrpl2/list_grid_view/GridBasic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Instagram(),
      ),
    );
  }
}