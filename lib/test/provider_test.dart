import 'package:flutter/material.dart';
import 'package:flutter_widgets/base/base_scaffold.dart';
import 'package:provider/provider.dart';

/// @author：yongfeng
/// @data：2024/9/22 11:34
/// Provider使用测试

//全局变量，检测Widget是否被重新build了，验证ctc.select方法是否有效
int nameIndex = 0;
int name2Index = 0;
int counterIndex = 0;

class ProviderTest extends StatelessWidget {
  const ProviderTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleWidget: const Text('Provider使用测试'),
      bodyWidget: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NameTestLogic()),
          ChangeNotifierProvider(create: (_) => CounterTestLogic()),
        ],
        builder: (ctx, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              child!,
              const Text('Provider使用测试'),
              Builder(builder: (bc) {
                return Text(
                    'nameIndex=${nameIndex++}--name:${bc.select((NameTestLogic p) => p.entity1.name)}');
              }),
              TextButton(
                  onPressed: () {
                    ctx.read<NameTestLogic>().updateName();
                  },
                  child: const Text('点击修改name')),
              Builder(builder: (bc) {
                return Text(
                    'nameIndex2=${name2Index++}--name:${bc.select((NameTestLogic p) => p.entity2.name)}');
              }),
              TextButton(
                  onPressed: () {
                    ctx.read<NameTestLogic>().updateName2();
                  },
                  child: const Text('点击修改name2')),
              Builder(builder: (bc) {
                return Text(
                    'counterIndex=${counterIndex++}--counter:${bc.select((CounterTestLogic e) => e.entity.counter)}');
              }),
              TextButton(
                  onPressed: () {
                    ctx.read<CounterTestLogic>().updateCounter();
                  },
                  child: const Text('点击修改counter'))
            ],
          );
        },
        child: const SizedBox(width: double.infinity),
      ),
    );
  }
}

class NameTestLogic with ChangeNotifier {
  NameTestEntity entity1 = NameTestEntity("init");
  NameTestEntity entity2 = NameTestEntity("init2");

  NameTestLogic() {
    debugPrint("NameTestLogic create");
  }

  int updateNameIndex = 0;

  void updateName() {
    entity1.name = "name1 update${updateNameIndex++}";
    notifyListeners();
    debugPrint("increase,name=${entity1.name}");
  }

  void updateName2() {
    entity2.name = "name2 update${updateNameIndex++}";
    notifyListeners();
    debugPrint("increase,name=${entity2.name}");
  }
}

class CounterTestLogic with ChangeNotifier {
  CounterTestEntity entity = CounterTestEntity(1);

  void updateCounter() {
    entity.counter++;
    notifyListeners();
    debugPrint("increase,counter=${entity.counter}");
  }
}

class NameTestEntity {
  String name;

  NameTestEntity(this.name);
}

class CounterTestEntity {
  int counter;

  CounterTestEntity(this.counter);
}
