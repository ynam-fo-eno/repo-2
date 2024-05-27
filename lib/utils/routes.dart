// ignore_for_file: prefer_const_constructors

//import 'package:flutter_application_0/models/album_model.dart';
import 'package:flutter_application_0/views/pages/calc_ui.dart';
import 'package:flutter_application_0/views/pages/dashboard.dart';
import 'package:flutter_application_0/views/pages/home.dart';
import 'package:flutter_application_0/views/pages/home_page.dart';
import 'package:flutter_application_0/views/pages/les_ordres.dart';
import 'package:flutter_application_0/views/pages/login.dart';
import 'package:flutter_application_0/views/pages/produits.dart';
import 'package:flutter_application_0/views/pages/registration_file.dart';
import 'package:flutter_application_0/views/pages/memberslist.dart';
import 'package:flutter_application_0/views/pages/orders.dart';
import 'package:flutter_application_0/views/pages/stars.dart';
import 'package:flutter_application_0/views/pages/successful_login.dart';
import 'package:flutter_application_0/views/pages/user_input.dart';
import 'package:flutter_application_0/views/pages/user_list.dart';
import 'package:flutter_application_0/views/pages/user_profile.dart';
import 'package:get/get.dart';

class TimosRoutes {
  static var paths = [
    GetPage(name: "/"                 , page: () => Calculator()),
    GetPage(name: "/home_page"        , page: () => WelcomePage()),
    GetPage(name: "/login"            , page: () => Login()),
    GetPage(name: "/successful_login" , page: () => SuccessfulLogin()),
    GetPage(name: "/orders"           , page: () => Orders()),
    GetPage(name: "/registration_file", page: () => RegistrationFile()),
    GetPage(name: "/home"             , page: () => Home()),
    GetPage(name: "/dashboard"        , page: () => Dashboard()),
    GetPage(name: "/memberslist"      , page: () =>Etudiants()),
    GetPage(name: "/stars"            , page: () => Stars()),
    GetPage(name: "/produits"         , page: () => Produits()),
    GetPage(name: "/user_input"       , page: () =>UserProposals()),
    GetPage(name: "/les_ordres"       , page: () => OrderTracker()),
    GetPage(name: "/user_profile"     , page: () => UserProfile()),
    GetPage(name: "/user_list"        , page: () => UserList()),

    //GetPage(name: "/album_model", page: () => Album()),
  ];
}
