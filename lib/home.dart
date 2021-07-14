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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu', // 通常用于添加无障碍信息
          ),
          onPressed: () {
            print('Menu button click');
          },
        ),
        title: Text('Shrine'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print('search button');
              },
              icon: Icon(
                Icons.search,
                semanticLabel: 'search',
              )),
          IconButton(
              onPressed: () {
                print('filter button');
              },
              icon: Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ))
        ],
      ),
      body: Center(
        child: Text('I did it!'),
      ),
    );
  }
}
