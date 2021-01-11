import 'package:experiment1/widgets/bottom_navigationbar.dart';

import 'widgets/gradient_button.dart';
// import 'widgets/profile_top_bar.dart';
import 'widgets/route_generator.dart';
import 'widgets/user_profile_top_bar.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cursorColor: Colors.purpleAccent,
        // primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/userprofile',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  //int _selectedIndex = 0;
  var guideNo = 3;
  var snapNo = 4;
  var guideSnap;

  bool isFollowClicked = false;
  bool isShopClicked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
  }

  bool folded = true;

  var userName = 'Malith Priyashan';
  var location = 'Srilanka';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: UserTopBar(), //ProfileTopBar(),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            // SafeArea(
            //  child: ProfileTopBar(),
            //  ),
            //_widgetOptions.elementAt(_selectedPage),
            // construct the profile details widget here
            SizedBox(
              height: MediaQuery.of(context).size.height / 2.6,
              child: ListView(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.deepPurpleAccent,
                      child: CircleAvatar(
                        radius: 46,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage:
                              AssetImage('assets/Images/halsey1.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(children: <Widget>[
                        Text(
                          '$userName',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Row(children: <Widget>[
                          Icon(Icons.location_on),
                          Text(
                            '$location',
                            style: TextStyle(fontSize: 16),
                          ),
                        ]),
                        ButtonBar(children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              if (isFollowClicked) {
                                setState(() {
                                  isFollowClicked = false;
                                });
                                //  print("hutto");
                              } else {
                                setState(() {
                                  isFollowClicked = true;
                                });

                                // print("hutti");
                              }
                            },
                            child: GradientButton(
                              mixColor1: isFollowClicked
                                  ? Colors.black
                                  : Colors.purpleAccent,
                              mixColor2: isFollowClicked
                                  ? Colors.black
                                  : Colors.deepPurpleAccent,
                              textColor: isFollowClicked
                                  ? Colors.purpleAccent
                                  : Colors.white,
                              borderColor: isFollowClicked
                                  ? Colors.purpleAccent
                                  : Colors.transparent,
                              btnText: isFollowClicked ? 'Following' : 'Follow',
                              btnHeight: 16.0,
                              btnWidth: 22.0,
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              if (isShopClicked) {
                                setState(() {
                                  isShopClicked = false;
                                });
                                //  print("hutto");
                              } else {
                                setState(() {
                                  isShopClicked = true;
                                });

                                // print("hutti");
                              }
                            },
                            child: GradientButton(
                              mixColor1: Colors.purpleAccent,
                              mixColor2: Colors.deepPurpleAccent,
                              textColor: Colors.white,
                              borderColor: Colors.transparent,
                              btnText: 'Shop',
                              btnWidth: 26.0,
                              btnHeight: 16.0,
                            ),
                          ),

                          // GradientButton(mixColor1: Colors.purpleAccent, mixColor2: Colors.deepPurpleAccent, btnText: 'Shop', textColor: Colors.white, borderColor: null)
                        ]),
                      ]),
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(children: <Widget>[
                            Text('1M',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.purpleAccent)),
                            Text('Followers')
                          ]),
                          Column(children: <Widget>[
                            Text('1246',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.purpleAccent)),
                            Text('Following')
                          ]),
                        ]),
                    Divider(
                      color: Colors.purpleAccent,
                      thickness: 2,
                      indent: 45,
                      endIndent: 45,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'My name is malith.I am 23 years old.I have bulky arms.I go to gym every sunday.',
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]),
                ),
              ]),
            ),

            // the tab bar with two items
            SizedBox(
              height: 60,
              child: AppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                bottom: TabBar(
                  controller: controller,
                  indicatorColor: Colors.purpleAccent,
                  labelColor: Colors.purpleAccent,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(
                      //icon: Icon(Icons.directions_bike),
                      text: 'Guides',
                    ),
                    Tab(
                      text: 'Snaps',
                    ),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  // first tab bar view widget
                  //Column(children: <Widget>[])
                  Container(
                      padding: EdgeInsets.all(8.0),
                      //use list view builder to generate data
                      child: ListView(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, top: 4, right: 4, bottom: 4),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "$guideNo Guides",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 400),
                                  width: folded ? 46 : 285,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.black26,
                                    border:
                                        Border.all(color: Colors.purpleAccent),
                                    boxShadow: kElevationToShadow[6],
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 16),
                                          child: !folded
                                              ? TextField(
                                                  decoration: InputDecoration(
                                                      hintText: 'Search',
                                                      hintStyle: TextStyle(
                                                          color: Colors
                                                              .purpleAccent),
                                                      border: InputBorder.none),
                                                )
                                              : null,
                                        ),
                                      ),
                                      Container(
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: InkWell(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  folded ? 32 : 0),
                                              topRight: Radius.circular(32),
                                              bottomLeft: Radius.circular(
                                                  folded ? 32 : 0),
                                              bottomRight: Radius.circular(32),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Icon(
                                                folded
                                                    ? Icons.search
                                                    : Icons.close,
                                                color: Colors.purpleAccent,
                                              ),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                folded = !folded;
                                              });
                                            },
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        Card(
                          child: ListTile(
                            leading: FlutterLogo(size: 72.0),
                            title: Text('Three-line ListTile'),
                            subtitle: Text(
                                'A sufficiently long subtitle warrants three lines.'),
                            trailing: Icon(Icons.bookmark),
                            isThreeLine: true,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: FlutterLogo(size: 72.0),
                            title: Text('Three-line ListTile'),
                            subtitle: Text(
                                'A sufficiently long subtitle warrants three lines.'),
                            trailing: Icon(Icons.bookmark),
                            isThreeLine: true,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: FlutterLogo(size: 72.0),
                            title: Text('Three-line ListTile'),
                            subtitle: Text(
                                'A sufficiently long subtitle warrants three lines.'),
                            trailing: Icon(Icons.bookmark),
                            isThreeLine: true,
                          ),
                        ),
                        Card(
                          child: ListTile(
                            leading: FlutterLogo(size: 72.0),
                            title: Text('Three-line ListTile'),
                            subtitle: Text(
                                'A sufficiently long subtitle warrants three lines.'),
                            trailing: Icon(Icons.bookmark),
                            isThreeLine: true,
                          ),
                        ),
                      ])),

                  // second tab bar view widget
                  Container(
                    //child: Text('a'),
                    //color: Colors.purpleAccent,
                    child: ListView(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              top: 4,
                              right: 4,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "$snapNo Snaps",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 400),
                                    width: folded ? 46 : 285,
                                    height: 46,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(32),
                                      color: Colors.black26,
                                      border: Border.all(
                                          color: Colors.purpleAccent),
                                      boxShadow: kElevationToShadow[6],
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.only(left: 16),
                                            child: !folded
                                                ? TextField(
                                                    //cursorColor: Colors.white,
                                                    decoration: InputDecoration(
                                                        hintText: 'Search',
                                                        hintStyle: TextStyle(
                                                            color: Colors
                                                                .purpleAccent),
                                                        border:
                                                            InputBorder.none),
                                                  )
                                                : null,
                                          ),
                                        ),
                                        Container(
                                          child: Material(
                                            type: MaterialType.transparency,
                                            child: InkWell(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    folded ? 32 : 0),
                                                topRight: Radius.circular(32),
                                                bottomLeft: Radius.circular(
                                                    folded ? 32 : 0),
                                                bottomRight:
                                                    Radius.circular(32),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Icon(
                                                  folded
                                                      ? Icons.search
                                                      : Icons.close,
                                                  color: Colors.purpleAccent,
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  folded = !folded;
                                                });
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                        GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          padding: const EdgeInsets.all(7),
                          physics:
                              NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                          shrinkWrap: true, // You won't see infinite size error
                          children: <Widget>[
                            Column(
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Ink.image(
                                    image: AssetImage(
                                        'assets/Images/Untitled.png'),
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Card With Splash',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Ink.image(
                                    image: AssetImage(
                                        'assets/Images/Untitled.png'),
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Card With Splash',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Ink.image(
                                    image: AssetImage(
                                        'assets/Images/Untitled.png'),
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Card With Splash',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Ink.image(
                                    image: AssetImage(
                                        'assets/Images/Untitled.png'),
                                    child: InkWell(
                                      onTap: () {},
                                    ),
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Card With Splash',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // ...... other list children.
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar1(),
      ),
    );
  }
}
