import 'package:a05/assets/colors.dart';
import 'package:a05/models/kid_model.dart';
import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  //DropDownMenu({Key key}) : super(key: key);
  final List<Kid> listKids;

  const DropDownMenu({@required this.listKids});
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String dropdownValue = '';
  String name = '';
  String edad = '';
  String peso = '';

  List<String> names = [];

  @override
  void initState() {
    names.add('');
    for (int i = 0; i < widget.listKids.length; i++) {
      print(widget.listKids[i].nickname);
      names.add(widget.listKids[i].nickname);
    }
    super.initState();
  }

  void getDropDownItem() {
    setState(() {
      name = dropdownValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    getDropDownItem();
    for (int i = 0; i < widget.listKids.length; i++) {
      if (name == widget.listKids[i].nickname) {
        setState(() {
          edad = '${widget.listKids[i].meses} meses';
          peso = '${widget.listKids[i].pesoActual} kg';
        });
      }
    }
    return Container(
      //Info del nino
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('$name', style: TextStyle(fontSize: 26))
                ],
              ),
              Row(
                children: <Widget>[Text('$edad')],
              ),
              Row(
                children: <Widget>[Text('$peso')],
              )
            ],
          ),
          Container(
              padding: EdgeInsets.only(left: 25),
              child: Column(children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Perfil',
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                Row(children: <Widget>[
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: $mainColor),
                    underline: Container(
                      height: 2,
                      color: $mainColor,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: names.map(((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    })).toList(),
                  )
                ])
              ]))
        ],
      ),
    );
  }
}
