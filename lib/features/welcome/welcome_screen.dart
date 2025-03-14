import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myth/app_router/app_router.dart';
import 'package:myth/features/auth/bloc/auth_bloc.dart';
import 'package:myth/generated/l10n.dart';
import 'package:myth/services/network/api_service.dart';
import 'package:myth/services/network/models/error_response.dart';
import 'package:myth/utils/app_colors.dart';
import 'package:myth/utils/assets.dart';
import 'package:myth/utils/constants/shadows.dart';
import 'package:myth/utils/constants/sizes.dart';
import 'package:myth/utils/shared_preference_helper.dart';
import 'package:myth/utils/text_styles.dart';
import 'package:myth/widgets/buttons.dart';
import 'package:myth/widgets/containers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UserLoggedIn) {
                  Navigator.of(context).pushNamed(Routes.tabs);
                }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/on_boarding_images/on.png"),
              fit: BoxFit.cover)
            ),
            child: Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 55,),
                  
                   TRoundedContainer(
                    height: MediaQuery.of(context).size.height/3.5,
                    shadow: TShadowStyle.containerShadow,
                    gradient: AppColors.onBoardingLinerGradient,
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    margin:const EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: TSizes.sm,
                          width: TSizes.xl * 2,
                          decoration: const BoxDecoration(
                              color: AppColors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(100))),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Center(
                              child: Text(
                            "Find a new doctor to cure your illness.",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .apply(color: AppColors.white),
                          )),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              side: const BorderSide(
                                color: Colors.transparent,
                              ),
                              shadowColor: AppColors.black,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed(Routes.login);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: TSizes.defaultSpace),
                              child: Text(
                                "Get Started",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(color: AppColors.primary),
                              ),
                            ))
                      ],
                    ),
                  ),
                  Spacer(flex: 5,),
                ],
              )
            ),
          ),
          ),
        );
      },
    );
  }
}
