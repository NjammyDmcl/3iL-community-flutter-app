import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  bool pwdhide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 2 / 4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login.png'))),
        ),
        Container(
            width: double.maxFinite,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.3),
                      elevation: 0.0,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Numéro de Téléphone",
                                hintStyle: TextStyle(fontFamily: 'quicksand'),
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.black.withOpacity(0.4),
                                )),
                            keyboardType: TextInputType.phone,
                          )))),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.withOpacity(0.3),
                      elevation: 0.0,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mot de passe",
                                hintStyle: TextStyle(fontFamily: 'quicksand'),
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Colors.black.withOpacity(0.4),
                                ),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      pwdhide
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        pwdhide = !pwdhide;
                                      });
                                    })),
                            obscureText: pwdhide,
                            keyboardType: TextInputType.text,
                          )))),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0xFF144c4c),
                      elevation: 0.0,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              onPressed: null,
                              child: Text(
                                "connexion".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'baumans',
                                    color: Colors.white),
                              )))))
            ]))
      ])),
    ));
  }
}
