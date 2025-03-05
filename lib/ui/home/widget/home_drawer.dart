import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/core/assets_manger.dart';
import 'package:news/core/colors_manger.dart';
import 'package:news/core/strings_manger.dart';
import 'package:news/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  final void Function() onHomeTap;
  HomeDrawer({required this.onHomeTap});
  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  String selectedTheme = StringsManger.theme1.tr();

  String selectedLang = StringsManger.language1.tr();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Get theme from ThemeProvider and set the selected theme.
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    selectedTheme = themeProvider.currentTheme == ThemeMode.dark
        ? StringsManger.theme2.tr()
        : StringsManger.theme1.tr();

    // Set language based on current locale.
    selectedLang = context.locale.languageCode == "ar"
        ? StringsManger.language2
        : StringsManger.language1;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      width: 269.w,
      backgroundColor: ColorsManger.primaryLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 166.h,
            color: ColorsManger.secondaryLight,
            child: Text(
              StringsManger.news_app.tr(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: ColorsManger.primaryLight, fontSize: 24),
            ),
          ),
          Padding(
            padding: REdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () {
                    widget.onHomeTap();
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManger.home,
                        width: 24.w,
                        height: 24.h,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        StringsManger.go_to_home.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: ColorsManger.secondaryLight),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Divider(
                  color: ColorsManger.secondaryLight,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetsManger.themeIcon,
                      width: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      StringsManger.theme.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: ColorsManger.secondaryLight),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsManger.secondaryLight)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: ColorsManger.secondaryLight))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: selectedTheme,
                        hint: Text(
                          "Choose Theme",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: ColorsManger.secondaryLight),
                        ),
                        dropdownColor: ColorsManger.primaryLight,
                        style: TextStyle(color: ColorsManger.secondaryLight),
                        borderRadius: BorderRadius.circular(16.r),
                        isExpanded: true,
                        iconEnabledColor: ColorsManger.secondaryLight,
                        iconDisabledColor: ColorsManger.secondaryLight,
                        items: [
                          DropdownMenuItem(
                            child: Text(StringsManger.theme1.tr()),
                            value: StringsManger.theme1.tr(),
                          ),
                          DropdownMenuItem(
                            child: Text(
                              StringsManger.theme2.tr(),
                            ),
                            value: StringsManger.theme2.tr(),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedTheme = value!;
                            if(themeProvider.currentTheme==ThemeMode.dark){
                              if(value==StringsManger.theme1.tr()){
                                themeProvider.changeTheme(ThemeMode.light);
                              }else{
                                themeProvider.changeTheme(ThemeMode.dark);
                              };
                            }else{
                              if(value==StringsManger.theme2.tr()){
                                themeProvider.changeTheme(ThemeMode.dark);
                              }else{
                                themeProvider.changeTheme(ThemeMode.light);
                              }
                            }
                          });
                        }),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Divider(
                  color: ColorsManger.secondaryLight,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AssetsManger.language,
                      width: 24.w,
                      height: 24.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      StringsManger.language.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: ColorsManger.secondaryLight),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                InputDecorator(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: ColorsManger.secondaryLight)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide:
                              BorderSide(color: ColorsManger.secondaryLight))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                        value: selectedLang,
                        hint: Text(
                          "Choose Language",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: ColorsManger.secondaryLight),
                        ),
                        dropdownColor: ColorsManger.primaryLight,
                        style: TextStyle(color: ColorsManger.secondaryLight),
                        borderRadius: BorderRadius.circular(16.r),
                        isExpanded: true,
                        iconEnabledColor: ColorsManger.secondaryLight,
                        iconDisabledColor: ColorsManger.secondaryLight,
                        items: [
                          DropdownMenuItem(
                            child: Text(StringsManger.language1),
                            value: StringsManger.language1,
                          ),
                          DropdownMenuItem(
                            child: Text(
                              StringsManger.language2,
                            ),
                            value: StringsManger.language2,
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedLang = value!;
                            if(context.locale.languageCode=="ar"){
                              if(value==StringsManger.language1){
                                context.setLocale(Locale("en"));
                              }else{
                                context.setLocale(Locale("ar"));
                              }
                            }else{
                              if(value==StringsManger.language2){
                                context.setLocale(Locale("ar"));
                              }else{
                                context.setLocale(Locale("en"));
                              }
                            }
                          });
                        }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
