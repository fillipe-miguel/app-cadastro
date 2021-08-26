class Person{
  String? name;
  String? number;
  String? reason;

  Person({this.name, this.number, this.reason});

  @override
  String toString(){
    return 'Nome: $name, Número: $number';
  }
}
