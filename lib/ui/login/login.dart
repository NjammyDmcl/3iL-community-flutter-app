import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_stream.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  bool pwdhide = true;
  LoginStream loginStreamControl = new LoginStream();
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
              StreamBuilder<String>(
                  stream: loginStreamControl.getPhone,
                  builder: (context, snap) {
                    return Container(
                        decoration: BoxDecoration(color: Colors.white),
                        padding: new EdgeInsets.all(12.0),
                        child: Stack(children: <Widget>[
                          Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.3),
                              elevation: 0.0,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: TextFormField(
                                      onChanged: loginStreamControl.updatePhone,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Numéro de Téléphone",
                                          hintStyle: TextStyle(
                                              fontFamily: 'quicksand'),
                                          icon: Icon(
                                            Icons.phone,
                                            color:
                                                Colors.black.withOpacity(0.4),
                                          )),
                                      keyboardType: TextInputType.phone))),
                          snap.error != null
                              ? Positioned(
                                  left: 55,
                                  top: 35,
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Text(
                                        snap.error.toString(),
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.red),
                                      )))
                              : Container()
                        ]));
                  }),
              StreamBuilder<String>(
                  stream: loginStreamControl.getPassword,
                  builder: (context, snap) {
                    return Container(
                        decoration: BoxDecoration(color: Colors.white),
                        padding: new EdgeInsets.all(12.0),
                        child: Stack(children: <Widget>[
                          Material(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey.withOpacity(0.3),
                              elevation: 0.0,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: TextFormField(
                                    onChanged:
                                        loginStreamControl.updatePassword,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Mot de passe",
                                        hintStyle:
                                            TextStyle(fontFamily: 'quicksand'),
                                        icon: Icon(
                                          Icons.lock_outline,
                                          color: Colors.black.withOpacity(0.4),
                                        ),
                                        suffixIcon: IconButton(
                                            icon: Icon(
                                              pwdhide
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                pwdhide = !pwdhide;
                                              });
                                            })),
                                    obscureText: pwdhide,
                                    keyboardType: TextInputType.text,
                                  ))),
                          snap.error != null
                              ? Positioned(
                                  left: 55,
                                  top: 35,
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      child: Text(
                                        snap.error.toString(),
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.red),
                                      )))
                              : Container()
                        ]));
                  }),
              StreamBuilder<bool>(
                stream: loginStreamControl.loading,
                builder: (context, snap) {
                  return (snap.hasData && snap.data)
                      ? Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
                          child: LinearProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                              backgroundColor: Color(0xFF144c4c)),
                        )
                      : Container();
                },
              ),
              StreamBuilder<String>(
                stream: loginStreamControl.error,
                builder: (context, snap) {
                  return (snap.hasData)
                      ? Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Container(
                            padding: EdgeInsets.all(8),
                            color: Colors.red.withOpacity(0.3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  snap.data,
                                  style: TextStyle(color: Colors.red),
                                ),
                                Icon(
                                  Icons.warning,
                                  size: 12,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ))
                      : Container();
                },
              ),
              StreamBuilder<bool>(
                stream: loginStreamControl.submitValid,
                builder: (context, snap) {
                  return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side:
                                    BorderSide(color: Colors.white, width: 0)),
                            padding: EdgeInsets.all(11),
                            disabledColor: Color(0xFF144c4c).withOpacity(0.7),
                            color: Color(0xFF144c4c),
                            onPressed: (!snap.hasData)
                                ? null
                                : loginStreamControl.submit,
                            child: Text(
                              "CONNEXION",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'baumans',
                                  color: Colors.white),
                            ),
                          )));
                },
              ),
            ]))
      ])),
    ));
  }
}
