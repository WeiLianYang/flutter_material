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
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

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
      body: GridView.count(
        crossAxisCount: 2,
        // 指定每横行展示2个条目
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        // 以宽高比（宽除以高）的形式定义了条目的大小，GridView 里每个条目的大小默认都是一样的，
        // height = ([width of the entire grid] - 16 - 16) / 2 * 9 / 8
        // children: _buildGridList(10),
        children: _buildGridCards(context),
      ),
    );
  }

  /// 生成网格列表数据视图
  List<Card> _buildGridList(int count) {
    List<Card> cards = List.generate(
        count,
        (index) => Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // 将文本向头部对齐
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset('assets/diamond.png'),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // 将文本向头部对齐
                        children: <Widget>[
                          Text('Title'),
                          SizedBox(height: 8.0), // 表示它们之间有 8 points 的距离
                          Text('Sub title')
                        ],
                      ))
                ],
              ),
            ));
    return cards;
  }

  /// 生成网格列表数据视图 2
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product.name,
                      style: theme.textTheme.title,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.body2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}
