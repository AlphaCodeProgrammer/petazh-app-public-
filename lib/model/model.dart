
class Model {
  final String? id;
  final List<dynamic>? sideImage;
  final String? name;
  final String? type;
  final String? code;
  final bool? forMen;
  final bool? isFavoriteModel;

  const Model(
      {this.id,
      this.sideImage,
      this.name,
      this.type,
      this.code,
      this.forMen,
      this.isFavoriteModel});


  @override
 String toString() {
    return "$id";
  }
}
