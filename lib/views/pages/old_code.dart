 //New essential command on terminal for when you need images from an API to show
 //up on a browser:
 //flutter run -d chrome --web-renderer html
 
 
 //In case I  need these buttons again...
                  /*ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SuccessfulLogin()),
                      );
                    },
                    
                    //onPressed: () => Get.toNamed("/calc_ui"),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 30),
                      backgroundColor: buttonColor1,
                      foregroundColor: textingWhite,
                    ),
                    child: const Text("Login"),
                  ),*/
                  /*ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationFile()),
                      );
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 30),
                      backgroundColor: buttonColor1,
                      foregroundColor: textingWhite,
                    ),
                    child: const Text("Get account if none"),
                  ),
                  */
                   /*MaterialButton(
                    onPressed: () => Get.toNamed("/calc_ui"),
                    height: 40,
                    minWidth: 200,
                    color: buttonColor1,
                    child: Text(
                      "Check out my calc,man!",
                      style: TextStyle(color: textingWhite, fontSize: 30),
                    ),
                  ),*/
                   /*ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessfulEntry()),
                    );
                  },
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 30),
                    backgroundColor: buttonColor1,
                    foregroundColor: textingWhite,
                  ),
                  child: const Text("Save details"),
                ),*/
                /* ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 30),
                    backgroundColor: buttonColor1,
                    foregroundColor: textingWhite,
                  ),
                  child: const Text("Login if account present"),
                ),*/

//Aight, end of my old buttons for now.

//Icons for dashboard I'll need to shuffle or even remove!
/*
                    itemsDashboard(
                      title: "It's Time!",
                      iconData: CupertinoIcons.clock_solid,
                      background: Colors.green,
                    ),
                    itemsDashboard(
                      title: "Today is ${DateTime.now()}",
                      iconData: CupertinoIcons.calendar,
                      background: Colors.yellow,
                    ),  
*/
//For putting bottom navigation bar in dashboard 
//(very annoying) and ditched for the time being...
/*
HomeController homeController = Get.put(HomeController());
var screens = [
  WelcomePage(),
  Dashboard(),
  Login(),
  Etudiants(),
];
SingleChildScrollView(
                child: Scaffold(
                  bottomNavigationBar: CurvedNavigationBar(
                    backgroundColor: textingWhite,
                    buttonBackgroundColor: buttonColor1,
                    color: primaryColor1,
                    items: [
                      Icon(Icons.home),
                      Icon(Icons.dashboard),
                      Icon(Icons.person),
                      Icon(CupertinoIcons.doc_on_clipboard),
                    ],
                    onTap:(index) {
                        homeController.updatePageSelected(index);
                    },
                  ), 
                  body:Obx(
                    () =>Center(
                      child:screens[homeController.selectedPage.value],
                    ),
                  ),
                ),
              ),
*/
/*
// An old and failed take on the dashboard plus bottom navigation bar
child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: primaryColor2,
                  borderRadius: BorderRadius.only(
                    //bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                //Below is still part of the body...
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      ListTile(
                        contentPadding:EdgeInsets.symmetric(horizontal: 30),
                        title: CustomizedTextWidget(
                          label: "Dashboard",
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: CustomizedTextWidget(
                          label:"Hi, Tom",
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height:30
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: primaryColor2,
                child: Container(
                  decoration: BoxDecoration(
                    color: textingWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200),
                    ),
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 30,
                    children: [ 
                      itemsDashboard(
                        title: "Home", 
                        iconData:CupertinoIcons.home,
                        background: Colors.red,
                        unAction:()=>Get.toNamed("/home"),
                      ),
                      itemsDashboard(
                        title: "Calculator",
                        iconData:Icons.calculate,
                        background: Colors.blue,
                        unAction: () => Get.toNamed("/"),
                      ),
                      itemsDashboard(
                        title: "Account",
                        iconData: Icons.person,
                        background: Colors.brown,
                        unAction: () => Get.toNamed("/login"),
                      ),
                      itemsDashboard(
                        title: "Members' Stats",
                        iconData: CupertinoIcons.doc_on_clipboard_fill,
                        background: Colors.black,
                        unAction: () => Get.toNamed("/memberslist"),
                      ), 
                    ],
                  ),
                  
                ),
              ),
              SizedBox(
                height:20,
              ),
            ],  
          ),
*/
//Need the old main for when things go south with this API shit...

/*
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
//import 'package:flutter_application_0/utils/routes.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
//import 'package:flutter_application_0/views/pages/calc_ui.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'models/album_model.dart';
//import 'package:flutter_application_0/views/pages/login.dart';

void main() {
  runApp(GetMaterialApp(
    //home: Login(),
    //home:Calculator(),
    home: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomizedTextWidget(
            label: "Testing API...",
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
          backgroundColor: paleGreen,
          foregroundColor: textingWhite,
        ),
        //body: Album(),
      ),
    ),
    //OG method of running these pages above.
    //Below is how we involve packages and a class made in utils
    //to do the same.
    //initialRoute: "/home",
    debugShowCheckedModeBanner: false,
    //getPages: TimosRoutes.paths,
  ));
}

*/
//New main, finally ok!
/*// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_0/configs/constants.dart';
import 'package:flutter_application_0/views/pages/first_list.dart';
//import 'package:flutter_application_0/utils/routes.dart';
import 'package:flutter_application_0/views/widgets/customizedtext.dart';
//import 'package:flutter_application_0/views/pages/calc_ui.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'models/album_model.dart';
//import 'package:flutter_application_0/views/pages/login.dart';

main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Login(),
      //home:Calculator(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: CustomizedTextWidget(
              label: "Testing API...",
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
            backgroundColor: paleGreen,
            foregroundColor: textingWhite,
          ),
          body: FirstList(),
        ),
      ),
      //OG method of running these pages above.
      //Below is how we involve packages and a class made in utils
      //to do the same.
      //initialRoute: "/home",
      debugShowCheckedModeBanner: false,
      //getPages: TimosRoutes.paths,
    );
  }  
}

*/

/*In case you need the button again to make one for cancelling...
 MaterialButton(
                        onPressed: () {
                          makeOrder(productController.productList[index].id,
                              productController.productList[index].price);
                        },
                        child: Text("Order"),
                        color: Colors.purple,
                      ),

         var data = json.decode(reponse.body);
      int orderDeletionStatus = data["Success!"];
      if (orderDeletionStatus == 1) {
        Fluttertoast.showToast(
            msg: "Order was successfully removed!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
      }

       Future<void> userDeetsDisplay() async {
    http.Response reponse =
        await http.get(Uri.parse("http://localhost/php-attempt1/read.php"));
    if (reponse.statusCode == 200) {
      var serverResponse = json.decode(reponse.body);
      var userResponse = serverResponse["data"];
      var userList =
          userResponse.map((user) => UserModel.fromJson(user)).toList();
      userController.updateUserList(userList);
    } else {
      Text("Error");
    }
  }

  Expanded(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          userController.userList.length,
                                      itemBuilder: (context, index) {
                                        return Center(
                                          child: Obx(
                                            () => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${index + 1}.${userController.userList[index].name_1}\n ${userController.userList[index].name_2}",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: textingWhite,
                                                    backgroundColor:
                                                        textingGray,
                                                  ),
                                                ),
                                                Text(
                                                  "${userController.userList[index].email}\n ${userController.userList[index].phone_no}",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: textingWhite,
                                                    backgroundColor:
                                                        textingGray,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ),
*/

/*
child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //This is where the output of the BODY changes based on one's role in the system.
                  //First condition before colon assumes an admin....
                  loginController.role.value == "1"
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(20, 50, 20, 40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/redstar.jpg",
                                    height: 200, width: 200),
                                CustomizedTextWidget(
                                  label:
                                      "Welcome, admin ${loginController.fullName.value}.",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomizedTextWidget(
                                  label: "Here's a list of our users so far",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                 CustomButton(
                                  buttonText: "Logout",
                                  unAction: () => Get.toNamed("/login"),
                                ),
                              ],
                            ),
                          ),
                        )
                      //...and this is where admin's side of things ends

                      :

                      //Below is for kawa user.
                      Image.asset("assets/images/bluestar.jpg",
                          height: 200, width: 200),
                  CustomizedTextWidget(
                    label: "Welcome to your personal profile.",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomizedTextWidget(
                    label:
                        "Hope you like it and please feel free to update it as needed",
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  CustomButton(
                    buttonText: "Logout",
                    unAction: () => Get.toNamed("/login"),
                  ),
                ]
            ),
          ),
        ),
*/
/*
Admin code to copy soon:
Image.asset("assets/images/redstar.jpg",
                                    height: 200, width: 200),
                                CustomizedTextWidget(
                                  label:
                                      "Welcome, admin ${loginController.fullName.value}.",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomizedTextWidget(
                                  label: "Here's a list of our users so far",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                 CustomButton(
                                  buttonText: "Logout",
                                  unAction: () => Get.toNamed("/login"),
                                ),
/*
Figure out how uploading an image would work...
for your own better dev, not necessarily for this project:                 
class pickImage extends StatefulWidget {
  const pickImage({super.key});

  @override
  createState() => _pickImage();
  
}

class _pickImage extends State<pickImage> {
  late File imageFile;

  Future<void>_pickImage (ImageSource src) async{

  }
  
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
                                */
*/