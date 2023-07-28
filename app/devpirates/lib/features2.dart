import 'package:flutter/material.dart';

import 'database.dart';

class Features2 extends StatefulWidget {
  const Features2({super.key});

  @override
  State<Features2> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features2> {
  final TextEditingController _symptomcontroller = TextEditingController();
  List myList = [];
  // List diseasestoshow = [];

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
              height: size.height * 0.4,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const ListTile(
                    title: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome to symptom checker feature',
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
                          'This feature will allow us to predict the diseases through symptoms.',
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
                  InkWell(
                    onTap: () async {
                      // print("hello");
                      try {
                        String str = _symptomcontroller.text;
                        // await readJson(str);
                        myList = await Database().getData2(str);
                        setState(() {
                          // print("my list = ");
                          // print(myList);
                        });
                        // if(!mounted) return;
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailPage(myMap: myMap,)));
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
                            'Predict',
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
            SingleChildScrollView(
              child: Container(
                  width: double.infinity,
                  color: const Color.fromRGBO(45, 3, 59, -50),
                  height: size.height * 0.6,
                  child: ListView.builder(
                      itemCount: myList.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: const Text("* "),
                          title: Text(myList[index]),
                        );
                      }))),
            )
          ],
        ),
      ),
    );
  }
}
