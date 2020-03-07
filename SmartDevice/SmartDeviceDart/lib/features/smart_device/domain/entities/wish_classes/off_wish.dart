import 'package:SmartDeviceDart/core/device_information.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/devices_pin_configuration/pin_information.dart';
import 'package:SmartDeviceDart/features/smart_device/data/datasources/manage_physical_components/pins_datasource/sending_signals_to_pins/pin_on_off.dart';
import 'package:SmartDeviceDart/injection.dart';

class OffWish {

  static String SetOff(DeviceInformation deviceInformation,
      PinInformation pinNumber) {
    pinNumber.v = 0;
    switch (deviceInformation.runtimeType) {
      case LocalDevice:
        return SetOffLocal(deviceInformation, pinNumber);
      case RemoteDevice:
        return SetOffRemote(deviceInformation, pinNumber);
    }
    return 'DeviceBase type not supported';
  }

  //  Turn this device off
  static String SetOffLocal(LocalDevice deviceInformation,
      PinInformation pinNumber) {
//    pinOff(7);
    getIt<TurnPinOnOffAbstract>().PinOff(pinNumber);
    return 'Response from this device off sucsessful';
  }

  //  Change the remote device off
  static String SetOffRemote(RemoteDevice remoteDevice,
      PinInformation pinNumber) {
//    try {
//      HttpClient()
//          .getUrl(Uri.parse('http://' +
//              remoteDevice.getIp() +
//              '/LED=OFF')) // produces a request object
//          .then((request) => request.close()) // sends the request
//          .then((HttpClientResponse response) {
//        print(response.transform(Utf8Decoder()).listen(print));
//      });
//    }
//    catch (e) {
//      print('Exception: ' + e);
//    }
    return 'Response from remote device off sucsessful';
  }
}
