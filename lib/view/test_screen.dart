import 'package:algoritma_test/view_model/test_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TextEditingController inputAngkaController = TextEditingController();
  TextEditingController searchAngkaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<TestViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Algoritma"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "Input Angka :${data.listInputAngka.toString().replaceAll('[', '').replaceAll(']', '')}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "Sorting Angka :${data.listInputAngka.toString().replaceAll('[', '').replaceAll(']', '')}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Search Angka :${data.searchInputAngka.toString().replaceAll('[', '').replaceAll(']', '')}",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                textFieldName("Masukan Angka"),
                inputNumberField("Masukan Angka"),
                const SizedBox(
                  height: 16,
                ),
                inputButton(data),
                const SizedBox(
                  height: 16,
                ),
                textFieldName("Urutkan Angka"),
                sortingButton(data),
                const SizedBox(
                  height: 16,
                ),
                textFieldName("Cara Angka"),
                searchField("Cari Angka"),
                const SizedBox(
                  height: 16,
                ),
                searchButton(data),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputButton(TestViewModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.4,
          child: ElevatedButton(
            onPressed: () {
              if (inputAngkaController.text.isNotEmpty) {
                data.inputAngka(
                  int.parse(inputAngkaController.text),
                );
              }
              setState(
                () {
                  inputAngkaController.clear();
                },
              );
            },
            child: const Text("Submit Input"),
          ),
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.4,
          child: ElevatedButton(
            onPressed: () {
              data.clearListAngka();
            },
            child: const Text("Clear Input"),
          ),
        ),
      ],
    );
  }

  Widget sortingButton(TestViewModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.4,
          child: ElevatedButton(
            onPressed: () {
              data.sortingListTerbesar();
            },
            child: const Text("Terbesar"),
          ),
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.4,
          child: ElevatedButton(
            onPressed: () {
              data.sortingListTerkecil();
            },
            child: const Text("Terkecil"),
          ),
        ),
      ],
    );
  }

  Widget searchButton(TestViewModel data) {
    return Center(
      child: SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width * 0.4,
        child: ElevatedButton(
          onPressed: () {
            data.searchInputAngka.clear();
            if (searchAngkaController.text.isNotEmpty) {
              data.searchAngka(
                int.parse(searchAngkaController.text),
              );
            }
          },
          child: const Text("Submit Pencarian"),
        ),
      ),
    );
  }

  Widget textFieldName(label) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget searchField(hintText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
      child: TextFormField(
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey.shade400),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        textInputAction: TextInputAction.next,
        controller: searchAngkaController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Field Tidak Boleh Kosong";
          }
          return null;
        },
      ),
    );
  }

  Widget inputNumberField(hintText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 45,
      child: TextFormField(
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 8),
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: Colors.grey.shade400),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        textInputAction: TextInputAction.next,
        controller: inputAngkaController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Field Tidak Boleh Kosong";
          }
          return null;
        },
      ),
    );
  }
}
