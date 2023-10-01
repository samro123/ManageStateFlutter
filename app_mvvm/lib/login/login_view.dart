import 'package:app_mvvm/login/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  final loginViewModel = LoginViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    emailController.addListener(() {
          loginViewModel.emailSink.add(emailController.text);
    });
    passController.addListener(() {
          loginViewModel.passSink.add(passController.text);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<String>(
            stream: loginViewModel.emailStream,
            builder: (context, snapshot) {
            return TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'example@gmail.com',
                  labelText: 'Email *',
                  errorText: snapshot.data
              ),
            );
          },),
          const SizedBox(height: 20,),
          StreamBuilder<String>(
            stream: loginViewModel.passStream,
            builder: (context, snapshot) {
              return TextFormField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'Password *',
                    errorText: snapshot.data
                ),
              );
            }
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){},
              child: Text('Login')
          )
        ],
      ),
    );
  }
}

