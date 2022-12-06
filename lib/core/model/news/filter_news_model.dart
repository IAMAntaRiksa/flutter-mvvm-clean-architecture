class FilterNewsModel {
  String? country;
  int? page;
  String? query;
  int? limit;

  FilterNewsModel({this.country, this.page, this.query, this.limit});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> param = {};

    if (country != null) {
      param['country'] = country;
    }
    if (page != null) {
      param['page'] = page;
    }
    if (country != null) {
      param['q'] = query;
    }
    if (limit != null) {
      param['pageSize'] = limit;
    }
    return param;
  }
}
