import 'package:scoped_model/scoped_model.dart';

class CountModel extends Model {
  int _count = 0;
  get count => _count;

  void change(value) {
    _count = value;
    notifyListeners();
  }

  CountModel of(context) => ScopedModel.of<CountModel>(context);
}
