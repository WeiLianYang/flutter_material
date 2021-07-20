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
import 'package:flutter/material.dart';

import 'colors.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
// @override
// State<StatefulWidget> createState() {
//   return LoginState();
// }
}

class LoginState extends State<LoginPageWidget> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: <Widget>[
            SizedBox(height: 60),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 14),
                Text('Shrine'),
              ],
            ),
            SizedBox(
              height: 120,
            ),
            // [Name]
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                // https://docs.flutter.io/flutter/material/TextField-class.html
                controller: _usernameController,
                decoration: InputDecoration(
                  // filled: true,
                  labelText: 'Username',
                ),
              ),
            ),
            // spacer
            SizedBox(height: 12.0),
            // [Password]
            AccentColorOverride(
              color: kShrineBrown900,
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  // filled: true,
                  labelText: 'Password',
                ),
                obscureText: true, // 将用户的输入自动替换为星号，一般用于密码文本框。
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  // 形状（Shapes）的要点：
                  // - 形状帮助促进品牌的视觉效果传达；
                  // - 形状具有可调曲线和角部无角度，曲线和边角以及角部总数；
                  // - 组件的形状不应干扰其可用性。
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                ),
                RaisedButton(
                  child: Text('NEXT'),
                  // 标高（Elevation）的注意点：
                  // 1、在 Material Design 里，所有的界面，组件都有自己的标高值；
                  // 2、在不同标高表面的边缘会有分割线来区别他们谁更"高"；
                  // 3、不同表面之间的高度差可以使用暗淡的背景，增亮的背景或阴影来表示；
                  // 4、标高较高的表面往往意味着内容也相对较为重要。
                  elevation: 8.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// 覆写颜色
class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride(
      {Key? key, required this.color, required this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(accentColor: color),
    );
  }
}
