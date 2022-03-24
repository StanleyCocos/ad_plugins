import 'package:ad_mvc/ad_mvc.dart';
import 'package:ad_network/ad_network.dart';

abstract class BaseListController<T extends BaseModel, B extends BaseBean>
    extends BaseController<T> {
  /// 分页控制器
  final refreshController = EasyRefreshController();

  /// 分页 页码
  int loadPage = 1;

  /// 分页 每页数量(默认=0，由接口控制)
  int get pageSize => 0;

  /// 分页Api
  String get loadApi;

  /// 请求参数
  Map<String, dynamic> params = {MvcManager().page: "1"};

  /// 解析器
  B get data;

  /// 请求额外参数
  Options? get requestOptions => null;

  /// 加载列表 下拉刷新
  Future<void> loadListData() async {
    loadBegin(isRefresh: true);
    _setPageParams();
    await HttpRequest.getInstance().get(
      loadApi,
      params: params,
      options: requestOptions,
      callBack: (data) {
        isLoadError = false;
        final B tempData = this.data;
        tempData.initJsonData(data);
        try {
          // 由于切换不同状态时 可能会把refresh视图干掉 这时这里会报异常
          refreshController.finishRefresh();
          refreshController.resetLoadState();
        } catch (e) {}
        loadSuccess(tempData, isRefresh: true);
      },
      errorCallBack: (error, code) {
        isLoadError = true;
        try {
          // 由于切换不同状态时 可能会把refresh视图干掉 这时这里会报异常
          refreshController.finishRefresh();
          refreshController.resetLoadState();
        } catch (e) {}
        loadError(error, isRefresh: true);
      },
      commonCallBack: () {
        loadCommon(isRefresh: true);
      },
    );
  }

  /// 加载列表 上拉加载更多
  Future<void> loadListDataMore() async {
    loadBegin(isRefresh: false);
    _setPageParams(isMore: true);
    await HttpRequest.getInstance().get(
      loadApi,
      params: params,
      options: requestOptions,
      callBack: (data) {
        loadPage += 1;
        final B tempData = this.data;
        tempData.initJsonData(data);
        refreshController.finishLoad(noMore: tempData.listData.isEmpty);
        loadSuccess(tempData);
      },
      errorCallBack: (error, code) {
        refreshController.finishLoad(success: false);
        loadError(error);
      },
      commonCallBack: () => loadCommon(),
    );
  }

  /// 请求开始回调
  void loadBegin({bool isRefresh = false}) {}

  /// 请求成功回调
  void loadSuccess(B data, {bool isRefresh = false}) {}

  /// 请求失败回调
  void loadError(DioError? error, {bool isRefresh = false}) {}

  /// 请求始终回调
  void loadCommon({bool isRefresh = false}) {}

  /// 列表item点击
  void onItemTap<M>(M model, int index) {}

  /// 添加参数
  void addParams(Map<String, dynamic> params) {
    this.params.clear();
    this.params.addAll(params);
  }

  void _setPageParams({bool isMore = false}) {
    if (isMore) {
      params[MvcManager().page] = "${loadPage + 1}";
    } else {
      loadPage = 1;
      params[MvcManager().page] = "${loadPage}";
    }
    if (pageSize != 0) {
      params[MvcManager().pageSize] = "$pageSize";
    }
  }

  @override
  void loadRetry() {
    loadListData();
    super.loadRetry();
  }
}
