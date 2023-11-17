import 'package:flutter/material.dart';
import 'package:pagination_app/src/models/user.dart';
import 'package:pagination_app/src/screens/dashboard.dart';
import 'package:pagination_app/src/screens/signup.dart';
import '../helper/blockbutton.dart';
import '../helper/db_hehper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
 final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                 Navigator.push(context,MaterialPageRoute(builder: (context) => const SigninScreen()),);
              },
              shape: const StadiumBorder(),
              textColor: Theme.of(context).hintColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
              child: const Text("create an account."),
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

class LoginForm extends StatefulWidget {
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
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
late BuildContext _ctx;

  bool _isLoading = false;

  final formKey =  GlobalKey<FormState>();

  final scaffoldKey =  GlobalKey<ScaffoldState>();

   String? _username, _password;

   LoginResponse? _response;

   _LoginPageState() {
    _response =  LoginResponse(this as LoginCallBack);
  }

  @override
  Widget build(BuildContext context) {

    void _showSnackBar(String text) {
     ScaffoldMessenger.of(context). showSnackBar( SnackBar(
      content:  Text(text),
    ));
  }
  //   void _submit() {
  //   final form = formKey.currentState;
  //   if (form?.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //       form?.save();
  //       _response.doLogin(_username, _password);
  //     });
  //   }else{
  //     _showSnackBar('text');
  //   }
  // }
  
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Form(
        key: widget.formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                onSaved: (val) => _username = val!,
              controller: widget.username,
              keyboardType: TextInputType.emailAddress,
              validator: (input) => input?.contains('@') == false
                  ? "should be a valid email"
                  : null,
              decoration: InputDecoration(
                labelText: 'email',
                labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
                contentPadding: const EdgeInsets.all(12),
                hintText: 'johndoe@gmail.com',
                hintStyle: TextStyle(
                    color: Theme.of(context).focusColor.withOpacity(0.7)),
                prefixIcon: Icon(Icons.alternate_email,
                    color: Theme.of(context).colorScheme.secondary),
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
                onSaved: (val) => _password = val!,
              controller: widget.password,
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
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.teal,
              onPressed: () {
                if (widget.formkey.currentState!.validate()) {
                   setState(() {
              _isLoading = true;
              _response?.doLogin(_username!, _password!);
              });
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const DashboaedScreen()),);
                }else{
                  _showSnackBar('text');
                }
              },
            ),
           
          ],
        ),
      ),
    );
  }

 Future<int?>onSave(User user)async{
  DatabaseHelper db =DatabaseHelper();
  var dbUser = await db.userdatabase;
  int? res = await dbUser?.insert("User", user.toMap());
    return  res;
 }

 Future<int?> deleteUser(User user) async {
    DatabaseHelper db =DatabaseHelper();
    var dbClient = await db.userdatabase;
    int? res = await dbClient?.delete("User");
    return res;
  }

   Future<User?> getLogin(String user, String password) async {
        DatabaseHelper db =DatabaseHelper();
    var dbClient = await db.userdatabase;
    var res = await dbClient!.rawQuery("SELECT * FROM user WHERE username = '$user' and password = '$password'");
    
    if (res.isNotEmpty) {
      return User.fromMap(res.first);
    }
    return null;
  }

   Future<List<User>?> getAllUser() async {
            DatabaseHelper db =DatabaseHelper();

    var dbClient = await db.userdatabase;
    var res = await dbClient!.query("user");
    
    List<User>? list =
        res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : null;
    return list;
  }
}
abstract class LoginCallBack {
  void onLoginSuccess(User user);
  void onLoginError(String error);
}
class LoginResponse {
  final LoginCallBack _callBack;
  LoginRequest loginRequest =  LoginRequest();
  LoginResponse(this._callBack);
  doLogin(String username, String password) {
    loginRequest
        .getLogin(username, password)
        .then((user) => _callBack.onLoginSuccess(user))
        .catchError((onError) => _callBack.onLoginError(onError.toString()));
  } 
}
class LoginRequest {
 Future<User> getLogin(String username, String password) {
    var result = getLogin(username,password);
    return result;
  }
}