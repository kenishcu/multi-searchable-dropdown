import 'package:flutter/material.dart';
import 'package:multisearchabledropdown/components/searchable_dropdown.dart';
import 'package:multisearchabledropdown/model/room_model.dart';
import '../../constants.dart';

class SearchableSelectionRoom extends StatefulWidget {

  const SearchableSelectionRoom({Key key,@required this.items,  @required this.onChanged , this.onClear, this.selectedRoom}) : super(key: key);

  final Function onChanged;

  final List<RoomModel> items;

  final String selectedRoom;

  final Function onClear;


  @override
  _SearchableSelectionState createState() => _SearchableSelectionState();
}

class _SearchableSelectionState extends State<SearchableSelectionRoom> {


  _SearchableSelectionState();

  List<DropdownMenuItem> roomItems = [];

  List<DropdownMenuItem> roomItemsNull = [];

  String selectedRoomNull;

  String selectedRoom;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.items != null) {
      if(widget.items.length > 0 ) {
        widget.items.forEach((element) {
          roomItems.add(DropdownMenuItem(child: Text(element.roomName.toString()), value: element.roomName.toString()));
        });
      } else {
        roomItems = [];
      }
    }
  }

  @override
  void didUpdateWidget(SearchableSelectionRoom oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    roomItems = [];
    if(widget.items != null) {
      if(widget.items.length > 0 ) {
        widget.items.forEach((element) {
          roomItems.add(DropdownMenuItem(child: Text(element.roomName.toString()), value: element.roomName.toString()));
        });
      } else {
        roomItems = [];
      }
    }
    selectedRoom = widget.selectedRoom;
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
            child: Text("Số phòng", style: TextStyle(
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
              items: roomItems,
              value: selectedRoom,
              hint: "Vui lòng chọn phòng",
              searchHint: "Chọn phòng ...",
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
                  return ("Bạn phải chọn phòng");
                }
                return (null);
              },
              isExpanded: true,
            ) : SearchableDropdownTextField.create(
              closeButton: "Đóng",
              items: roomItemsNull,
              value: selectedRoomNull,
              hint: "Vui lòng chọn phòng",
              searchHint: "Chọn phòng ...",
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