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
  // @override
  // State<StatefulWidget> createState() => LoginState();

  /// 该函数为 StatefulWidget 中创建 State 的方法，
  /// 当 StatefulWidget 被调用时会立即执行 createState
  @override
  State<StatefulWidget> createState() {
    print('lifecycle: createState');
    return LoginState();
  }
}

class LoginState extends State<LoginPageWidget> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  /// 该函数为 State 初始化调用，因此可以在此期间执行 State 各变量的初始赋值，
  /// 同时也可以在此期间与服务端交互，获取服务端数据后调用 setState 来设置 State。
  @override
  void initState() {
    print('lifecycle: initState');
    super.initState();
  }

  /// 该函数是在该组件依赖的 State 发生变化时，这里说的 State 为全局 State ，例如语言或者主题等，类似于前端 Redux 存储的 State
  @override
  void didChangeDependencies() {
    print('lifecycle: didChangeDependencies');
    super.didChangeDependencies();
  }

  /// 主要是返回需要渲染的 Widget ，由于 build 会被调用多次，因此在该函数中只能做返回 Widget 相关逻辑，避免因为执行多次导致状态异常。
  @override
  Widget build(BuildContext context) {
    print('lifecycle: build');
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

  /// 主要是提供开发阶段使用，在 debug 模式下，每次热重载都会调用该函数，
  /// 因此在 debug 阶段可以在此期间增加一些 debug 代码，来检查代码问题。
  @override
  void reassemble() {
    print('lifecycle: reassemble');
    super.reassemble();
  }

  /// 该函数主要是在组件重新构建，比如说热重载，父组件发生 build 的情况下，子组件该方法才会被调用，
  /// 其次该方法调用之后一定会再调用本组件中的 build 方法。
  @override
  void didUpdateWidget(covariant LoginPageWidget oldWidget) {
    print('lifecycle: didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  /// 在组件被移除节点后会被调用，如果该组件被移除节点，然后未被插入到其他节点时，则会继续调用 dispose 永久移除。
  @override
  void deactivate() {
    print('lifecycle: deactivate');
    super.deactivate();
  }

  /// 永久移除组件，并释放组件资源
  @override
  void dispose() {
    print('lifecycle: dispose');
    super.dispose();
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
