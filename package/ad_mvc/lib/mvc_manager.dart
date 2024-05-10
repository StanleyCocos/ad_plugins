

import 'package:ad_mvc/state_interceptor.dart';

class MvcManager {

  factory MvcManager() {
    _instance ??= MvcManager._internal();
    return _instance!;
  }
  static MvcManager? _instance;
  MvcManager._internal();

  StateInterface? interceptor;
  String page = "page";
  String pageSize = "page_size";


  void init({StateInterface? interceptor, String page = "page", String pageSize = "page_size"}){
    this.interceptor = interceptor;
    this.page = page;
    this.pageSize = pageSize;
  }
}