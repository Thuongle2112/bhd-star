import 'package:bhd_star/core/l10n/locale_keys.g.dart';
import 'package:bhd_star/presentation/pages/auth/register/widgets/dropdown_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/common/widgets/form_field/common_form_field.dart';
import '../../../../core/utils/validators/validation.dart';
import '../../../../data/fake_data/vietnam_cities.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  String? selectedCity;
  DateTime? selectedDate;
  bool isCheckboxChecked = false;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _onRegisterPressed() {
    if (_formKey.currentState!.validate() && isCheckboxChecked) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Đăng ký thành công!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.account_information.tr(),
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF7FBF43),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.register.tr(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    CommonFormField(
                      labelText: LocaleKeys.email.tr(),
                      validator: Validators.validateEmail,
                      controller: emailController,
                    ),
                    const SizedBox(height: 16),
                    CommonFormField(
                      labelText: LocaleKeys.password_1.tr(),
                      isPassword: !isPasswordVisible,
                      suffixIcon:
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                      validator: Validators.validatePassword,
                      controller: passwordController,
                      onSuffixIconPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    CommonFormField(
                      labelText: LocaleKeys.confirm_password.tr(),
                      isPassword: !isConfirmPasswordVisible,
                      suffixIcon:
                          isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                      validator:
                          (value) => Validators.validateConfirmPassword(
                            value,
                            passwordController.text,
                          ),
                      controller: confirmPasswordController,
                      onSuffixIconPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CommonFormField(
                            labelText: LocaleKeys.last_name.tr(),
                            validator: Validators.validateRequired,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CommonFormField(
                            labelText: LocaleKeys.first_name.tr(),
                            validator: Validators.validateRequired,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CommonFormField(
                      labelText: LocaleKeys.mobile.tr(),
                      validator: Validators.validatePhoneNumber,
                      controller: phoneController,
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: CommonFormField(
                          labelText: LocaleKeys.date_of_birth.tr(),
                          suffixIcon: Icons.calendar_today,
                          validator: Validators.validateRequired,
                          controller: TextEditingController(
                            text:
                                selectedDate != null
                                    ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                                    : '',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownFormField<String>(
                      labelText: LocaleKeys.gender.tr(),
                      items: const [
                        DropdownMenuItem(value: 'Nam', child: Text('Nam')),
                        DropdownMenuItem(value: 'Nữ', child: Text('Nữ')),
                      ],
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16),
                    DropdownFormField<String>(
                      labelText: LocaleKeys.city_province.tr(),
                      items:
                          vietnamCities
                              .map(
                                (city) => DropdownMenuItem(
                                  value: city,
                                  child: Text(city),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    CommonFormField(
                      labelText: LocaleKeys.address.tr(),
                      validator: Validators.validateRequired,
                      controller: addressController,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: const Color(0xFF1A1A1A),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: isCheckboxChecked,
                      onChanged: (value) {
                        setState(() {
                          isCheckboxChecked = value ?? false;
                        });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: LocaleKeys.i_have_read_and_agree_to.tr(),
                          style: const TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: LocaleKeys.terms_and_conditions.tr(),
                              style: const TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                ElevatedButton(
                  onPressed: isCheckboxChecked ? _onRegisterPressed : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7FBF43),
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  child: Text(LocaleKeys.register.tr()),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
