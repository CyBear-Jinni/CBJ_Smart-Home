import '../device_information.dart';


class DynamicWish {

  static String SetDynamic(DeviceInformation deviceInformation) {
    switch (deviceInformation.runtimeType) {
      case RemoteDevice:
        return SetDynamicRemote(deviceInformation);
      case LocalDevice:
        return SetDynamicLocal(deviceInformation);
    }
    return 'DeviceBase type not supported';
  }

  //  One time per request change of the local dynamic value
  static String SetDynamicLocal(DeviceInformation deviceInformation) {
    return 'Response from local dynamic sucsessful';
  }

  //  One time per request change of the remote dynamic value
  static String SetDynamicRemote(DeviceInformation deviceInformation) {
    return 'Response from remote device dynamic sucsessful';
  }


  static String OpenDynamic(DeviceInformation deviceInformation) {
    return "Response open dynamic not supported yet";
  }


//  TODO: Open connection for fluid local dynamic value change


//  TODO: Open connection for fluid remote dynamic value change

}
