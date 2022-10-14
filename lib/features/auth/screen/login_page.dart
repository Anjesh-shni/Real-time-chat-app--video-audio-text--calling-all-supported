import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_chat/colors.dart';
import 'package:video_chat/common/utils/snackbar.dart';
import 'package:video_chat/common/widget/big_text.dart';
import 'package:video_chat/common/widget/custom_button.dart';
import 'package:video_chat/common/widget/small_text.dart';
import 'package:country_picker/country_picker.dart';
import 'package:video_chat/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "/login-screen";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneNumber.isNotEmpty) {
      ref.read(authControllerProvidr).signInwithPhone(
            context,
            "+${country!.phoneCode}$phoneNumber",
          );
    } else {
      showSnackBar(
        context: context,
        content: "please enter valid number",
      );
    }
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appBarColor,
      appBar: AppBar(
        title: BigText(
          text: "Enter Your Phone Number",
          color: Colors.white,
        ),
        backgroundColor: appBarColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: SmallTxt(
                  text: "Chats app need to verify your phone number",
                  color: Colors.grey,
                  size: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: pickCountry,
                child: const Text("Pick county"),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  if (country != null)
                    const SizedBox(
                      width: 10,
                    ),
                  SmallTxt(
                    text: "+${country?.phoneCode}",
                    color: country == null ? Colors.transparent : Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.75,
                    child: TextField(
                      controller: phoneController,
                      decoration:
                          const InputDecoration(hintText: "phone number"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.6,
              ),
              SizedBox(
                width: 100,
                child: CustomButton(
                  onpressed: sendPhoneNumber,
                  text: "NEXT",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
