import 'package:flutter/material.dart';

import 'database.dart';

class Features extends StatefulWidget {
  const Features({super.key});

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  final TextEditingController _symptomcontroller = TextEditingController();
  Map<String, dynamic> myMap = {};
  List<String> items = ["symptoms", "prevention", "medicines"];
  String selectedItem = "symptoms";
  List diseasestoshow = [];
  bool f = false;
  String x = "";

  // Future<void> readJson(String str) async{
  //   final String response = await rootBundle.rootBundle.loadString('assets/symptoms.json');
  //   final data =  await json.decode(response) as List<dynamic>;
  //   List<sympmodel> list = (data.map((e) => sympmodel.fromJson(e)) as Map<String,dynamic>).toList();

  // }

  @override
  void dispose() {
    _symptomcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(45, 3, 59, -50),
              height: size.height * 0.5,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const ListTile(
                    title: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome to Disease descriptioner feature',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                          'This feature will allow us to briefly know about the disease you want to know.',
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _symptomcontroller,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Enter the disease you want to search for.",
                        labelStyle: const TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: const BorderSide(),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter the disease.";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromRGBO(45, 3, 59, -50),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromRGBO(45, 3, 59, -50),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromRGBO(45, 3, 59, -50),
                            ),
                          )),
                      value: selectedItem,
                      items: items
                          .map((e) => DropdownMenuItem<String>(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(fontSize: 20),
                              )))
                          .toList(),
                      onChanged: (item) =>
                          setState(() => selectedItem = item.toString()),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      // print("hello");
                      try {
                        String str = _symptomcontroller.text;
                        // await readJson(str);
                        myMap = await Database().getData(str);
                        setState(() {
                          // print("my map = ");
                          if (selectedItem == "medicines") {
                            diseasestoshow = myMap['meds'][selectedItem];
                          } else {
                            diseasestoshow = myMap[selectedItem];
                          }
                          if (selectedItem == "causes" ||
                              selectedItem == "desc") {
                            f = true;
                            x = myMap[selectedItem];
                          }
                          // print(myMap[selectedItem]);
                        });
                      } catch (e) {
                        // print(e.toString());
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        height: 30,
                        width: double.infinity,
                        child: const Center(
                          child: Text(
                            'Describe',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            f
                ? SingleChildScrollView(
                    child: Container(
                        width: double.infinity,
                        color: const Color.fromRGBO(45, 3, 59, -50),
                        height: size.height * 0.6,
                        child: Text(
                          x,
                          style: const TextStyle(
                            color: Colors.amber,
                          ),
                        )),
                  )
                : SingleChildScrollView(
                    child: Container(
                        width: double.infinity,
                        color: const Color.fromRGBO(45, 3, 59, -50),
                        height: size.height * 0.6,
                        child: ListView.builder(
                            itemCount: diseasestoshow.length,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                leading: const Text("* "),
                                title: Text(diseasestoshow[index]),
                              );
                            }))),
                  )
          ],
        ),
      ),
    );
  }
}
