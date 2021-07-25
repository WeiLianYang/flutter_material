/*
 * Copyright WeiLianYang
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material/home.dart';
import 'package:flutter_material/login.dart';

import 'backdrop.dart';
import 'colors.dart';
import 'model/product.dart';
import 'supplemental/cut_corners_border.dart';

/// 应用主页
class ShrineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData _kShrineTheme = _buildShrineTheme();

    return MaterialApp(
      title: 'Shrine',
      home: Backdrop(
        currentCategory: Category.all,
        frontLayer: HomePage(),
        backLayer: Container(color: kShrinePink100),
        frontTitle: Text('Shrine'),
        backTitle: Text('Menu'),
      ),
      // 初始路径
      initialRoute: '/login_route',
      // 生成路径
      onGenerateRoute: _getRoute,
      // 设置主题
      theme: _kShrineTheme,
    );
  }

  /// 以单下划线开头的函数即是私有的
  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login_route') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPageWidget(),
      fullscreenDialog: true,
    );
  }

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      accentColor: kShrineBrown900,
      primaryColor: kShrinePink100,
      buttonColor: kShrinePink100,
      scaffoldBackgroundColor: kShrineBackgroundWhite,
      cardColor: kShrineBackgroundWhite,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
      textTheme: _buildShrineTextTheme(base.textTheme),
      primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
      primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),
      // 控制顶部状态栏的按钮颜色
      inputDecorationTheme: InputDecorationTheme(
        border: CutCornersBorder(),
      ), // 指定输入框的主题
    );
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          headline: base.headline!.copyWith(
            fontWeight:
                FontWeight.w500, // w500（字重为 500）通常代表中等加粗，而 w400 则代表正常显示的字体
          ),
          title: base.title!.copyWith(fontSize: 18.0),
          caption: base.caption!.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
          displayColor: kShrineBrown900,
          bodyColor: kShrineBrown900,
        );
  }
}
