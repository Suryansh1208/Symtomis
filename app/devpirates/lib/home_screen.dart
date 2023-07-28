import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1638202993928-7267aad84c31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGRvY3RvcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
            ),
            fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(70, 12, 104, -50),
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            height: size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Center(
                  child: ListTile(
                    title: Text(
                      'Welcome to Symtomis',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Welcome to symtomis. This is one solution to all your health related problems. Click down the button below to explore our exciting features.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 40,
                      width: double.infinity,
                      child: const Center(
                        child:
                            Text('USE NOW AND KEEP YOU AND YOUR FAMILY SAFE❤️'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
