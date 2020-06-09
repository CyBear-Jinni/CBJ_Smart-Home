import 'package:CybearJinni/features/shared_widgets/insert_details_of_new_device.dart';
import 'package:CybearJinni/objects/enums.dart';
import 'package:CybearJinni/objects/smart_device/smart_device_object.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class AddNewDeviceWidgetPopup extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddNewDeviceWidgetPopup();
  }
}

class _AddNewDeviceWidgetPopup extends State<AddNewDeviceWidgetPopup> {
  static DeviceType _deviceType = DeviceType.Light;
  static String _roomName;
  static String _deviceName;
  static String _ip;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Future<String> getMyWifiIp() async {
    return Connectivity().getWifiIP();
  }

//  await (Connectivity().getWifiName());wifi network
  Widget addNewDeviceWidget = ListBody(
    children: <Widget>[
      FutureBuilder<String>(
        future: getMyWifiIp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return TextFormField(
              autofocus: false,
              initialValue: snapshot.data.substring(
                  0, snapshot.data.length - 1),
              onSaved: (String ip) => _ip = ip,
              keyboardType: TextInputType.number,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'IP is required';
                }
                if (SmartDeviceObject.legitIp(value)) {
                  return 'IP syntax is incorrect';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'IP ',
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        title: Text('Add Smart Device'),
        content: SingleChildScrollView(
          child: addNewDeviceWidget,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Add'),
            onPressed: () {
              _formKey.currentState.save();
//              rooms[0].getLights()[0] =
//                  SmartDeviceObject(_deviceType, _deviceName, _ip, _roomName);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        InsertDetailsOfNewDevice(_ip)),
                //            Navigator.of(context).pop();
              );
            },
          ),
        ],
      ),
    );
  }
}

class DropDownMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropDownMenu();
  }
}

class _DropDownMenu extends State<DropDownMenu> {
  String dropdownValue = 'Light';

  String _deviceTypeToString(DeviceType deviceType) {
    return EnumHelper.dTToString(deviceType);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
//            },'Light', 'Dynamic light', 'Blinds', 'Four'
      items: <String>[
        _deviceTypeToString(DeviceType.Light),
        _deviceTypeToString(DeviceType.DynamicLight),
        _deviceTypeToString(DeviceType.Blinds),
        _deviceTypeToString(DeviceType.Thermostat),
        _deviceTypeToString(DeviceType.AirConditioner),
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
