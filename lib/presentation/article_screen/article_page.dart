import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles_app/core/constants/image_constant.dart';
import 'package:ny_articles_app/core/constants/string_constants.dart';
import 'package:ny_articles_app/core/theme/app_text_style.dart';
import 'package:ny_articles_app/core/theme/color_constant.dart';
import 'package:ny_articles_app/core/theme/values/dimensions.dart';
import 'package:ny_articles_app/core/utils/responsive_ui.dart';
import 'package:ny_articles_app/core/utils/size_utils.dart';
import 'package:ny_articles_app/data/model/article_responds.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_bloc.dart';
import 'package:ny_articles_app/presentation/article_screen/bloc/article_state.dart';
import 'package:ny_articles_app/presentation/article_screen/di/di_container.dart';
import 'package:ny_articles_app/presentation/base_page.dart';
import 'package:ny_articles_app/presentation/common_widgets/article_item.dart';
import 'package:ny_articles_app/presentation/common_widgets/custome_appbar.dart';
import 'package:ny_articles_app/presentation/common_widgets/custome_drawer.dart';
import 'package:ny_articles_app/presentation/common_widgets/no_data_found.dart';

class ArticlePage extends BasePage {
  static const routeName = '/article-screen';

  const ArticlePage({super.key});

  @override
  ArticlePageState createState() => ArticlePageState();
}

class ArticlePageState extends BasePageState<ArticlePage> {
  late ArticleBloc _articleCubit;
  late double fontSize;

  @override
  void initState() {
    super.initState();
    _articleCubit = getIt<ArticleBloc>();
    _articleCubit.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    fontSize = getIt<ResponsiveSize>().calculateSize(context, 0.01);
    return SafeArea(
      top: false,
      bottom: false,
      child: Responsive(
        /// if the UI is different for web/tab we need to create separate widget
        /// now I using same one for all because UI is similar for web and mobile
        mobile: mobileView(context),
        desktop: mobileView(context),
        tablet: mobileView(context),
      ),
    );
  }

  Widget mobileView(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          AppStrings.homeToolbarTitle,
          style: TextStyle(
            fontSize: kIsWeb ? fontSize : getSize(18),
          ),
        ),
        centerTitle: kIsWeb ? true : false,
        actions: const [
          Icon(Icons.search),
          SizedBox(
            width: Dimensions.appWidgetGap10,
          ),
          Icon(
            Icons.more_vert,
          ),
          SizedBox(
            width: Dimensions.appWidgetGap10,
          ),
        ],
      ),
      drawer: kIsWeb ? null : const CustomDrawer(),
      body: BlocConsumer(
        bloc: _articleCubit,
        listener: (BuildContext context, ArticleState state) {
          if (state is ArticleLoading) {
            showLoadingDialog();
          } else if (state is ArticleNoNetwork) {
            showToast(AppStrings.noNetwork);
          } else if (state is ArticleError) {
            hideLoadingDialog();
            if (state.message != null && state.message.isNotEmpty) {
              showToast(state.message);
            } else {
              showToast(AppStrings.serverError);
            }
          }
          if (state is ArticleLoaded) {
            hideLoadingDialog();
          }
        },
        builder: (BuildContext context, ArticleState state) {
          if (state is ArticleLoaded) {
            return articleLister(state.articles);
          } else {
            return const NoDataUI(AppStrings.noDataFound);
          }
        },
      ),
    );
  }

  /// if the ui is different for web,
  /// we can add all web related UI components here
  /// or create a separate class for handling web section
  Widget webView(BuildContext context) {
    return Container();
  }

  Widget articleLister(List<Result> articles) {
    return (articles.isEmpty)
        ? const NoDataUI(AppStrings.noDataFound)
        : ListView.builder(
            shrinkWrap: false,
            itemCount: articles.length,
            itemBuilder: (BuildContext context, int index) {
              return ArticleItemWidget(
                article: articles[index],
                onTap: () => {
                  // on item click navigate to details screen
                },
              );
            },
          );
  }

  @override
  void dispose() {
    _articleCubit.close(); // Close the cubit to avoid memory leaks
    super.dispose();
  }
}
