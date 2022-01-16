import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:temp_mail/feature/auth/repository/domain_repository.dart';
import 'package:temp_mail/feature/auth/repository/sign_up_repository.dart';
import 'package:temp_mail/feature/auth/view_model/domain_view_model.dart';
import 'package:temp_mail/feature/auth/view_model/sign_up_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedIndex = 'Student';
  bool isValidte = true;
  final _formKey = new GlobalKey<FormState>();
  String? validatePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password should contain more than 5 characters";
    }
    return null;
  }

  String? nullFieldValidate(String value) =>
      value.trim().isEmpty ? 'This Field is required' : null;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      var daomainVm = Provider.of<DomainViewModel>(context, listen: false);
      await daomainVm.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var vm = Provider.of<SignInViewModel>(context, listen: false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff0F1827),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/mail_tmp.png',
                  width: width * 0.55,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Temp Mail',
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, letterSpacing: 1.4),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * 0.4,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  studentLoginForm()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget studentLoginForm() {
    var daomainVm = Provider.of<DomainViewModel>(context, listen: true);
    var signUmVm = Provider.of<SignUpViewModel>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Stack(children: [
              SizedBox(
                height: 50,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: usernameController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0XFF344151),
                      hintText: 'Username',
                      labelText: 'Username *',
                      focusColor: Colors.white,
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white60),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        '@${daomainVm.domainModel?.first.domain}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            const SizedBox(height: 15),
            SizedBox(
              height: 50,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.always,
                controller: passwordController,
                obscureText: true,
                // validator: (value) =>
                //     value!.isEmpty ? 'Password field is required' : null,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password *',
                    focusColor: Colors.grey,
                    filled: true,
                    fillColor: Color(0XFF344151),
                    // errorText: 'This Field is required',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white60),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    )),
              ),
            ),
            SizedBox(height: 25),
            Container(
              height: 45,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  await signUmVm.getSignUpData(
                      username: usernameController.text,
                      password: passwordController.text);

                  Navigator.pop(context);
                  const snackBar = SnackBar(
                    content: Text('Account Created Successfully!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            isValidte
                ? SizedBox()
                : Center(
                    child: Container(
                        color: Colors.red,
                        width: MediaQuery.of(context).size.width * .5,
                        child: Center(
                            child: Text(
                          'Invalid username or password',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ))),
                  ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ?',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
