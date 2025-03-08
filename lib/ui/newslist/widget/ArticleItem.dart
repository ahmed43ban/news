import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/strings_manger.dart';
import 'package:news/model/ArticlesResponse/Article.dart';
import 'package:timeago/timeago.dart' as timeago;
class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(context: context, builder: (context) => AlertDialog(
          alignment: Alignment.bottomCenter,
          backgroundColor: Theme.of(context).colorScheme.primary,
          contentPadding: REdgeInsets.all(8),
          insetPadding: REdgeInsets.all(16),
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(imageUrl:article.urlToImage??"",
                    height: 220.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error,size: 40.sp,),),
                ),
                SizedBox(height: 8,),
                Text(article.description??"",
                  style:Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500
                  ) ,maxLines: 4,overflow: TextOverflow.ellipsis,),
                SizedBox(height: 8,),
                ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      padding: REdgeInsets.all(16),
                        backgroundColor: Theme.of(context).colorScheme.secondary),
                    child: Text(StringsManger.view_all_article.tr(),style: Theme.of(context).textTheme.labelMedium))
              ],
            ),
          ),
        ),);
      },
      child: Container(
        padding: REdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Theme.of(context).colorScheme.primary),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(imageUrl: article.urlToImage??"",
              height: 220.h,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error,size: 40.sp,),),
            ),
            SizedBox(height: 10.h,),
            Text(article.title??"",
              style: Theme.of(context).textTheme.labelMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Expanded(flex: 4,
                  child: Text("By : ${article.author}",
                    style:Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Color(0xffA0A0A0),
                      fontSize: 12.sp
                    ) ,),
                ),
                Expanded(
                  flex: 2,
                    child: Text(
                      DateTime.now().difference(DateTime.parse(article.publishedAt??"")).inDays<2
                          ?timeago.format(DateTime.parse(article.publishedAt??""))
                          :article.publishedAt??"",style:Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Color(0xffA0A0A0),
                      fontSize: 12.sp
                    ),textAlign: TextAlign.end,),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
