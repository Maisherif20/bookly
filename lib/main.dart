import 'package:bookly/presentation_layer/ui/book_Details/bookDetailsScreen.dart';
import 'package:bookly/presentation_layer/ui/homePage/home_page.dart';
import 'package:bookly/presentation_layer/ui/search/searchWidget.dart';
import 'package:bookly/presentation_layer/ui/splashScreen/splashScreen.dart';
import 'package:bookly/presentation_layer/ui/test.dart';
import 'package:bookly/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          RouteScreen.splashRoute:(context) => SplashScreen(),
          RouteScreen.HomeScreen:(context) => HomePage(),
          RouteScreen.Test:(context) => Test(),
          RouteScreen.searchScreen:(context) => SearchScreen(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        initialRoute: RouteScreen.HomeScreen,
      ),
    );
  }
}


