import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  // void loginUser() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String res = await AuthMethods().loginUser(
  //       email: _emailController.text, password: _passwordController.text);
  //   if (res == 'success') {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(
  //           builder: (context) => const ResponsiveLayout(
  //             mobileScreenLayout: MobileScreenLayout(),
  //             webScreenLayout: WebScreenLayout(),
  //           ),
  //         ),
  //             (route) => false);
  //
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   } else {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(res),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                'assets/ic_instagram.png',
                color: primaryColor,
                height: 64,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 370,
              height: 50,
              child: TextFieldInput(
                hintText: 'Enter Email',
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              width: 370,
              child: TextFieldInput(
                hintText: 'Enter Password',
                textEditingController: _passwordController,
                textInputType: TextInputType.text,
                isPass: true,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                loginUser();
              },
              child: !_isLoading
                  ? const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(blueColor),
                minimumSize: MaterialStateProperty.all(
                  const Size(
                    370,
                    50,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignupScreen(),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Don't have an account?"),
                  Text(
                    " Sign up.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().logInUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'Correct') {
    } else {
      showSnackBar(context, res);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
