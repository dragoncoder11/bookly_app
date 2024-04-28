import 'package:finalapp/core/utils/styles.dart';
import 'package:finalapp/features/home/data/models/test_model.dart';
import 'package:finalapp/features/home/presentation/views/widgets/featured_item.dart';
import 'package:finalapp/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:finalapp/features/home/presentation/views/widgets/rating_row.dart';
import 'package:finalapp/features/home/presentation/views/widgets/similar_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});
    @override
 
  Widget build(BuildContext context) {
    var featuredModel=ModalRoute.of(context)?.settings.arguments as TestModel;
   // var newestModel=ModalRoute.of(context)?.settings.arguments as TestModel;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.clear),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
             FeaturedItem(testModel:featuredModel,),
            const SizedBox(
              height: 30,
            ),
             Text(featuredModel.publisher??''),
            const SizedBox(
              height: 7,
            ),
             Text(featuredModel.publishedDate??''),
            const SizedBox(
              height: 20,
            ),
          const  Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 RatingRow(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                   width: MediaQuery.of(context).size.width*.44,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                  child: Center(child: Text('Free',style:const TextStyle(fontSize: 18,color: Colors.black),),),
                ),
                 GestureDetector(
                  onTap: () async{
                    Uri url=Uri.parse(featuredModel.link!);
                    if(await canLaunchUrl(url)){
                      await launchUrl(url);
                      print(url);
                    }
                  },
                   child: Container(
                    width: MediaQuery.of(context).size.width*.44,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Center(child: Text(featuredModel.link==null?'not preview':'preview',style: TextStyle(fontSize: 18,color: Colors.white),),),
                                   ),
                 ),
              ],
            ),
            const SizedBox(
              height: 75,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('  You can also like :',style: Styles.style16Bold,),
              ],
            ),
             const SizedBox(
              height: 24,
            ),
           SizedBox(height: MediaQuery.of(context).size.height*.2,child: SimilarListView(),)
          ],
        ),
      ),
    );
  }
}
