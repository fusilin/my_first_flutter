import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model {
  int _opacity = 0;
  get opacity => _opacity;

  String _title = ' ';
  get title => _title;

  int _titleOpacity = 0;
  get titleOpacity => _titleOpacity;

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
