import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/text_styles2.dart';
import 'package:myth/widgets/app_bars.dart';
import 'package:myth/widgets/buttons.dart';
import 'package:myth/widgets/custom_widgets.dart';
class ForgetPasswordPage extends ConsumerStatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  ConsumerState<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends ConsumerState<ForgetPasswordPage> {
  
  TextEditingController _emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override  
  Widget build(BuildContext context) {
    // final authProvider = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBarCureved(title:"Forget Password" , context: context),
          body: Form(
            key: _formKey,
            child: Container(
              child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      // Spacer(flex: 5,),
                      const SizedBox(height: 10,) ,
                      Image.asset(Assets.resetPasswordLogo),
                      SizedBox(height: 10), 
                      
                      // Center(
                      //   child: Text(S.of(context).forget_password , style: TextStyle(
                      //     color: blackColor,fontSize: 26,
                      //   )),
                      // ),
                      SizedBox(height: 20),
                       Padding(
                        padding: EdgeInsets.all(10) ,
                        child: Text(S.of(context).to_reset_password , 
                         textAlign: TextAlign.center,
                        style: const TextStyle(
                          
                          color: Colors.grey,fontSize: 18,
                          
                        )),
                      ),
                      SizedBox(height: 10),
                
                      TInputField(label: S.of(context).email ,placeholder: S.of(context).email_example , controller: _emailController),
                      // Spacer(flex: 44,),
                      
                      SizedBox(height: 100,) ,
                      // authProvider.loading? Center(child: CircularProgressIndicator(),)
                      // : 
                      mainButton(text: S.of(context).send , fontStyle: white_16_bold , onTap: () async {
                        
                        }),
                      // Spacer(flex: 22,),
                    ],
                  ),
                )
            ),
          ),
      );
    
  }
}


