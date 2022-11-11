import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:world/pages/detailPage.dart';
import 'package:world/utils/appbar.dart';
import 'package:world/utils/constant.dart';
import 'package:world/utils/langList.dart';
import 'package:world/utils/searchField.dart';
import 'package:http/http.dart' as http;
import '../model/network.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    setState(() {
      getNetwork();
    });
    super.initState();
  }

  Future getNetwork() async {
    setState(() async {
      countriesName = await netWork.getAllCountries();
      countriesFlag = await netWork.getAllCountriesFlag();
    });
  }

  List<String> countriesName = [];
  List<String> countriesFlag = [];
  NetWork netWork = NetWork();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      floatingActionButton: FloatingActionButton(onPressed: (() async {
        try {
          const urlall = 'https://restcountries.com/v3.1/all';
          final uri = Uri.parse(urlall);
          var response = await http.get(uri);
          if (response.statusCode == 200) {
            var jasonData = jsonDecode(response.body);
            List<dynamic> countriesName = [];
            for (var country in jasonData) {
              countriesName.add(country['name']);
            }
            print('Completed man');
          }
        } catch (e) {
          print('e => $e');
        }
      }
          //  async {
          //   print('FetcheUser Called');
          //   const url = 'https://restcountries.com/v3.1/all';
          //   final uri = Uri.parse(url);
          //   final response = await http.get(uri);
          //   final body = response.body;
          //   final json = jsonDecode(body.toString());
          //   setState(() {
          //     country = json['all'];
          //   });
          //   print('FetchUser completed');
          // }
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: ListView(children: [
          myseachField,
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: bodyColorr,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      context: context,
                      builder: (context) => FractionallySizedBox(
                        heightFactor: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Language',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color.fromARGB(
                                            255, 224, 227, 206),
                                      ),
                                      child: const Icon(Icons.close),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const LanguageList(language: 'English'),
                              const SizedBox(height: 18),
                              const LanguageList(language: 'Amharic'),
                              const SizedBox(height: 18),
                              const LanguageList(language: 'Italiano'),
                              const SizedBox(height: 18),
                              const LanguageList(language: 'Espanol'),
                              const SizedBox(height: 18),
                              const LanguageList(language: 'Deutsch'),
                              const SizedBox(height: 18),
                              const LanguageList(language: 'portugues'),
                              const SizedBox(height: 18),
                              const LanguageList(language: 'Svenska'),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.language,
                        color: darkColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('EN')
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: bodyColorr,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      context: context,
                      builder: (context) => FractionallySizedBox(
                        heightFactor: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Filter',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color.fromARGB(
                                            255, 224, 227, 206),
                                      ),
                                      child: const Icon(Icons.close),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Contenent',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(Icons.arrow_forward_ios)
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Time Zone',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(Icons.arrow_forward_ios)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.manage_search,
                        color: darkColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Filter')
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 236, 246, 176)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Detail',
                      style: TextStyle(color: darkColor),
                    ))),
          ),
          //////Boom
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 600,
              child: ListView.builder(
                itemCount: countriesName.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                        countriesName[index],
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Hero(
                        tag: 'flag $index',
                        child: SvgPicture.network(
                          countriesFlag[index],
                          width: 30,
                          height: 120,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      onTap: () {});
                },
              ),
            ),
          ) /////Boom
        ]),
      ),
    );
  }
}
