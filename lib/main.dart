// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class User {
  final String name;
  final int age;

  User(this.name, this.age);

  @override
  String toString() {
    return 'Name: $name, Age: $age';
  }
}

// class NestedMapProvider extends ChangeNotifier {
//   Map<String, dynamic> nestedMap = {};

//   void updateNestedMap(Map<String, dynamic> updatedMap) {
//     nestedMap = updatedMap;
//     notifyListeners();
//   }

//   void addUserToNestedMap(String name, int age) {
//     nestedMap[name] = age;
//     notifyListeners();
//   }
// }

class NestedMapProvider extends ChangeNotifier {
  Map<String, dynamic> nestedMap =
      {}; //Kullanıcıların eklediği değerleri map şeklinde ekleyeceğimiz değişken
  SharedPreferences? _prefs; //Shared pref erişim için

  NestedMapProvider() {
    _initSharedPreferences();
  }

// NestedMapProvider sınıfının yapıcı metodu olan NestedMapProvider(), _initSharedPreferences metodunu çağırır.
// Bu metod, SharedPreferences örneğini alır ve daha önce kaydedilen nestedMap verisini geri yükler.
  Future<void> _initSharedPreferences() async {
    _prefs = await SharedPreferences
        .getInstance(); //girilen veriyi okuma işlemi gerçekleşir girilen keye göre
    final nestedMapString = _prefs!.getString('nestedMap'); //nestedMap keyi ile
    if (nestedMapString != null) {
      //Eğer girilen değer boş değilse
      nestedMap = Map<String, dynamic>.from(jsonDecode(nestedMapString));
      //jsonDecode fonksiyonunu kullanarak string veriyi JSON formatından 'Map' formatına dönüştürür ve 'nestedMap' değişkenine eşitler.
    }
  }

  Future<void> _saveToSharedPreferences() async {
    await _prefs!.setString('nestedMap', jsonEncode(nestedMap));
    //Burada da girilen değerleri locale kaydetme işlemi yapılmaktadır.
    //'nestedMap' ilgili nesnenin keyi ve bu keye uyan değişkeni yanında yazılmıştır.
    //jsonEncode diyerek girilen değerin verilerini JSON' dönüştürme işlemi yapılıyor.
  }

  void addUserToNestedMap(String name, int age) {
    nestedMap[name] =
        age; //girilen yaş ve ad değerlerini nestedMap'ine aktarıyor.
    _saveToSharedPreferences(); //Girilen değerleri locale kaydetme işlemini yaptığı fonksiyon.
    notifyListeners(); //UI güncellenmesi sağlanır.
  }

  void updateUserInNestedMap(String name, int newAge) {
    if (nestedMap.containsKey(name)) {
      //containsKey bir Map içinde name değişkeni varsa ifadesini içerir.
      nestedMap[name] = newAge;
      _saveToSharedPreferences();
      notifyListeners();
    }
  }

  void deleteUserInNestedMap(String name, int newAge) {
    if (nestedMap.containsKey(name)) {
      //containsKey bir Map içinde name değişkeni varsa ifadesini içerir.
      nestedMap.remove(name);
      _saveToSharedPreferences();
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NestedMapProvider(),
      child: MaterialApp(
        title: 'Nested Maps Example',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Map Local Storage Example'),
            centerTitle: true,
          ),
          body: Consumer<NestedMapProvider>(
            builder: (context, nestedMapProvider, _) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Map Local Storage',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Add User'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                          labelText: 'Name'),
                                    ),
                                    TextField(
                                      controller: ageController,
                                      decoration: const InputDecoration(
                                          labelText: 'Age'),
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      final name = nameController.text;
                                      final age =
                                          int.tryParse(ageController.text);
                                      if (name != null && age != null) {
                                        nestedMapProvider.addUserToNestedMap(
                                          name,
                                          age,
                                        );
                                        nameController.clear();
                                        ageController.clear();
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Add'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Add User'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Update User'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                          labelText: 'Name'),
                                    ),
                                    TextField(
                                      controller: ageController,
                                      decoration: const InputDecoration(
                                          labelText: 'Age'),
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      final name = nameController.text;
                                      final age =
                                          int.tryParse(ageController.text);
                                      if (name != null && age != null) {
                                        nestedMapProvider.updateUserInNestedMap(
                                          name,
                                          age,
                                        );
                                        nameController.clear();
                                        ageController.clear();
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Update'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Update User'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Delete User'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                          labelText: 'Name'),
                                    ),
                                    TextField(
                                      controller: ageController,
                                      decoration: const InputDecoration(
                                          labelText: 'Age'),
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      final name = nameController.text;
                                      final age =
                                          int.tryParse(ageController.text);
                                      if (name != null && age != null) {
                                        nestedMapProvider.deleteUserInNestedMap(
                                          name,
                                          age,
                                        );
                                        nameController.clear();
                                        ageController.clear();
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Delete User'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Users Info:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    ...nestedMapProvider.nestedMap.entries.map((entry) {
                      return Text('${entry.key}: ${entry.value}');
                    }).toList(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => NestedMapProvider(),
//       child: MaterialApp(
//         title: 'Nested Maps Example',
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text('Nested Maps Example'),
//           ),
//           body: Consumer<NestedMapProvider>(
//             builder: (context, nestedMapProvider, _) {
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Nested Map:',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(height: 16),
//                     Text(
//                       nestedMapProvider.nestedMap.toString(),
//                       style: TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NestedMapProvider extends ChangeNotifier {
//   Map<String, dynamic> nestedMap = {};

//   void updateNestedMap(Map<String, dynamic> updateNestedMap) {
//     nestedMap = updateNestedMap;
//     notifyListeners();
//   }
// }
