class FilterNewsModel {
  String? country;
  int? page;
  String? query;

  FilterNewsModel({this.country, this.page, this.query});

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
    return param;
  }
}
