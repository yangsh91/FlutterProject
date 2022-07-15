void main() {
  ThreeKingdoms king = ThreeKingdoms();

  king.sayName();
  print(" === ${king.name} === ");

  ThreeKingdoms2 king2 = ThreeKingdoms2("judy", "zootopia");
  king2.saySomthing();
}

class ThreeKingdoms {
  // Field (Property)
  String name = "조조";

  // private
  String _name = "관우";

  // Constructor

  // Method (Function)
  sayName() {
    print("name : $_name");
  }
}

class ThreeKingdoms2 {
  // Field
  late String name;
  String? nation;

  // Constructor
  ThreeKingdoms2(String name, String nation)
      : this.name = name,
        this.nation = nation;

  // Method
  saySomthing() {
    print("My nmae is ${this.name} and My Country is ${this.nation}.");
  }
}
