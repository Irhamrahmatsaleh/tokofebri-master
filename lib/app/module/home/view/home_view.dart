import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tokofebri/app/module/home/provider/home_provider.dart';
import 'package:tokofebri/app/module/home/view/home_detail_view.dart';
import 'package:tokofebri/setup.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, provider, _) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.indigo,
            leading: Container(
              padding: const EdgeInsets.all(8),
              child: const CircleAvatar(
                radius: 34,
                backgroundImage: AssetImage('assets/images/logo.gif'),
              ),
            ),
            title: const Text('Hi, Febri'),
          ),
          body: RefreshIndicator(
            color: Colors.indigo,
            onRefresh: () async {
              // metod pull refresh
              await provider.getData();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Visibility(
                visible: !provider.isLoading,
                replacement: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.indigo,
                )),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  itemCount: provider.data.length,
                  itemBuilder: (context, index) {
                    var item = provider.data[index];
                    return InkWell(
                      onTap: (() {
                        //metode untuk pindah ke detail dengan membaya object
                        navigator.push(MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailView(productId: item)));
                      }),
                      // tampilan untuk card product
                      child: Card(
                        color: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        clipBehavior: Clip.antiAlias,
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white70),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.network(item.cover)),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    NumberFormat.currency(
                                            symbol: 'Rp.',
                                            locale: 'id',
                                            decimalDigits: 0)
                                        .format(item.price),
                                    style:
                                        const TextStyle(color: Colors.indigo),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
