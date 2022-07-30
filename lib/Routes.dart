import 'package:fluro/fluro.dart';
import './shop/shop_home/shop_home_screen.dart';
import 'fix/buttom_navigations_screen.dart';
import './gallery/home_models_grid_screen.dart';
import 'more/shop_part/order/order_sending_screen.dart';
import './more/shop_part/shopping_basket/shopping_basket_screen.dart';
import './more/profile/profile_screen.dart';
import './more/profile/change_name_screen.dart';
import './more/profile/change_email_screen.dart';
import 'more/profile/address/change_address_screen.dart';
import './more/turn/turn_screen.dart';
import './more/turn/turn_details_screen.dart';
import './more/wallet/wallet_screen.dart';
import './more/saved/saved_screen.dart';
import './more/support/support_screen.dart';
import 'more/support/error_screen.dart';
import 'more/support/get_turn_screen.dart';
import 'more/support/payment_ways_screen.dart';
import 'more/support/request_turn_screen.dart';
import 'more/support/rules_screen.dart';
import 'more/support/usage_screen.dart';
import './more/aboutus/aboutus_screen.dart';
import './more/aboutus/contact_us_screen.dart';
import './more/aboutus/about_screen.dart';
import './barber/single_barber/barber_details_screen.dart';
import './barber/single_barber/select_model/home_page_gallry_screen_select.dart';
import 'barber/single_barber/select_model/home_models_grid_screen_select.dart';
import 'barber/single_barber/request_info/request_home_screen.dart';
import './fix/buttom_navigations_screen.dart';
import './gallery/more_model/more_model_screen.dart';
import './RegLog/forgot_password/forgot_password.dart';
import './RegLog/login/login.dart';
import './RegLog/register/register_screen.dart';
import './RegLog/register/register_info.dart';
import './RegLog/register/otp_code.dart';
import 'regLog/forgot_password/forget_pass_info.dart';
import './regLog/forgot_password/forget_otp_code.dart';
import './barber/single_barber/time_table.dart';
import './more/anns/ann_screen.dart';
import './barber/barbers/barbers_filter_screen.dart';
import 'shop/shop_filter/shop_filter_screen.dart';
import './shop/product_details/product_details_screen.dart';
import './shop/products/products_screen.dart';
import 'more/profile/address/addresses_screen.dart';
import './more/profile/address/add_address.dart';
import './more/shop_part/shopping_basket/select_time.dart';
import './more/shop_part/shopping_basket/payment_screen.dart';
import './shop/shop_filter/sub_filter_screen.dart';
import './more/shop_part/order/order_delivered_screen.dart';
import './more/shop_part/order/order_products_screen.dart';
import './more/shop_part/order/reject_order/reject_order.screen.dart';
import 'more/shop_part/order/cancel_order/order_canceled_screen.dart';
import './more/shop_part/order/rejected_order/order_rejected_screen.dart';
import './more/shop_part/order/rejected_order/rejected_products_screen.dart';
import './shop/product_details/more_sellers_screen.dart';
import 'more/turn/edite_service/edite_service_screen.dart';
import './more/turn/turn_payment_screen.dart';
import './more/rating/rating_screen.dart';
import './more/rating/turn_details_rating_screen.dart';
import './more/product_rating/unrated_order_screen.dart';
import './more/product_rating/product_rating_screen.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  // ignore: prefer_final_fields
  // static Handler _testHandler = Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //         TEST());

  static Handler _homePage =
      Handler(handlerFunc: ((context, parameters) => BOTTOM_NAVIGATION()));

  static Handler _filterBarber =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return BARBERS_FILTER_SCREEN();
  });
  static Handler _wallet =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return WALLET_SCREEN();
  });

  static Handler _shopHomeScreen =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return SHOP_HOME_SCREEN();
  });
  static Handler _homeModelsGridScreen =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return HOME_MODELS_GRID_SCREEN();
  });
  static Handler _orderSendingScreen =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ORDER_SENDING_SCREEN();
  });
  static Handler _shoppingBasketScreen =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return SHOPPING_BASKET_SCREEN();
  });
  static Handler _profileScreen =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return PROFILE_SCREEN();
  });
  static Handler _changeName =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return CHANGE_NAME_SCREEN();
  });
  static Handler _changeEmail =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return CHANGE_EMAIL_SCREEN();
  });
  static Handler _changeAddress =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return CHANGE_ADDRESS_SCREEN();
  });
  static Handler _turns =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return TURN_SCREEN();
  });
  static Handler _saved =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return SAVED_SCREEN();
  });
  static Handler _support =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return SUPPORT_SCREEN();
  });
  static Handler _error =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ERROR_SCREEN();
  });
  static Handler _getTurn =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return GET_TURN_SCREEN();
  });
  static Handler _paymentsWay =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return PAYMENT_WAYS_SCREEN();
  });
  static Handler _requestTurn =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return REQUEST_TURN_SCREEN();
  });
  static Handler _rules =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return RULES_SCREEN();
  });
  static Handler _usage =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return USAGE_SCREEN();
  });
  static Handler _aboutUs =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ABOUTUS_SCREEN();
  });
  static Handler _contactUs =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return CONTACT_US_SCREEN();
  });
  static Handler _about =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ABOUT_SCREEN();
  });
  static Handler _modelsCategorySelect =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return HOME_PAGE_GALLERY_SCREEN_SELECT();
  });

  static Handler _homeModelsGrid =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return HOME_MODELS_GRID_SCREEN_SELECT();
  });

  static Handler _requestHomeScreen =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return REQUEST_HOME_SCREEN();
  });

  static Handler _moreModelScreen =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return MORE_MODEL_SCREEN();
  });

  static Handler _forgetPass =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return FORGOT_PASSWORD();
  });

  static Handler _login =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return LOGIN();
  });

  static Handler _register =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return REGISTER_SCREEN();
  });

  static Handler _registerInfo =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return REGISTER_INFO();
  });

  static Handler _otpCode =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return OTP_CODE();
  });

  static Handler _forgetPassInfo =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return FORGET_PASS_INFO();
  });

  static Handler _forgetOtpCode =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return FORGET_OTP_CODE();
  });

  static Handler _timeTable =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return TIME_TABLE();
  });

  static Handler _anns =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ANN_SCREEN();
  });

  static Handler _filterShop =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return SHOP_FILTER_SCREEN();
  });

  static Handler _products =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return PRODUCTS_SCREEN();
  });

  static Handler _address =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ADDRESSES_SCREEN();
  });

  static Handler _addAddress =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ADD_ADDRESS_SCREEN();
  });

  static Handler _ =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ADD_ADDRESS_SCREEN();
  });

  static Handler _selecteTime =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return SELECT_TIME();
  });

  static Handler _shopPayment =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return PAYMENT_SCREEN();
  });

  static Handler _subFilter =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return SUB_FILTER_SCREEN();
  });

  static Handler _deliverProducts =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ORDER_DELIVERED_SCREEN();
  });

  static Handler _orderProducts =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ORDER_PRODUCTS_SCREEN();
  });

  static Handler _rejectedOrder =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return REJECT_ORDER_SCREEN();
  });

  static Handler _canceledOrder =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ORDER_CANCELED_SCREEN();
  });

  static Handler _orderRejected =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return ORDER_REJECTED_SCREEN();
  });

  static Handler _rejectedProducts =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return REJECTED_PRODUCTS_SCREEN();
  });

  static Handler _moreSellers =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return MORE_SELLERS_SCREEN();
  });

  static Handler _editeService =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return EDITE_SERVICE_SCREEN();
  });

  static Handler _turnPayment =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return TURN_PAYMENT_SCREEN();
  });

  static Handler _turnDetails =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return TURN_DETAILS_SCREEN(params['id'][0]);
  });

  static Handler _barberDetails =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return BARBER_DETAILS_SCREEN(params['id'][0]);
  });

  static Handler _productDetails =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return PRODUCT_DETAILS_SCREEN(params['productId'][0]);
  });

  static Handler _ratingScreen =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return RATING_SCREEN();
  });

  static Handler _ratingDetails =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return TURN_DETAILS_RATING_SCREEN();
  });

  static Handler _unratedOrders =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return UNRATED_ORDER_SCREEN();
  });

  static Handler _productRating =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return PRODUCT_RATING_SCREEN();
  });

  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });

  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });

  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });

  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });

  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });

  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });

  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });

  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });

  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });
  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });
  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });
  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });
  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });
  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });
  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });
  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });

  // static Handler _addAddress =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return ADD_ADDRESS_SCREEN();
  // });

  // static Handler _mainHandler = Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //         LandingPage(page: params['name'][0]));

  // this one is for one paramter passing...

  // lets create for two parameters tooo...
  // static Handler _mainHandler2 = Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //         LandingPage(
  //           page: params['name'][0],
  //           extra: params['extra'][0],
  //         ));

  // ok its all set now .....
  // now lets have a handler for passing parameter tooo....

  static void setupRouter() {
    router.define('/',
        handler: _homePage, transitionType: TransitionType.fadeIn);

    router.define(
      '/filter-barber',
      handler: _filterBarber,
      transitionType: TransitionType.fadeIn,
    );
    router.define('/wallet',
        handler: _wallet, transitionType: TransitionType.fadeIn);
    router.define('/shop-home',
        handler: _shopHomeScreen, transitionType: TransitionType.fadeIn);

    router.define('/models',
        handler: _homeModelsGridScreen, transitionType: TransitionType.fadeIn);
    router.define('/sending-orders',
        handler: _orderSendingScreen, transitionType: TransitionType.fadeIn);
    router.define('/basket',
        handler: _shoppingBasketScreen, transitionType: TransitionType.fadeIn);
    router.define('/profile',
        handler: _profileScreen, transitionType: TransitionType.fadeIn);
    router.define('/change-name',
        handler: _changeName, transitionType: TransitionType.fadeIn);
    router.define('/change-email',
        handler: _changeEmail, transitionType: TransitionType.fadeIn);
    router.define('/change-address',
        handler: _changeAddress, transitionType: TransitionType.fadeIn);
    router.define('/turn',
        handler: _turns, transitionType: TransitionType.fadeIn);
    router.define('/saved',
        handler: _saved, transitionType: TransitionType.fadeIn);
    router.define('/support',
        handler: _support, transitionType: TransitionType.fadeIn);
    router.define('/error',
        handler: _error, transitionType: TransitionType.fadeIn);
    router.define('/get_turn',
        handler: _getTurn, transitionType: TransitionType.fadeIn);
    router.define('/payment_ways',
        handler: _paymentsWay, transitionType: TransitionType.fadeIn);
    router.define('/request_turn',
        handler: _requestTurn, transitionType: TransitionType.fadeIn);
    router.define('/rules',
        handler: _rules, transitionType: TransitionType.fadeIn);
    router.define('/usage',
        handler: _usage, transitionType: TransitionType.fadeIn);
    router.define('/aboutus',
        handler: _aboutUs, transitionType: TransitionType.fadeIn);
    router.define('/contact-us',
        handler: _contactUs, transitionType: TransitionType.fadeIn);
    router.define('/about',
        handler: _about, transitionType: TransitionType.fadeIn);

    router.define('/models-category-select',
        handler: _modelsCategorySelect, transitionType: TransitionType.fadeIn);

    router.define('/models-select',
        handler: _homeModelsGrid, transitionType: TransitionType.fadeIn);

    router.define('/final-turn-request',
        handler: _requestHomeScreen, transitionType: TransitionType.fadeIn);

    router.define('/more-model-images',
        handler: _moreModelScreen, transitionType: TransitionType.fadeIn);

    router.define('/forgot-password',
        handler: _forgetPass, transitionType: TransitionType.fadeIn);

    router.define('/login',
        handler: _login, transitionType: TransitionType.fadeIn);

    router.define('/register',
        handler: _register, transitionType: TransitionType.fadeIn);

    router.define('/register-info',
        handler: _registerInfo, transitionType: TransitionType.fadeIn);

    router.define('/otp-code',
        handler: _otpCode, transitionType: TransitionType.fadeIn);

    router.define('/forget-pass-info',
        handler: _forgetPassInfo, transitionType: TransitionType.fadeIn);

    router.define('/forget-otp-code',
        handler: _forgetOtpCode, transitionType: TransitionType.fadeIn);

    router.define('/time-table',
        handler: _timeTable, transitionType: TransitionType.fadeIn);

    router.define('/anns',
        handler: _anns, transitionType: TransitionType.fadeIn);

    router.define('/filter-shop',
        handler: _filterShop, transitionType: TransitionType.fadeIn);

    router.define('/products',
        handler: _products, transitionType: TransitionType.fadeIn);

    router.define('/adresses',
        handler: _address, transitionType: TransitionType.fadeIn);

    router.define('/add-address',
        handler: _addAddress, transitionType: TransitionType.fadeIn);

    router.define('/select-time',
        handler: _selecteTime, transitionType: TransitionType.fadeIn);

    router.define('/shop-payment',
        handler: _shopPayment, transitionType: TransitionType.fadeIn);

    router.define('/sub-filter',
        handler: _subFilter, transitionType: TransitionType.fadeIn);

    router.define('/delivered-products',
        handler: _deliverProducts, transitionType: TransitionType.fadeIn);

    router.define('/order-products',
        handler: _orderProducts, transitionType: TransitionType.fadeIn);

    router.define('/reject-order',
        handler: _rejectedOrder, transitionType: TransitionType.fadeIn);

    router.define('/canceled-orders',
        handler: _canceledOrder, transitionType: TransitionType.fadeIn);

    router.define('/rejected-orders',
        handler: _orderRejected, transitionType: TransitionType.fadeIn);

    router.define('/rejected-products',
        handler: _rejectedProducts, transitionType: TransitionType.fadeIn);

    router.define('/more-sellers',
        handler: _moreSellers, transitionType: TransitionType.fadeIn);

    router.define('/edite-service',
        handler: _editeService, transitionType: TransitionType.fadeIn);

    router.define('/turn-payment',
        handler: _turnPayment, transitionType: TransitionType.fadeIn);

    router.define('/turn/:id',
        handler: _turnDetails, transitionType: TransitionType.fadeIn);

    router.define('/barber/:id',
        handler: _barberDetails, transitionType: TransitionType.fadeIn);

    router.define('/product/:productId',
        handler: _productDetails, transitionType: TransitionType.fadeIn);

    router.define('/rating',
        handler: _ratingScreen, transitionType: TransitionType.fadeIn);

    router.define('/turn-rating',
        handler: _ratingDetails, transitionType: TransitionType.fadeIn);

    router.define('/unrated-orders',
        handler: _unratedOrders, transitionType: TransitionType.fadeIn);

    router.define('/unrated-product',
        handler: _productRating, transitionType: TransitionType.fadeIn);

    // router.define('',
    //     handler: _filterBarber, transitionType: TransitionType.fadeIn);
    // router.define('',
    //     handler: _filterBarber, transitionType: TransitionType.fadeIn);
    // router.define('',
    //     handler: _filterBarber, transitionType: TransitionType.fadeIn);
    // router.define('',
    //     handler: _filterBarber, transitionType: TransitionType.fadeIn);
    // router.define('',
    //     handler: _filterBarber, transitionType: TransitionType.fadeIn);
    // router.define('',
    //     handler: _filterBarber, transitionType: TransitionType.fadeIn);

    //     handler: _filterBarber, transitionType: TransitionType.fadeIn);
  }
}
