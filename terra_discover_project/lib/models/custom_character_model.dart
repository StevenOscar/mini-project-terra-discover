class CustomCharacterModel {
  final int id;
  final String name;
  final String imageHash;
  final int rarity;
  final String mainClass;
  final String talent;
  final String skill;

  CustomCharacterModel({
    required this.id,
    required this.name,
    required this.imageHash,
    required this.rarity,
    required this.mainClass,
    required this.talent,
    required this.skill,
  });

    Map<String, dynamic> toMap(){
    return {
      'id' : id,
      'name' : name,
      'image_hash' : imageHash,
      'rarity' : rarity.toInt(),
      'main_class' : mainClass,
      'talent' : talent,
      'skill' : skill,
    };
  }

  factory CustomCharacterModel.fromMap(Map<String,dynamic> map){
    return CustomCharacterModel(
      id : map['id'],
      name : map['name'],
      imageHash : map['image_hash'],
      rarity : map['rarity'],
      mainClass : map['main_class'],
      talent : map['talent'],
      skill : map['skill']
    );
  }
}