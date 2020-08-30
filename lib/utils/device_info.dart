import 'package:flutter/material.dart';

class DeviceInfo {

  ///
  ///Calcuates the device height
  ///subtraced by height taken by AppBar and status bar              
  static double getDeviceHeight(BuildContext context, PreferredSizeWidget appBar) {
      return MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top;  
  }
}