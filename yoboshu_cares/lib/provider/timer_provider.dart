import 'dart:async';

import 'package:flutter/cupertino.dart';

class TimerProvider with ChangeNotifier{
  int _dotNum = -1;
  int _timer = 30;
  bool _switchValue = true;
  bool _buttonData = true;
  bool _buttonState = true;
   Duration _oneSec = Duration(seconds: 1);

  int get dotNum => _dotNum;
  int get timer => _timer;
  bool get switchValue => _switchValue;
  bool get buttonData => _buttonData;
  bool get buttonState => _buttonState;

  void setDotNum(){
    if(_dotNum >= 2){
      _dotNum = -1;
    }else{
      _dotNum++;
    }
    notifyListeners();
  }

  void resetDotNum(){
      _dotNum = -1;
    notifyListeners();
  }

  void setTimer(){
      Timer _time = Timer.periodic(
        _oneSec,
            (Timer time) {
          if (timer == 0) {
              time.cancel();
          } else {
              _timer--;
          }
        },
      );
    notifyListeners();
  }

  void setSwitch(){
      _switchValue = !_switchValue;
      notifyListeners();
  }

  void setButtonData(){
      _buttonData = !_buttonData;
      notifyListeners();
  }


  void setButtonState(){
    _buttonState = !_buttonState;
      notifyListeners();
  }

}