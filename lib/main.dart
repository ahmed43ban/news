import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:news/ui/home/screen/home_screen.dart';
import 'package:news/ui/search/screen/search_screen.dart';
import 'package:news/ui/search/widget/search_view_model.dart';
import 'package:provider/provider.dart';

import 'core/app_style.dart';
import 'core/prefshelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefHelper.init();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale("en"), Locale("ar")],
      path: 'assets/translations',
      // <-- change the path of the translation files
      fallbackLocale: Locale("en"),
      child: ChangeNotifierProvider(
          create: (context) => ThemeProvider()..initTheme(),
          child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'News App',
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme,
          themeMode: themeProvider.currentTheme,
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName: (_) => HomeScreen(),
            SearchScreen.routeName: (_) => ChangeNotifierProvider(
                create: (context) => SearchViewModel(), child: SearchScreen())
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}
