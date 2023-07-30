import 'dart:convert';
import 'package:uap/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class rdr1 extends StatefulWidget {
  rdr1({super.key});

  @override
  State<rdr1> createState() => _rdr1State();
}

class _rdr1State extends State<rdr1> {
  int total = 0;

  //strapi
  var dataJson;

  void _getDataFromStrapi() async {
    var response = await http.get(Uri.parse("http://localhost:1337/api/games"));
    dataJson = jsonDecode(response.body);
    print(dataJson["meta"]["pagination"]["total"]);
    setState(() {
      total = dataJson["meta"]["pagination"]["total"];
    });
  }

  @override
  Widget build(BuildContext context) {
    _getDataFromStrapi();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,

          //cart
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                  child: const Icon(Icons.shop),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => cart()),
                    );
                  },
                ))
          ],
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        body: Center(
            child: Column(
          children: [
            Image.asset(
              "lib/images/rdr cv1.png",
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 40),
            Expanded(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                  child: Text(
                                "Red Dead Redemption 1",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              const SizedBox(
                                width: 30,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Text(
                                  "600k",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    )))
          ],
        )),

        //bottom navigasi
        bottomNavigationBar: Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                ),
              ],
              borderRadius: BorderRadius.only()),
          child: Row(
            children: [
              Expanded(
                  //button
                  child: ElevatedButton(
                      onPressed: _getDataFromStrapi,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black87,
                          ),
                          fixedSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50),
                          ),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)))),
                      child: const Text(
                        "Tambah",
                        style: TextStyle(fontSize: 20),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
