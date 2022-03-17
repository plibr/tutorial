import 'package:tutorial/src/domain/entities/tutorial/tutorial.dart';

class TutorialModel extends Tutorial {
  const TutorialModel({
    required int id,
    String? title,
    String? description,
    bool? published,
  }) : super(
            id: id,
            title: title,
            description: description,
            published: published);

  factory TutorialModel.fromJson(Map<String, dynamic> map) {
    // if (map == null) return null;

    return TutorialModel(
      id: map['id'] as int,
      title: map['title'] as String?,
      description: map['description'] as String?,
      published: map['published'] as bool?,
    );
  }
}
