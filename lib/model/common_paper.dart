class CommonPaper{
  final  String id;
  final String paperTitle;

//<editor-fold desc="Data Methods">
  const CommonPaper({
    required this.id,
    required this.paperTitle,
  });
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommonPaper &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          paperTitle == other.paperTitle);

  @override
  int get hashCode => id.hashCode ^ paperTitle.hashCode;

  @override
  String toString() {
    return 'CommonPaper{' + ' id: $id,' + ' paperTitle: $paperTitle,' + '}';
  }

  CommonPaper copyWith({
    String? id,
    String? paperTitle,
  }) {
    return CommonPaper(
      id: id ?? this.id,
      paperTitle: paperTitle ?? this.paperTitle,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'paperTitle': this.paperTitle,
    };
  }

  factory CommonPaper.fromMap(Map<String, dynamic> map) {
    return CommonPaper(
      id: map['id'] as String,
      paperTitle: map['paperTitle'] as String,
    );
  }

//</editor-fold>
}