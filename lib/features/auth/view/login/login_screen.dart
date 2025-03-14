import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/features/auth/bloc/auth_bloc.dart';
import 'package:myth/features/auth/data/model/request_models.dart';
import 'package:myth/features/auth/widgets.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/services/toast.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/extensions.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/buttons.dart';
import 'package:myth/widgets/custom_widgets.dart';
import 'package:myth/widgets/dialog.dart';
import 'package:myth/widgets/dialog_legacy.dart';
import 'package:myth/widgets/text.dart';
import 'package:myth/widgets/text_inputs.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  loginAction(context){
     BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                                  data: LoginRequestModel( email: _emailController.text.trim(),
                                  username: _emailController.text.trim(),
                                  password: _passwordController.text,
                                )
                                 ));
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
            extendBody: true,
            body: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is UserLoggedIn) {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(content: Text("Logged in successfully")),  
                  // );
                  Navigator.of(context).pushNamed(Routes.tabs);
                } else if (state is UserError) { 
                  // Alerts().showError(context: context, title: "Error", body: state.message);
                  // ToastService.showToast(state.message);
                  Alerts().showError(context: context, title: "err", body: state.message);  
                }
              },
              builder: (context, state) {
                print("state s $state");
                return Form(
          autovalidateMode: AutovalidateMode.disabled,
          key: null,//AppKeys.loginFormKey,
          child:  SingleChildScrollView(
              child: Column(
               
                mainAxisAlignment: MainAxisAlignment.start,
                children: [  
                   TCurvedEdgeWidget(
                  child: Container(
                    height:109,
                    width:double.infinity, 
                    color:AppColors.primary ,
                    child: const Center(
                      child: Text(
                    "Welcome Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24 , color: Color.fromARGB(255, 36, 36, 36) , 
                    fontWeight: FontWeight.bold),
                  )),),
                    
                ),
                SizedBox(height: 40,),
                 const Padding(
                   padding:  EdgeInsets.all(8.0),
                   child: Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                 ),
                  Image.asset(Assets.lightAppLogo , width: 50 ),
                  const SizedBox(height: 20),
                  TInputField(
                    icon:  Icons.email_outlined  ,
                    label: S.of(context).email,
                    placeholder: S.of(context).email_example,
                    controller: _emailController,
                    // validator: (value) {
                    //   if (value == null || value == '') {
                    //     return S.of(context).email_required;
                    //   }
                    //   return null;
                    // },
                  ),
                  TInputField(
                    secureText: true ,
                    label: S.of(context).password,
                    placeholder: S.of(context).password_example,
                    icon: Icons.lock_outline ,
                    controller: _passwordController,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return S.of(context).passowrd_required;
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height:6),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(Routes.forget_password);
                        },
                        child: Text(
                          S.of(context).forget_password,
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  // auth.loading
                  //     ? Center(child: CircularProgressIndicator())
                  //     : 
                  if(state is UserLoading)
                    Center(child: CircularProgressIndicator()),
                  if(state is! UserLoading)
                      mainButton(
                          text: "Login",
                          fontStyle: white_16_bold,
                          onTap: () async {
                            // Navigator.of(context).pushNamedAndRemoveUntil(Routes.tabs, (ro)=>true);
                            // return;
                            if (_emailController.text.isEmpty ||
                                _emailController.text == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Email Required")));
                            } else if (_passwordController.text.isEmpty ||
                                _passwordController.text == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Password Required")));
                            } else {
                              loginAction(context);
                            }
                          },
                        ),
                ],
              ),
            ),
        );
              },
    ));
  }
}
