import 'package:flutter/material.dart';
import 'package:multisearchabledropdown/components/searchable_dropdown.dart';
import 'package:multisearchabledropdown/model/department_model.dart';

import '../../constants.dart';

class SearchableSelectionDepartment extends StatefulWidget {

  const SearchableSelectionDepartment({Key key,@required this.items,  @required this.onChanged , this.onClear}) : super(key: key);

  final Function onChanged;

  final List<DepartmentModel> items;

  final Function onClear;


  @override
  _SearchableSelectionState createState() => _SearchableSelectionState();
}

class _SearchableSelectionState extends State<SearchableSelectionDepartment> {


  _SearchableSelectionState();

  List<DropdownMenuItem> departmentItems = [];

  List<DropdownMenuItem> departmentItemsNull = [];

  String selectedDepartmentNull;

  String selectedDepartment;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.items != null) {
      if(widget.items.length > 0 ) {
        widget.items.forEach((element) {
          departmentItems.add(DropdownMenuItem(child: Text(element.roomName.toString()), value: element.roomName.toString()));
        });
      } else {
        departmentItems = [];
      }
    }
  }

  @override
  void didUpdateWidget(SearchableSelectionDepartment oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    departmentItems = [];
    if(widget.items != null) {
      if(widget.items.length > 0 ) {
        widget.items.forEach((element) {
          departmentItems.add(DropdownMenuItem(child: Text(element.roomName.toString()), value: element.roomName.toString()));
        });
      } else {
        departmentItems = [];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 170),
      decoration: BoxDecoration(
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 6),
            child: Text("Số khoa", style: TextStyle(
              fontSize: 20,
              color: kGrey,
            )),
            width: size.width * 0.09,
          ),
          Container(
            height: 60,
            width: size.width * 0.38,
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
            ),
            child: widget.items != null && widget.items.length > 0 ? SearchableDropdownTextField.create(
              closeButton: "Đóng",
              items: departmentItems,
              value: selectedDepartment,
              hint: "Vui lòng chọn khoa",
              searchHint: "Chọn khoa ...",
              style: TextStyle(
                  fontSize: 16, color: kGrey, decoration: TextDecoration.none, fontFamily: 'Roboto', fontWeight: FontWeight.w100
              ),
              underline: Container(
                  decoration: BoxDecoration(
                  )
              ),
              selectedValueWidgetFn: (item) {
                return Container(
                    child: Text(item)
                );
              },
              onChanged: (value) {
                widget.onChanged(value);
              },
              validator:(value) {
                if(value == null|| value == TextEditingValue.empty) {
                  return ("Bạn phải chọn khoa");
                }
                return (null);
              },
              isExpanded: true,
            ) : SearchableDropdownTextField.create(
              closeButton: "Đóng",
              items: departmentItemsNull,
              value: selectedDepartmentNull,
              hint: "Vui lòng chọn khoa",
              searchHint: "Chọn khoa ...",
              style: TextStyle(
                  fontSize: 16, color: kGrey, decoration: TextDecoration.none, fontFamily: 'Roboto', fontWeight: FontWeight.w100
              ),
              underline: Container(
                  decoration: BoxDecoration(
                  )
              ),
              selectedValueWidgetFn: (item) {
                return Container(
                    child: Text(item)
                );
              },
              onChanged: (value) {
                if(value != null) {
                } else {
                }
              },
              validator:(value) {
                if(value == null|| value == TextEditingValue.empty) {
                  return ("Bạn phải chọn phòng");
                }
                return (null);
              },
              onClear: () {
                widget.onClear();
              },
              isExpanded: true,
            ),
          ),
        ],
      ),
    );
  }

}