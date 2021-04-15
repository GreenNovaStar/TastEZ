import 'package:flutter/material.dart';
import 'package:tastez/GUI/AppBar/AppBar.dart';
import 'package:tastez/GUI/Const.dart';
import 'package:tastez/Middleware/HomePage/OverFlowButtonIcons.dart';
import 'package:tastez/Middleware/TestingConst/NavigatorConst.dart';

class CurvyAppBar extends StatelessWidget {

  Size size;
  GestureTapCallback onLogoPressed;
  String currentPageTitle;
  // PageController pageController;
  CurvyAppBar({@required this.size, this.onLogoPressed, this.currentPageTitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: size.width,
              height: 100,
              color: subAccentColor,//Color(0x00000000),
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 100),
                    painter: AppBarCustomPainter(),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              // padding: const EdgeInsets.only(left: 15.0),
                              padding: const EdgeInsets.only(left: 1.0),
                              //child: SizedBox(height: 33, child: Image.asset('assets/TastEZ_whitetext.png')),
                              child: MaterialButton(
                                onPressed: onLogoPressed,
                                //onPressed: () => bodyNavigatorKey.currentState.pushReplacementNamed('/suggestions'),
                                child: SizedBox(height: 33, child: Image.asset('assets/TastEZ_whitetext.png')),
                              ),
                            ),
                          ), //app logo
                          Container(width: size.width*0.30), //separator between logo and buttons
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            width: appBarIconPaddingSpace,
                            child: IconButton(
                              onPressed: () {print("refresh button pressed");},
                              icon: Icon(Icons.refresh_rounded),
                              splashRadius: 20,
                              color: Colors.white,
                            ),
                          ), //refresh button
                          Container(
                            padding: const EdgeInsets.all(0.0),
                            width: appBarIconPaddingSpace,
                            child: PopupMenuButton<String>(
                              color: Colors.white,
                              onSelected: (item) => DialogConstants.selectedItemProfile(item, context),
                              itemBuilder: (BuildContext context){
                                //if person is logged in

                                return DialogConstants.dialogChoicesProfile.map((String item) {
                                  return PopupMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList();
                              },
                              icon: CircleAvatar(
                                maxRadius: 15,
                                //backgroundColor: Colors.black12,
                                backgroundColor: Color(0x00000000), //transparent color code
                                //backgroundImage: NetworkImage("https://www.clipartmax.com/png/small/15-153165_log-clipart-user-profile-phone-png.png"), //need to link with user profile
                                child: Container(
                                  // decoration: BoxDecoration(
                                  //   shape: BoxShape.circle,
                                  //   border: Border.all(color: Colors.white)),
                                    child: Icon(Icons.person, color: Colors.white)), //fallback if there is no profile picture
                              ),
                            ),
                          ), //profile icon button
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            width: appBarIconPaddingSpace,
                            child: PopupMenuButton<String>(
                              color: Colors.white,
                              onSelected: (item) => DialogConstants.selectedItemOverflow(item, context),
                              itemBuilder: (BuildContext context){
                                return DialogConstants.dialogChoicesOverflow.map((String item) {
                                  return PopupMenuItem<String>(
                                    value: item,
                                    child: Text(item),
                                  );
                                }).toList();
                              },
                              icon: Icon(Icons.more_vert, color: Colors.white),
                            ),
                          ), //overflow button
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ), // appbar_top
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 35,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 80, bottom: 0),
                  // child: Text(getCurrentPageNameUpdated(bodyNavigatorKey.currentWidget.toStringShort()), style: pageTitleFont),
                  // child: Text("Work in Progress", style: pageTitleFont),
                  child: Text(currentPageTitle, style: pageTitleFont),
                ),
              ),
            ),
          ), // appbar_bottom

          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   child: Container(
          //     height: 35,
          //     child: Center(
          //       child: Padding(
          //         padding: const EdgeInsets.only(left: 80, bottom: 0),
          //         child: Text(currentPageTitle, style: pageTitleFont),
          //         // child: controller.hasClients ? Text(getCurrentPageName(controller.page.toInt()), style: pageTitleFont) : Text("Loading...", style: pageTitleFont),
          //         // child: Text("Loading...", style: pageTitleFont),
          //         // child: pageController != null ?
          //         // pageController.hasClients ? Text(getCurrentPageName(pageController.page.toInt()), style: pageTitleFont) : Text("Loading...", style: pageTitleFont) :
          //         //         Text("Loading...", style: pageTitleFont),
          //         // child: currentPageTitle != null ? Text(currentPageTitle, style: pageTitleFont) : Text("Loading...", style: pageTitleFont),
          //       ),
          //     ),
          //   ),
          // ), // appbar_bottom
        ],
      ),
    );
  }

  String getCurrentPageName(int page){
    switch(page){
      case 0: return "Suggestions";
      case 1: return "Favorites";
      case 2: return "Pantry";
      case 3: return "Shopping List";
    }
  }

  String getCurrentPageNameUpdated(String name){
    print(name);
    return "WIP";
  }

}
