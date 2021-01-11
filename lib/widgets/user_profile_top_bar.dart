//import 'dart:js';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UserTopBar extends StatefulWidget {
  @override
  _UserTopBarState createState() => _UserTopBarState();
}

var iconColorChanger1 = Colors.white;
var iconColorChanger2 = Colors.white;
var iconColorChanger3 = Colors.white;
var iconColorChanger4 = Colors.white;
var iconColorChanger5 = Colors.white;

var settingsBtn = Icon(Icons.settings);
var postBtn = Icon(Icons.add_box_outlined);
var statsBtn = Icon(Icons.bar_chart_outlined);

class _UserTopBarState extends State<UserTopBar> {
  File _image;
  final picker = ImagePicker();
  bool inProcess = false;

  Future getImage(ImageSource source) async {
    this.setState(() {
      inProcess = true;
    });
    final pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      File cropped = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.original,
          // CropAspectRatioPreset.ratio4x3,
          // CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepPurple,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        // iosUiSettings: IOSUiSettings(
        //   minimumAspectRatio: 1.0,
        // )
      );
      this.setState(() {
        _image = cropped;
        Navigator.of(context).pushNamed(
          '/snapedit',
          arguments: _image,
        );
        inProcess = false;
      });
    } else {
      this.setState(() {
        inProcess = false;
      });
    }

    // setState(() {
    //   if (pickedFile != null) {
    //     _image = File(pickedFile.path);
    //     Navigator.of(context).pushNamed(
    //       '/snapedit',
    //       arguments: _image,
    //     );
    //   } else {
    //     print('No image selected.');
    //   }
    // });
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(
                      Icons.account_circle_outlined,
                      // color: iconColorChanger4,
                    ),
                    title: new Text('Profile Statistics',
                        style: TextStyle(
                            // color: iconColorChanger4,
                            )),
                    onTap: () => {
                          setState(() {
                            Navigator.pop(context);
                            iconColorChanger1 = Colors.white;
                            // iconColorChanger4 = Colors.purpleAccent;
                          })
                        }),
                new ListTile(
                  leading: new Icon(
                    Icons.shop_outlined,
                    color: iconColorChanger5,
                  ),
                  title: new Text('Shop Statistics',
                      style: TextStyle(
                        color: iconColorChanger5,
                      )),
                  onTap: () => {
                    setState(() {
                      Navigator.pop(context);
                      iconColorChanger1 = Colors.white;
                      // iconColorChanger5 = Colors.purpleAccent;
                    })
                  },
                ),
              ],
            ),
          );
        }).whenComplete(() => {
          setState(() {
            iconColorChanger1 = Colors.white;
            // iconColorChanger5 = Colors.purpleAccent;
          })
        });
  }

  void _settingModalBottomSheet2(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(
                      MdiIcons.pencilBoxOutline,
                      //color: iconColorChanger4,
                    ),
                    title: new Text('Guide',
                        style: TextStyle(
                            // color: iconColorChanger4,
                            )),
                    onTap: () => {
                          setState(() {
                            //iconColorChanger4 = Colors.purpleAccent;
                            Navigator.pop(context);
                            iconColorChanger2 = Colors.white;
                          })
                        }),
                new ListTile(
                  leading: new Icon(
                    Icons.camera_alt_outlined,
                    // color: iconColorChanger5,
                  ),
                  title: new Text('Snap',
                      style: TextStyle(
                          // color: iconColorChanger5,
                          )),
                  onTap: () => {
                    setState(() {
                      Navigator.pop(context);
                      iconColorChanger2 = Colors.white;

                      // iconColorChanger5 = Colors.purpleAccent;
                    }),
                    _pickImage(context)
                  },
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.shop_outlined,
                    // color: iconColorChanger5,
                  ),
                  title: new Text('Shop',
                      style: TextStyle(
                          //  color: iconColorChanger5,
                          )),
                  onTap: () => {
                    setState(() {
                      Navigator.pop(context);
                      iconColorChanger2 = Colors.white;
                      // iconColorChanger5 = Colors.purpleAccent;
                    })
                  },
                ),
              ],
            ),
          );
        }).whenComplete(() => {
          setState(() {
            iconColorChanger2 = Colors.white;
            postBtn = Icon(Icons.add_box_outlined);
            // iconColorChanger5 = Colors.purpleAccent;
          })
        });
  }

  void _pickImage(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(
                    Icons.camera_alt_outlined,
                    // color: iconColorChanger5,
                  ),
                  title: new Text('Camera',
                      style: TextStyle(
                          // color: iconColorChanger5,
                          )),
                  onTap: () => {
                    setState(() {
                      Navigator.pop(context);
                      //iconColorChanger2 = Colors.white;
                      // iconColorChanger5 = Colors.purpleAccent;
                    }),
                    getImage(ImageSource.camera),
                    // Navigator.of(context).pushNamed(
                    //   '/snapedit',
                    //   arguments: _image,
                    // )
                  },
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.image_outlined,
                    // color: iconColorChanger5,
                  ),
                  title: new Text('Gallery',
                      style: TextStyle(
                          //  color: iconColorChanger5,
                          )),
                  onTap: () => {
                    setState(() {
                      Navigator.pop(context);
                      //iconColorChanger2 = Colors.white;
                      // iconColorChanger5 = Colors.purpleAccent;
                    }),
                    getImage(ImageSource.gallery)
                  },
                ),
              ],
            ),
          );
        }).whenComplete(() => {
          // setState(() {

          //   // iconColorChanger5 = Colors.purpleAccent;
          // })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(children: <Widget>[
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: CircleAvatar(
                //       radius: 15,
                //       backgroundImage: AssetImage('assets/Images/halsey1.jpg')),
                // ),
                Text('Malith priyashan')
              ]),
              Row(children: <Widget>[
                IconButton(
                    icon: statsBtn,
                    color: iconColorChanger1,
                    onPressed: () {
                      setState(() {
                        iconColorChanger1 = Colors.purpleAccent;
                        iconColorChanger2 = Colors.white;
                        iconColorChanger3 = Colors.white;
                        statsBtn = Icon(Icons.bar_chart);
                        postBtn = Icon(Icons.add_box_outlined);
                        settingsBtn = Icon(Icons.settings_outlined);
                        _settingModalBottomSheet(context);
                      });
                    }),
                IconButton(
                    icon: postBtn,
                    color: iconColorChanger2,
                    onPressed: () {
                      setState(() {
                        iconColorChanger2 = Colors.purpleAccent;
                        iconColorChanger1 = Colors.white;
                        iconColorChanger3 = Colors.white;
                        postBtn = Icon(Icons.add_box);
                        statsBtn = Icon(Icons.bar_chart_outlined);
                        settingsBtn = Icon(Icons.settings_outlined);
                        _settingModalBottomSheet2(context);
                      });
                    }),
                IconButton(
                    icon: settingsBtn,
                    color: iconColorChanger3,
                    onPressed: () {
                      setState(() {
                        iconColorChanger3 = Colors.purpleAccent;
                        iconColorChanger2 = Colors.white;
                        iconColorChanger1 = Colors.white;
                        settingsBtn = Icon(Icons.settings);
                        statsBtn = Icon(Icons.bar_chart_outlined);
                        postBtn = Icon(Icons.add_box_outlined);
                      });
                    }),
              ]),
            ]),
        (inProcess)
            ? Container(
                height: MediaQuery.of(context).size.height * 0.95,
                child: Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.purpleAccent,
                )),
              )
            : Center()
      ],
    );
  }
}
