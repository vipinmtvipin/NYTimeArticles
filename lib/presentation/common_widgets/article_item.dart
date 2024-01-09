
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ny_articles_app/core/theme/app_text_style.dart';
import 'package:ny_articles_app/core/theme/color_constant.dart';
import 'package:ny_articles_app/core/utils/common_util.dart';
import 'package:ny_articles_app/core/utils/size_utils.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';

class ArticleItemWidget extends StatelessWidget {
  final Result article;
  final VoidCallback? onTap;

  const ArticleItemWidget({
    super.key,
    required this.article,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var imageUrl = "";
    var sizer = MediaQuery.of(context).size;
    if (article.media!.isNotEmpty) {
      if (article.media![0].mediaMetadata!.isNotEmpty) {
        if (article.media![0].mediaMetadata![0].url!.isNotEmpty) {
          imageUrl = article.media![0].mediaMetadata![0].url.toString();
        }
      }
    }
    return Card(
        margin: const EdgeInsets.all(10.0),
        child: ListTile(
          onTap: onTap,
          leading: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                width: kIsWeb ? (sizer.height + sizer.width) / 40 : getSize(55),
                height: kIsWeb ? (sizer.height + sizer.width) / 40 : getSize(55),
                fit: BoxFit.cover,
                alignment: Alignment.center,
                errorBuilder:
                    (BuildContext context, Object error, StackTrace? stackTrace) {
                  return Icon(
                    Icons.error,
                    size:
                        kIsWeb ? (sizer.height + sizer.width) / 40 : getSize(55),
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator(
                      color: AppColors.green,
                      strokeWidth: 1.5,
                      backgroundColor: AppColors.lightGray,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    );
                  }
                },
              ),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(article.title.toString(),
                  style: AppTextStyle.txtBlack16,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 5),
              Text(article.byline.toString(),
                  style: AppTextStyle.txtGray15,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.date_range,
                    size: getSize(15),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    GetIt.instance
                        .get<CommonUtil>()
                        .dateFormater(article.publishedDate.toString()),
                    style: AppTextStyle.txtGray15,
                  ),
                ],
              )
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: kIsWeb ? (sizer.height + sizer.width) / 70 : getSize(20),
              color: AppColors.gray,
            ),
          ),
        ));
  }
}
