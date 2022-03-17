import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
// part 'tutorial.g.dart';

// @JsonSerializable()
class Tutorial extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final bool? published;

  const Tutorial({this.id, this.title, this.description, this.published});

  @override
  List<Object> get props {
    return [
      id!,
      title!,
      description!,
      published!,
    ];
  }

  @override
  bool get stringify => true;

  // Map<String, dynamic> toJson() => _$TutorialToJson(this);

  // Map<String, dynamic> toJson(Tutorial instance) => <String, dynamic>{
  //       'title': instance.title,
  //       'description': instance.description,
  //       'published': instance.published,
  //     };
  // Map<String, dynamic> toJson() => _$TutorialToJson(this);
}
