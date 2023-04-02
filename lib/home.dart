import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'user.dart';

// Estrutura para fazer a conexão com a URL
Future<User> fetchUser(http.Client client) async {

  final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/7'));

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  }

  else {
    throw Exception('Failed to load the user :(');
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late final Future<User> futureUser;

  @override
  void initState() {
    super.initState();
    futureUser = fetchUser(http.Client());
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User Issues",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        //backgroundColor: AppColors.dodgerBlue,
      ),

      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        alignment: Alignment.centerLeft,
        child: ListView(
          children: [
            const SizedBox(
              width: 20,
              height: 20,
            ),

            FutureBuilder<User>(
              future: futureUser,
              builder: (context, value) {
                if (value.hasData) {
                  return Column(
                    children: [

                      // Linha do parâmetro 'id'
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Id:   ',
                          style: GoogleFonts.aladin(
                              color: Colors.amber,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w700
                            ),
                          ),

                          Text(
                            '${value.data!.id}',
                            style: GoogleFonts.aladin(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),

                      // Linha do parâmetro 'name'
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Name:   ',
                            style: GoogleFonts.aladin(
                                color: Colors.amber,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),

                          Text(
                            '${value.data!.name}',
                            style: GoogleFonts.aladin(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),

                      // Linha do parâmetro 'username'
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Username:   ',
                            style: GoogleFonts.aladin(
                                color: Colors.amber,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),

                          Text(
                            '${value.data!.username}',
                            style: GoogleFonts.aladin(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),

                      // Linha do parâmetro 'email'
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'E-mail:   ',
                            style: GoogleFonts.aladin(
                                color: Colors.amber,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),

                          Text(
                            '${value.data!.email}',
                            style: GoogleFonts.aladin(
                                color: Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),

                      // Linha do parâmetro 'Phone'
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Phone:   ',
                            style: GoogleFonts.aladin(
                                color: Colors.amber,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),

                          Text(
                            '${value.data!.phone}',
                            style: GoogleFonts.aladin(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        width: 20,
                        height: 20,
                      ),

                      // Linha do parâmetro 'website'
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Website:   ',
                            style: GoogleFonts.aladin(
                                color: Colors.amber,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),

                          Text(
                            '${value.data!.website}',
                            style: GoogleFonts.aladin(
                                color: Colors.black,
                                fontSize: 40.0,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }

                else if (value.hasError) {
                  return Text('${value.error}');
                }

                // Mostra um indicador de carregamento
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
