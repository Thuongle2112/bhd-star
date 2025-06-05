import 'package:flutter/material.dart';
import '../../../../core/common/widgets/form_field/common_form_field.dart';
import '../../../../core/utils/validators/validation.dart';
import '../register/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin của bạn'),
        backgroundColor: const Color(0xFF7FBF43),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Bạn cần đăng nhập để truy cập vào tài khoản của mình',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 16),
              CommonFormField(
                labelText: 'Email hoặc tên đăng nhập',
                validator: Validators.validateEmail,
                controller: emailController,
              ),
              const SizedBox(height: 16),
              CommonFormField(
                labelText: 'Mật khẩu của bạn',
                isPassword: true,
                suffixIcon: Icons.visibility_off,
                validator: Validators.validatePassword,
                controller: passwordController,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Quên mật khẩu',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7FBF43),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Đăng nhập'),
              ),
              const SizedBox(height: 16),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Hoặc bạn chưa có tài khoản?',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        minimumSize: const Size(double.infinity, 48),
                      ),
                      child: const Text(
                        'Đăng ký',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
