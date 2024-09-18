import 'package:buspay_owner/Screens/AuthenticationScreen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool darkMode = false;
  bool _obscureText = true;
  bool _rememberMe = false; 
  @override
  Widget build(BuildContext context) {
   
    ScreenUtil.init(
      context,
      designSize: Size(375, 812), 
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 397.h, 
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(15, 103, 177, 1),
                      image: DecorationImage(
                        image: AssetImage('assets/star.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 75.h,
                          left: (375 / 2).w - 14.w, 
                          child: Image.asset(
                            'assets/logo.png',
                            width: 28.w,
                            height: 28.h,
                          ),
                        ),
                        Positioned(
                          top: 120.h,
                          left: 0,
                          right: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Sign in to your',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.sp, 
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'Account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32.sp, 
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 1.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Text(
                                  "Enter your email and password to log in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp, 
                                    fontFamily: 'Inter',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 257.h,
                left: 20.w,
                right: 20.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                height: 1.h,
                                color: Color(0xFFEDF1F3),
                              ),
                            ),
                            Text(
                              "login Now",
                              style: TextStyle(
                                color: Color(0xFF6C7278),
                                fontSize: 12.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.01,
                                height: 1.5.h,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 16.w),
                                height: 1.h,
                                color: Color(0xFFEDF1F3),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: Container(
                            width: double.infinity,
                            height: 46.h,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 16.w,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: Container(
                            width: double.infinity,
                            height: 46.h,
                            child: TextField(
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.h,
                                  horizontal: 16.w,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _rememberMe,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                  activeColor: Color(0xFF0F67B1), 
                                  checkColor: Colors.white, 
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF0F67B1),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), 
      );},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF0F67B1),
                              minimumSize: Size(double.infinity, 48.h),
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 24.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                side: BorderSide(
                                  color: Color(0xFF0F67B1),
                                  width: 1.w,
                                ),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
