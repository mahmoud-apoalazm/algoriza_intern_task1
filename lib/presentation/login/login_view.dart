import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intern_task1/presentation/onboarding/onboarding_view.dart';
import 'package:intern_task1/presentation/resources/color_manager.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .30,
                width: double.infinity,
                child: const Image(
                  image: AssetImage(
                    'assets/images/orange.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to Food Delivery',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildSignInRow(),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        buildPhoneForm(),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                          buttonBorder: 5,
                          buttonColor: ColorManager.primary,
                          text: 'Sign in',
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            'Or',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildSignWithGoogle(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Doesn\'t have account ?'),
                            const SizedBox(width: 3,),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Text(
                                'Register here',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ColorManager.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Use the application according to policy rules.Any kinds of violations will be subject to sanctions',
                          style: TextStyle(fontSize: 14,color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget buildSignInRow()=>Row(
    children:  [
      Text(
        'Sign in',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 35,
        ),
      ),
      Spacer(),
      Text(
        'Help',
        style: TextStyle(
          color: ColorManager.primary,
          fontSize: 15.0,
        ),
      ),
      SizedBox(
        width: 3,
      ),
      CircleAvatar(
        backgroundColor: ColorManager.primary,
        radius: 8,
        child: Icon(
          Icons.question_mark_sharp,
          color: Colors.white,
          size: 15,
        ),
      ),
    ],
  );
  Widget buildPhoneForm()=> SizedBox(
    height: 50,
    child: MyTextFormField(
      labelText: 'Phone Number',
      emptyText: 'Eg. 812345678',
      hintText: 'Eg. 812345678',
      preFix: CountryCodePicker(
        showDropDownButton: true,
        showFlag: false,
      ),
      controller: phoneController,
      validation: 'Phone Must Not be Empty',
      keyboardType: TextInputType.phone,
    ),
  );
  Widget buildSignWithGoogle()=>InkWell(
    onTap: (){},
    child: Container(
      height: 47,
      padding:const EdgeInsets.all(10.0) ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: ColorManager.primary,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
         const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10,
            child: Image(
              image: AssetImage(
                  'assets/images/google.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Text(
            'Sign with by google',
            style: TextStyle(
              color: ColorManager.primary,
              fontSize: 15.0,
            ),
          ),
        ],
      ),

    ),
  );
}

class MyTextFormField extends StatelessWidget {
  final String labelText;
  final String emptyText;
  final Widget? preFix;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final String? Function(String?)? validate;
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String validation;
  final Color? suffixColor;
  final Color? cursorColor;
  final Color focusedBorderColor;
  final Color labelTextColor;

  MyTextFormField({
    Key? key,
    required this.labelText,
    required this.emptyText,
    required this.hintText,
    this.preFix,
    required this.controller,
    required this.keyboardType,
    this.validate,
    this.suffix,
    this.suffixPressed,
    this.isPassword = false,
    required this.validation,
    this.suffixColor,
    this.cursorColor = Colors.grey,
    this.focusedBorderColor=Colors.teal,
    this.labelTextColor=Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isPassword,
      cursorColor: cursorColor,

      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0.0),
          borderSide: BorderSide(
            color: focusedBorderColor,
          ),
        ),

        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed!,
          icon: Icon(
            suffix,
            color: suffixColor,
          ),
        )
            : null,
        prefixIcon: preFix,
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color:labelTextColor,fontSize: 13),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      validator: (String? s) {
        if (s!.isEmpty) {
          return validation;
        } else {
          return null;
        }
      },
    );
  }
}