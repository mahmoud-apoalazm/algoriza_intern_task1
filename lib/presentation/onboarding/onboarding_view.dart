import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intern_task1/presentation/resources/color_manager.dart';
import 'package:intern_task1/presentation/resources/routs_manager.dart';
import 'package:intern_task1/presentation/resources/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        actions: [
          Container(
            margin: const EdgeInsets.all(AppMargin.m12),
            child: CustomButton(
              text: AppStrings.skip,
              buttonBorder: AppSize.s20,
              buttonColor: ColorManager.primary,
              textColor: ColorManager.white,
              width: AppSize.s18,
              onTap: () {
                Navigator.pushNamed(context, Routes.loginRoute);
              },
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 10, bottom: 20, start: 10, end: 10),
        child: PageView.builder(
            controller: _pageController,
            itemCount: _list.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(_list[index]);
            }),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 10, bottom: 20, start: 10, end: 10),
        child: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 15,
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: _list.length,
                effect: WormEffect(
                  dotWidth: 20,
                  dotHeight: 8,
                  dotColor: Colors.grey,
                  activeDotColor: ColorManager.primary,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                buttonColor: ColorManager.primary,
                text: 'Get Started',
                onTap: () {
                  Navigator.pushNamed(context, Routes.loginRoute);
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account ?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.registerRoute);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SvgPicture.asset(
            _sliderObject.image,
            height: 370,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? buttonColor;
  final double textFontSize;
  final double height;
  final double width;
  final double buttonBorder;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.textColor = Colors.white,
    this.buttonColor = Colors.teal,
    this.textFontSize = 15,
    this.height = 48,
    this.width = double.infinity,
    this.buttonBorder = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      minWidth: width,
      height: height,
      color: buttonColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(buttonBorder))),
      onPressed: () {
        onTap();
      },
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: textFontSize,
        ),
      ),
    );
  }
}
