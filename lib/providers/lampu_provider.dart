  import 'package:flutter/cupertino.dart';

  class LampuProvider extends ChangeNotifier {
    bool _isHidup1 = false;
    bool _isHidup2 = false;
    bool _isHidup3 = false;
    bool _isHidup4 = false;

    bool get isHidup1 => _isHidup1;
    bool get isHidup2 => _isHidup2;
    bool get isHidup3 => _isHidup3;
    bool get isHidup4 => _isHidup4;

    bool get isHidup => _isHidup1 && _isHidup2 && _isHidup3 && _isHidup4;
    

    void statusLampu1(bool status) {
      _isHidup1 = status;
      notifyListeners();
    }

    void statusLampu2(bool status) {
      _isHidup2 = status;
      notifyListeners();
    }

    void statusLampu3(bool status) {
      _isHidup3 = status;
      notifyListeners();
    }

    void statusLampu4(bool status) {
      _isHidup4 = status;
      notifyListeners();
    }

    void setSemuaLampu(bool status) {
      _isHidup1 = status;
      _isHidup2 = status;
      _isHidup3 = status;
      _isHidup4 = status;
      notifyListeners();
    }
  }
