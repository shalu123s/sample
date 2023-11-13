import 'package:flutter/material.dart';
import 'package:pagination_app/src/screens/login.dart';

import '../helper/blockbutton.dart';

class SigninScreen extends StatefulWidget {
  
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
 final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          const TopContainer(),
          Positioned(
            top: 250,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 40, right: 27, left: 27, bottom: 20),
              child: LoginForm(
                  formkey: formkey, username: username, password: password),
            ),
          ),
          Positioned(
            bottom: 100,
            child:  MaterialButton(
              elevation: 0,
              onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen()),);
              },
              shape: const StadiumBorder(),
              textColor: Theme.of(context).hintColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              child: const Text("alredy have an account."),
            ),)
        ],
      ),
      );
  }
}


class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Container(
        decoration: const BoxDecoration(color: Colors.blueGrey),
        width: MediaQuery.of(context).size.width,
        height: 280,
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 60),
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/owl logo-01.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formkey,
    required this.username,
    required this.password,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController username;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: username,
              keyboardType: TextInputType.emailAddress,
              validator: (input) => input?.contains('@') == false
                  ? "should be a valid email"
                  : null,
              decoration: InputDecoration(
                labelText: 'email',
                labelStyle: TextStyle(color: Theme.of(context).accentColor),
                contentPadding: EdgeInsets.all(12),
                hintText: 'johndoe@gmail.com',
                hintStyle: TextStyle(
                    color: Theme.of(context).focusColor.withOpacity(0.7)),
                prefixIcon: Icon(Icons.alternate_email,
                    color: Theme.of(context).accentColor),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor.withOpacity(0.2))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor.withOpacity(0.5))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor.withOpacity(0.2))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: password,
              obscureText: false,
              validator: (input) => (input?.length ?? 0) < 6
                  ? 'should be more than 6 letters'
                  : null,
              decoration: InputDecoration(
                labelText: "password",
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
                contentPadding: const EdgeInsets.all(12),
                hintText: '••••••••••••',
                hintStyle: TextStyle(
                    color: Theme.of(context).focusColor.withOpacity(0.7)),
                prefixIcon: Icon(Icons.lock_outline,
                    color: Theme.of(context).colorScheme.secondary),
                suffixIcon: IconButton(
                  onPressed: () {},
                  color: Theme.of(context).focusColor,
                  icon: const Icon(Icons.abc),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor.withOpacity(0.2))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor.withOpacity(0.5))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor.withOpacity(0.2))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            BlockButtonWidget(
              text: const Text(
                "Sign Up",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.teal,
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  // Handle login logic
                }
              },
            ),
           
          ],
        ),
      ),
    );
  }
}
