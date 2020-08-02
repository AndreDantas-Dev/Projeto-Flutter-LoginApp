import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _sendingEmail = false;
  bool _emailSent = false;

  final _formKey = GlobalKey<FormState>();
  String _validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Password Recovery"),
        ),
        body: (!_sendingEmail && !_emailSent)
            ? Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Text("Inform your e-mail for recovery: "),
                    SizedBox(
                      height: 16,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: _validateEmail,
                              decoration: InputDecoration(hintText: "E-mail"),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            FlatButton(
                                textColor: Colors.white,
                                color: Theme.of(context).primaryColor,
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _sendingEmail = true;
                                    });
                                    Future.delayed(Duration(seconds: 3))
                                        .then((value) {
                                      setState(() {
                                        _sendingEmail = false;
                                        _emailSent = true;
                                      });
                                    });
                                  }
                                },
                                child: Text("Send Email"))
                          ],
                        ))
                  ],
                ),
              )
            : _sendingEmail
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                          Theme.of(context).primaryColor),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Text(
                          "E-mail sent.",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                        SizedBox(
                          height: 16,
                        ),
                        Icon(
                          Icons.check_circle,
                          size: 64,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ));
  }
}
