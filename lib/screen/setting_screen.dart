import 'package:flutter/material.dart';
import 'package:multisearchabledropdown/provider/setting.dart';
import 'package:multisearchabledropdown/screen/components/searchable_selection_department.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'components/searchable_selection_room.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  void initState() {
    super.initState();
    initData();
  }

  Future<void> initData() async {
    Provider.of<SettingProvider>(context, listen: false).loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<SettingProvider> (
      builder: (context, setting, _) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: false, // hides leading widget
            flexibleSpace: Container(
                height: 140,
                width: 400,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: 25,
                        left: 20,
                        child: Container(
                          width: 80,
                          height: 80,
                        )
                    ),
                  ],
                )
            ),
            backgroundColor: kPrimaryLightColor,
          ),
        ),
        body: SafeArea(
          child:  Container(
            height: size.height* 0.75,
            margin: EdgeInsets.only(top: 20, right: 200, left: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kPrimaryLightColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 6,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /* -- All fields Name -- */
                  Container(
                    margin: EdgeInsets.only(left: 70, top: 40),
                    height: 40,
                    child: Text("Cài đặt chung", style: TextStyle(
                      fontSize: 26,
                      color: kGrey,
                      decoration: TextDecoration.underline,
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom:5),
                    child: SearchableSelectionDepartment(
                      items: setting.listDepartment,
                      onChanged: (value) {
                        if(value != null) {
                        } else {

                        }
                      },
                    ),
                  ),
                  /* -- Field Room -- */
                  Container(
                    margin: EdgeInsets.only(bottom:5),
                    child: SearchableSelectionRoom(
                      items: setting.listRoom,
                      onChanged: (value) {
                        if(value != null) {
                        } else {
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}