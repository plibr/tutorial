import 'package:tutorial/src/data/models/tutorial_model.dart';

class TutorialsResponseModel {
  final String? status;
  final int? totalResults;
  final List<TutorialModel>? tutorials;

  TutorialsResponseModel({
    this.status,
    this.totalResults,
    this.tutorials,
  });

  factory TutorialsResponseModel.fromJson(Map<String, dynamic> json) {
    return TutorialsResponseModel(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      tutorials: List<TutorialModel>.from(
        (json['tutorials'] as List<dynamic>).map(
          (e) => TutorialModel.fromJson(e as Map<String, dynamic>),
        ),
      ),
    );
  }
}
