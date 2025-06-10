class Character {
  final String name;
  final String species;
  final String gender;
  final String house;
  final String dateOfBirth;
  final bool wizard;
  final String ancestry;
  final Wand wand;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final bool alive;
  final String image;

  Character({
    required this.name,
    required this.species,
    required this.gender,
    required this.house,
    required this.dateOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.wand,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.alive,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] ?? '',
      species: json['species'] ?? '',
      gender: json['gender'] ?? '',
      house: json['house'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      wizard: json['wizard'] ?? false,
      ancestry: json['ancestry'] ?? '',
      wand: Wand.fromJson(json['wand'] as Map<String, dynamic>? ?? {}),
      patronus: json['patronus'] ?? '',
      hogwartsStudent: json['hogwartsStudent'] ?? false,
      hogwartsStaff: json['hogwartsStaff'] ?? false,
      alive: json['alive'] ?? false,
      image: json['image'] ?? '',
    );
  }

  get id => null;

  @override
  String toString() {
    return "Nome: $name\nEspécie: $species\nGênero: $gender\nCasa: $house\nNascimento: $dateOfBirth\nMago: $wizard\nAncestralidade: $ancestry\nVarinha: $wand\nPatronus: $patronus\nEstudante: $hogwartsStudent\nStaff: $hogwartsStaff\nVivo: $alive\nImagem: $image\n\n";
  }
}

class Wand {
  final String wood;
  final String core;
  final double length;

  Wand({required this.wood, required this.core, required this.length});

  factory Wand.fromJson(Map<String, dynamic> json) {
    return Wand(
      wood: json['wood'] ?? '',
      core: json['core'] ?? '',
      length:
      (json['length'] is num) ? (json['length'] as num).toDouble() : 0.0,
    );
  }

  @override
  String toString() {
    return "Madeira: $wood, Núcleo: $core, Comprimento: $length";
  }
}
