import 'package:flutter/material.dart';
import 'inpatient_care_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController idC = TextEditingController();
  final TextEditingController passC = TextEditingController();

  bool isFormValid = false;
  bool showPhoneLogin = false;
  bool obscurePassword = true;

  void validateForm() {
    setState(() {
      isFormValid = idC.text.isNotEmpty && passC.text.isNotEmpty;
    });
  }
  void _loginWithGoogle() {
    debugPrint("Login dengan Google ditekan");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome Back!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            const SizedBox(height: 30),
            if (!showPhoneLogin) ...[
              _field(
                "Username / NIK",
                controller: idC,
                keyboardType: TextInputType.text,
                onChanged: (_) => validateForm(),
              ),
              _field(
                "Password",
                controller: passC,
                isPassword: true,
                onChanged: (_) => validateForm(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    overlayColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: const Text("Lupa password?"),
                ),
              ),
              const SizedBox(height: 8),
              _button(
                "Login",
                isFormValid
                    ? () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const InpatientCareScreen(),
                    ),
                  );
                }
                    : null,
              ),
              const SizedBox(height: 24),
              Row(
                children: const [
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.blue),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "or login with",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1, color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _googleButton(),
            ],
          ],
        ),
      ),
    );
  }
  Widget _field(
      String hint, {
        bool isPassword = false,
        TextEditingController? controller,
        TextInputType? keyboardType,
        Function(String)? onChanged,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? obscurePassword : false,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.blueGrey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              obscurePassword
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: Colors.blue,
            ),
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
          )
              : null,
        ),
      ),
    );
  }
  Widget _button(String text, VoidCallback? onTap) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          onTap == null ? Colors.blue.shade200 : Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
  Widget _googleButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        onPressed: _loginWithGoogle,
        icon: Image.asset('assets/google_logo.png', height: 22),
        label: const Text(
          "Login dengan Google",
          style: TextStyle(color: Colors.grey),
        ),
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.blue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}