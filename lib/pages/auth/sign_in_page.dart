import 'package:yabisaba/pages/auth/sign_up_page.dart';
import 'package:yabisaba/utils/colors.dart';
import 'package:yabisaba/widgets/app_text_field.dart';
import 'package:yabisaba/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_loader.dart';
import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var emailController = TextEditingController();
    var passwordController = TextEditingController();
    // var nameController = TextEditingController();
    var phoneController = TextEditingController();

    void _login(AuthController authController) {
      // var authController = Get.find<AuthController>();
      // String name = nameController.text.trim();
      // String phone = phoneController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      // if (email.isEmpty) {
      //   showCustomSnackBar("Type in your email address",
      //       title: "Email address");
      // } else if (!GetUtils.isEmail(email)) {
      //   showCustomSnackBar("Type in a valid email address",
      //       title: "Valid email address");
      // }

      if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password cannot be less that 6 characters",
            title: "Password");
      } else {
        showCustomSnackBar("All went well!", title: "Perfect");

        authController.login(phone, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
            // Get.offAllNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),

                      //App Logo
                      Container(
                        margin: EdgeInsets.only(top: Dimensions.height20),
                        height: Dimensions.height45 * 2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/image/yabis.png"),
                          fit: BoxFit.fitHeight,
                        )),
                      ),
                      // App Logo
                      // Container(
                      //   height: Dimensions.screenHeight * 0.25,
                      //   decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //     image: AssetImage("assets/image/videogif.gif"),
                      //     fit: BoxFit.cover,
                      //   )),
                      // ),

                      SizedBox(height: 10),

                      //Welcome Section
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ahoy!",
                              style: TextStyle(
                                  fontSize: Dimensions.font20 * 3 +
                                      Dimensions.font20 / 2,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sign into your Account",
                              style: TextStyle(
                                fontSize: Dimensions.font20,
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height20),
                      //Phone
                      AppTextField(
                          textController: phoneController,
                          hintText: "Phone",
                          icon: Icons.phone_outlined),
                      // //Email
                      // AppTextField(
                      //     textController: emailController,
                      //     hintText: "Email",
                      //     icon: Icons.email),
                      SizedBox(height: Dimensions.height20),
                      //Password
                      AppTextField(
                        textController: passwordController,
                        hintText: "Password",
                        icon: Icons.remove_red_eye,
                        isObscure: true,
                      ),
                      SizedBox(height: Dimensions.height20),

                      SizedBox(height: Dimensions.height20),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          //Tagline
                          RichText(
                            text: TextSpan(
                                text: "Sign into your Account",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: Dimensions.font20,
                                )),
                          ),
                          SizedBox(height: Dimensions.width20),
                        ],
                      ),
                      SizedBox(height: Dimensions.screenHeight * 0.05),

                      //SignIn button
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius30,
                            ),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: "SignIn",
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      //Sign up options
                      SizedBox(height: Dimensions.screenHeight * 0.05),
                      RichText(
                        text: TextSpan(
                          text: "Don\'t have an Account? ",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimensions.font20,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(SignUpPage(),
                                    transition: Transition.fade),
                              text: "SignUp",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainBlackColor,
                                fontSize: Dimensions.font20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }
}
