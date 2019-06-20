import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text('Nestle'),
//      ),
      body: SafeArea(child: _LoginPageContent()),
    );
  }
}

class _LoginPageContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageContentState();
}

class _LoginPageContentState extends State<_LoginPageContent> {
  final _contentKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _validateAndOpenIndexPage() {
    Navigator.of(context).pushReplacementNamed('/index');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _contentKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: 200,
                  child: AspectRatio(aspectRatio: 1, child: Image.asset(
                    'assets/images/img_logo.jpg',
                    fit: BoxFit.contain,
                  ),),
                ),
                SizedBox(
                  height: 20.0,
                ),
                EmailTextField(controller: _emailController),
                PasswordTextField(controller: _passwordController),
                SizedBox(
                  height: 20.0,
                ),
                SubmitButton(callback: _validateAndOpenIndexPage,)
              ],
            )),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;

  EmailTextField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: Center(
        child: TextField(
          controller: controller,
          style: TextStyle(fontSize: 20.0),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
              hintText: "Email",
              border: InputBorder.none),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;

  PasswordTextField({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: StadiumBorder(),
      elevation: 4,
      margin: EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        obscureText: true,
        style: TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
            hintText: "Password",
            border: InputBorder.none),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {

  final VoidCallback callback;
  SubmitButton({@required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: RaisedButton(
          onPressed: callback,
          padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 16.0),
          shape: StadiumBorder(),
          child: Text('LOGIN'),
        ),
      ),
    );
  }
}
