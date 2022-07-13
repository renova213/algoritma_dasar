import 'package:flutter/cupertino.dart';

class TestViewModel extends ChangeNotifier {
  List<int> listInputAngka = [];
  List<int> searchInputAngka = [];

  inputAngka(int? angka) {
    if (angka != null) {
      listInputAngka.add(angka);
      notifyListeners();
    }
  }

  clearListAngka() {
    listInputAngka.clear();
    notifyListeners();
  }

  sortingListTerbesar() {
    listInputAngka.sort(
      (a, b) => b.compareTo(a),
    );
    notifyListeners();
  }

  sortingListTerkecil() {
    listInputAngka.sort(
      (a, b) => a.compareTo(b),
    );
    notifyListeners();
  }

  searchAngka(int? value) {
    if (value != null) {
      for (int i = 0; i < listInputAngka.length; i++) {
        if (listInputAngka[i] == value) {
          searchInputAngka.add(listInputAngka[i]);
        }
      }
    }
    notifyListeners();
  }
}
