

import 'package:ad_mvc/base_controller.dart';
import 'package:ad_plugins/mvc/page1/model1.dart';

class Controller1 extends BaseController<Model1>{

  @override
  Model1 model = Model1();

  @override
  bool get empty => model.listData.isEmpty;

  @override
  bool get content => true;

  @override
  void widgetDidLoad() {
    super.widgetDidLoad();
    _loadPageData();
    // hideLoading();
  }
}

extension Action on Controller1 {

  void test(){
    // showLoading();
    toast("123");
  }

}

extension Network on Controller1 {

  void _loadPageData() async{
    print("load");
    Future.delayed(const Duration(seconds: 5), () {
      print("update");
      isLoadError = true;
      notifyListeners();
    });
  }
}