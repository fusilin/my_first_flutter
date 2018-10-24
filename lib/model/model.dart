import 'package:scoped_model/scoped_model.dart';

class GlobalModel extends Model {
  double _statusHeight = 0.0;
  get statusHeight => _statusHeight;

  double _deviceWidth = 0.0;
  get deviceWidth => _deviceWidth;

  int _opacity = 0;
  get opacity => _opacity;

  String _title = ' ';
  get title => _title;

  int _titleOpacity = 0;
  get titleOpacity => _titleOpacity;

  void getStatusHeight(value) {
    _statusHeight = value;
    notifyListeners();
  }

  void getDeviceWidth(value) {
    _deviceWidth = value;
    notifyListeners();
  }

  void changeOpacity(value) {
    _opacity = value;
    notifyListeners();
  }

  void changeTitle(value) {
    _title = value;
    notifyListeners();
  }

  void changeTitleOpacity(value) {
    _titleOpacity = value;
    notifyListeners();
  }

  // CountModel of(context) => ScopedModel.of<CountModel>(context);
}
