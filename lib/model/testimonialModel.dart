class TestimonialsModal {
  String message;
  List<Datum> data;

  TestimonialsModal({
    required this.message,
    required this.data,
  });

  factory TestimonialsModal.fromMap(Map<String, dynamic> json) =>
      TestimonialsModal(
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  String id;
  bool likedByMe;
  String firstName;
  String lastName;
  String description;
  String? imageUrl;
  String videoUrl;
  dynamic fullVideoUrl;
  int likes;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String modifiedBy;
  bool watched;

  Datum({
    required this.id,
    required this.likedByMe,
    required this.firstName,
    required this.lastName,
    required this.description,
    required this.imageUrl,
    required this.videoUrl,
    required this.fullVideoUrl,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.modifiedBy,
    required this.watched,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        likedByMe: json["liked_by_me"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        description: json["description"],
        imageUrl: json["image_url"],
        videoUrl: json["video_url"],
        fullVideoUrl: json["full_video_url"],
        likes: json["likes"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        watched: json["watched"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "liked_by_me": likedByMe,
        "first_name": firstName,
        "last_name": lastName,
        "description": description,
        "image_url": imageUrl,
        "video_url": videoUrl,
        "full_video_url": fullVideoUrl,
        "likes": likes,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "watched": watched,
      };
}
