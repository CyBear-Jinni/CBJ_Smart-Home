enum DeviceType {
  Light, // Light ON/OFF
  DynamicLight, // Light with brightness 0% to 100%
  Blinds,
  Thermostat,
  Fan,
  AirConditioner,
  Camera,
  Fridge,
  Toaster,
  CoffeeMachine,
  SmartTV,
  RCAirplane,
  RCCar,
  Speakers,
  Roomba, // Cleaning robot
  Irrigation,
  SmartBed,
  AnimalTracker,
  SmartCar,
  SmartPool,
}

//  List of all the wishes that can be made
enum WishEnum {
  SOn, //  Turn the device on
  SOff, //  Turn the device off
  SChangeState, //  Change device state to the opposite one
  SDynamic, //  Set Dynamic Value
  ODynamic, //  Open connection to change dynamic value
  SMovement, //  Open connection to change dynamic value
  GState, //  Get device state on/off
  SBlindsUp, //  Turn the blinds up
  SBlindsDown, //  Turn the blinds Down
  SBlindsStop //  Stop the blinds
}

class EnumHelper {
  static String dTToString(DeviceType deviceType) {
    return deviceType.toString().replaceAll('DeviceType.', '');
  }

  static DeviceType stringToDt(String deviceTypeAsString) {
    if (deviceTypeAsString.contains('Object')) {
      deviceTypeAsString =
          deviceTypeAsString.substring(0, deviceTypeAsString.indexOf('Object'));
    }
    for (DeviceType deviceType in DeviceType.values) {
      if (dTToString(deviceType) == deviceTypeAsString) {
        return deviceType;
      }
    }
    return null;
  }

  //  Convert wishEnum to string
  static String wishEnumToString(WishEnum wishEnum) {
    return wishEnum.toString().replaceAll('WishEnum.', '');
  }

  //  Convert string to wishEnum
  static WishEnum stringToWishEnum(String wishEnumString) {
    for (WishEnum wishEnum in WishEnum.values) {
      if (wishEnumToString(wishEnum) == wishEnumString) {
        return wishEnum;
      }
    }
    return null;
  }
}
