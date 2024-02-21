import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vault_app/core/services/shared_services.dart';
import 'package:flutter_vault_app/screens/calculator_screen.dart';
import 'package:flutter_vault_app/utils/colors.dart';
import 'package:flutter_vault_app/utils/config.dart';
import 'package:flutter_vault_app/utils/keys.dart';
import 'package:flutter_vault_app/widgets/custom_button.dart';
import 'package:get/get.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedServices().setData(SetType.bool, SharedKeys.alreadyOpened, true);
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.jpg'),
              const Text(
                'Welcome to ${AppConfig.appName}',
                style: TextStyle(
                  color: AppColors.secondaryColors,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Hide all your privacy behind a secret calculator',
                style: TextStyle(
                  color: AppColors.secondaryColors,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: size.height * .3,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColors.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Privacy and permissions Notice',
                          style: TextStyle(
                            color: AppColors.secondaryColors,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '''
1.Acceptance of Terms :
By using Vault App, users agree to comply with and be bound by these Terms and Conditions.                   
2.User Content :
Users grant Vault App a license to use submitted content for app-related purposes.                
3.Intellectual Property :
Vault App retains all rights to the app and its content; users may not reproduce or modify them.                   
4.Privacy Policy :
Users should refer to the app's privacy policy for information on data collection and usage.                    
5.Termination :
Vault App reserves the right to terminate user accounts for conduct violating these Terms and Conditions.
                        ''',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryColors,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: const TextSpan(
                      text:
                          'By Continuing to use ${AppConfig.appName}, you agree to our ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                                color: AppColors.primaryColors,
                                fontWeight: FontWeight.w800)),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                                color: AppColors.primaryColors,
                                fontWeight: FontWeight.w800)),
                      ]),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                title: 'Agree & Continue',
                onTap: () {
                  Get.offAll(const CalculatorScreen());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                title: 'Disagree',
                titleColor: AppColors.secondaryColors,
                backgroundColor: Colors.transparent,
                onTap: () {
                  Get.defaultDialog(
                      backgroundColor: Colors.white,
                      title:
                          "If disagree, you will not able to use ${AppConfig.appName}",
                      titleStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      content: RichText(
                        text: const TextSpan(
                            text:
                                'By Continuing to use ${AppConfig.appName}, you agree to our ',
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                      color: AppColors.primaryColors,
                                      fontWeight: FontWeight.w800)),
                              TextSpan(
                                text: ' and ',
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                  text: 'Terms of Service',
                                  style: TextStyle(
                                      color: AppColors.primaryColors,
                                      fontWeight: FontWeight.w800)),
                            ]),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: const Text('Quit',
                                style: TextStyle(
                                    color: AppColors.secondaryColors))),
                        TextButton(
                            onPressed: () {
                              Get.offAll(const CalculatorScreen());
                            },
                            child: const Text('Continue',
                                style:
                                    TextStyle(color: AppColors.primaryColors))),
                      ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
