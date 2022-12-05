import 'results.dart';

class MapResponse {
  List<String>? htmlAttributions;
  String? nextPageToken;
  List<Results>? results;
  String? status;

  MapResponse(
      {this.htmlAttributions, this.nextPageToken, this.results, this.status});

  MapResponse.fromJson(Map<String, dynamic> json) {
    if (json['html_attributions'] != null) {
      htmlAttributions = <String>[];
      json['html_attributions'].forEach((v) {
        htmlAttributions!.add(v);
      });
    }
    nextPageToken = json['next_page_token'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (htmlAttributions != null) {
      data['html_attributions'] =
          htmlAttributions!.map((v) => v).toList();
    }
    data['next_page_token'] = nextPageToken;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

