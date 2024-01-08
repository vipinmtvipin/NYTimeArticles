
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_articles_app/core/constants/string_constants.dart';
import 'package:ny_articles_app/core/theme/color_constant.dart';
import 'package:ny_articles_app/core/utils/my_navigator.dart';
import 'package:ny_articles_app/presentation/base_page.dart';
import 'package:ny_articles_app/presentation/common_widgets/no_data_found.dart';


class ArticlePage extends BasePage {
  static const routeName = '/article-screen';


  @override
  _ArticlePageState createState() => ArticlePageState();
}

class ArticlePageState extends BasePageState<ArticlePage> {

//  CartBloc _cartBloc;

  @override
  void initState() {
    super.initState();

    /*_cartBloc = CartBloc(
        appRepository: RepositoryProvider.of<IAppRepository>(context));

      getCartview(pageCount);*/
  }

/*  void getCartview(int count) {
    Future.delayed(Duration.zero, () {
      _cartBloc.callCart(sessionValues.getStringSession(SharedPrefKeys.token), count);
    });
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        bottom: false,
        child: BlocConsumer(
          bloc:  _cartBloc,
          listener: (BuildContext context, CartState state) {
            if (state.listSuccess) {
              hideLoadingDialog();
            }
            if (state.noNetwork) {
              showToast(AppStrings.noNetwork);
            } else if (state.loading) {
              showLoadingDialog();
            } else if (state.isFailure) {
              hideLoadingDialog();
              if (state.errorMessage != null && state.errorMessage.isNotEmpty) {
                showToast(state.errorMessage);
              } else {
                showToast(AppStrings.serverError);
              }
            }
          },
          builder: (BuildContext context, CartState state) {
            return whiteBar(false);//uiView(state);
          },
        ),
      ),
    );
  }



  Widget whiteBar(bool isBottom) {
    return Container(
      margin: isBottom? const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 15):
      const EdgeInsets.only(left: 30, right: 30, bottom: 0, top: 15),
      color: AppColors.white,
      height: 0.8,
    );
  }


/*  Widget reviewLister(CartState state) {
    return (state.cartList == null || state.cartList.isEmpty)
        ? const NoDataUI("")
        : ListView.builder(
        shrinkWrap: false,
        itemCount: state.cartList.length,
        itemBuilder: (BuildContext context, int index) {
          return reviewList(state.cartList[index]);
        },
      );
  }*/


  /*Widget reviewList(CartData cartData) {
        return  Container( );
  }*/

  /// we can move this text logic to generic class for entire application use
  /// also add different constraints based on our scenarios
  Widget textBinder(String text, TextStyle styles, TextAlign pos) {
    return Text(
        text,
        style: styles,
        textAlign: pos,
    );
  }




  void goBack() {
    MyNavigator.popUp(context);
  }

}
