import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/widgets/text_field.dart';

import '../utils/colors.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  bool _isLoading = false;

  // void signUpUser() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String res = await AuthMethods().signUpUser(
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //     username: _usernameController.text,
  //   );
  //   if (res == "success") {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     // navigate to the home screen
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => const ResponsiveLayout(
  //           mobileScreenLayout: MobileScreenLayout(),
  //           webScreenLayout: WebScreenLayout(),
  //         ),
  //       ),
  //     );
  //   } else {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     // show the error
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
              child: Image(
                image: const AssetImage('assets/ic_instagram.png'),
              ),
              // Image.asset(
              //   'assets/ic_instagram.png',
              //   color: primaryColor,
              //   height: 64,
              // ),
            ),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage(
                      'https://concepto.de/wp-content/uploads/2015/03/paisaje-800x409.jpg'),
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 370,
              height: 50,
              child: TextFieldInput(
                hintText: 'Enter Username',
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
              ),
            ),
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
            Container(
              margin: const EdgeInsets.only(top: 10),
              height: 50,
              width: 370,
              child: TextFieldInput(
                hintText: 'Enter Bio',
                textEditingController: _bioController,
                textInputType: TextInputType.text,
                isPass: true,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                AuthMethods().signUpUser(
                    username: _usernameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    bio: _bioController.text);
              },
              child: !_isLoading
                  ? const Text(
                      'Sign up',
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
                  builder: (context) => const LoginScreen(),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Already have an account?"),
                  Text(
                    " Login.",
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
}
