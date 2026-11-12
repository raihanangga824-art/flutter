import 'package:flutter/material.dart';
import 'package:helloazisrpl2/list_grid_view/Instagram.dart';
import 'package:helloazisrpl2/listview/ListBasic.dart';
import 'package:helloazisrpl2/pages/about_page.dart';
import 'package:helloazisrpl2/pages/formulir_page.dart';
import 'package:helloazisrpl2/pages/home_page.dart';
import 'package:helloazisrpl2/pages/inputpage.dart';
import 'package:helloazisrpl2/pages/Assalaamfood.dart';
import 'package:helloazisrpl2/pages/album_page.dart';
import 'package:helloazisrpl2/pages/post_detail_page.dart';
import 'package:helloazisrpl2/pages/post_page.dart';
import 'package:helloazisrpl2/pages/todo.dart';
import 'package:helloazisrpl2/pages/todo_page.dart';

class AppRoutes {
  static const home = '/';
  static const about = '/about';
  static const instagram = '/instagram';
  static const list = '/list';
  static const formulir = '/formulir';
  static const input = '/input';
  static const album = '/album';
  static const postDetail = '/post_detail';
  static const postPage = '/post_page';
  static const todo = '/todo';
  static const todoPage = '/todo_page';

  // Rute Khusus Kantin Assalaam Food
  static const foodList = '/food_list';
  static const foodDetailPayment = '/food_detail_payment';
  static const foodReceipt = '/food_receipt';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    about: (context) => const AboutPage(),
    instagram: (context) => const Instagram(),
    list: (context) => const ListBasic(),
    // formulir: (context) => const FormulirPage(),
    input: (context) => const BelajarForm(),
    album: (context) => const AlbumPage(),
    todo: (context) => const TodoDart(),
    todoPage: (context) => const TodoPage(),
    // Halaman Kantin Assalaam Food
    foodList: (context) => const ItemListPage(),
    foodDetailPayment: (context) => const DetailAndPaymentPage(cartItems: []),
    foodReceipt: (context) => const ReceiptPage(
          cartItems: [],
          totalAmount: 0,
          paymentMethod: 'cash', 
          cashPaid: 0,
          changeAmount: 0,
        ),
  };
}