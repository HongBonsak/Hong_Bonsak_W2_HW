
enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(
    String name,
    double baseSalary, {
    required List<Skill> skills,
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _baseSalary = baseSalary,
        _skills = List.unmodifiable(skills),
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  Employee.mobileDeveloper(
    String name,
    double baseSalary, {
    required Address address,
    required int yearsOfExperience,
  })  : _name = name,
        _baseSalary = baseSalary,
        _skills = List.unmodifiable([
          Skill.FLUTTER,
          Skill.DART,
        ]),
        _address = address,
        _yearsOfExperience = yearsOfExperience;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double calculateSalary() {
    double salary = _baseSalary;

    salary += _yearsOfExperience * 2000;

    for (final skill in _skills) {
      if (skill == Skill.FLUTTER) {
        salary += 5000;
      } else if (skill == Skill.DART) {
        salary += 3000;
      } else {
        salary += 1000;
      }
    }

    return salary;
  }

  void printDetails() {
    print('Employee: $_name');
    print('Base Salary: \$$_baseSalary');
    print('Skills: $_skills');
    print('Street: ${_address.street}');
    print('City: ${_address.city}');
    print('Zip Code: ${_address.zipCode}');
    print('Experience: $_yearsOfExperience years');
    print('Total Salary: \$${calculateSalary()}');
  }
}

void main() {
  final address = Address(
    'Street 123',
    'Phnom Penh',
    '12000',
  );

  final emp1 = Employee(
    'Sokea',
    40000,
    skills: [Skill.FLUTTER, Skill.DART],
    address: address,
    yearsOfExperience: 2,
  );

  emp1.printDetails();

  print('------------------');

  final emp2 = Employee.mobileDeveloper(
    'Ronan',
    45000,
    address: address,
    yearsOfExperience: 3,
  );

  emp2.printDetails();
}
