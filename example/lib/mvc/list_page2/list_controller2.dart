import 'package:ad_mvc/base_list_controller.dart';
import 'package:ad_plugins/mvc/list_page2/list_bean.dart';
import 'package:ad_plugins/mvc/list_page2/list_model2.dart';

class ListController1 extends BaseListController<ListModel1, ListBean1> {
  @override
  ListModel1 model = ListModel1();

  @override
  ListBean1 get data => ListBean1();

  @override
  String get loadApi => "https://pub.dev/packages/flutter_easyloading";

  @override
  // TODO: implement pageSize
  int get pageSize => 10;

  @override
  void widgetDidLoad() {
    loadListData();
    super.widgetDidLoad();
  }

  @override
  void loadSuccess(ListBean1 data, {bool isRefresh = false}) {
    super.loadSuccess(data, isRefresh: isRefresh);

    if (isRefresh) {
      model.listData.clear();
      for (int i = 0; i < pageSize; i++) {
        model.listData.add("item--- $i");
        print(model.listData.length);
      }
    } else {
      var count = model.listData.length + pageSize;
      for (int i = model.listData.length; i < count; i++) {
        model.listData.add("item--- $i");
      }
    }
    print(model.listData.length);
    notifyListeners();
  }

}

extension Network on ListController1 {
  // void _loadPageData(){
  //   Future.delayed(const Duration(seconds: 5), () {
  //
  //   });
  // }

}

extension Action on ListController1 {
  List<String> get listData => model.listData;
}
