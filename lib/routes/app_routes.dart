import 'package:flutter/material.dart';
import 'package:helloazisrpl2/list_grid_view/Instagram.dart';
import 'package:helloazisrpl2/listview/ListBasic.dart';
import 'package:helloazisrpl2/pages/about_page.dart';
import 'package:helloazisrpl2/pages/formulir_page.dart';
import 'package:helloazisrpl2/pages/home_page.dart';

class AppRoutes {
static const home = '/';
static const about = '/about';
static const instagram = '/instagram ';
static const list = '/list';
static const formulir = '/formulir';

  static Map<String, WidgetBuilder> routes = {
    home : (context) => HomePage(),
    about: (context) => AboutPage(),
    instagram: (context) => Instagram(),
    list: (context) => ListBasic(),
    formulir:(context) => FormulirPage()
   };
}