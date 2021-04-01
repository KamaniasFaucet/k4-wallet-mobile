import 'dart:async';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:komodo_dex/blocs/coins_bloc.dart';
import 'package:komodo_dex/blocs/dialog_bloc.dart';
import 'package:komodo_dex/blocs/main_bloc.dart';
import 'package:komodo_dex/blocs/settings_bloc.dart';
import 'package:komodo_dex/blocs/swap_bloc.dart';
import 'package:komodo_dex/localizations.dart';
import 'package:komodo_dex/model/cex_provider.dart';
import 'package:komodo_dex/model/coin.dart';
import 'package:komodo_dex/model/coin_balance.dart';
import 'package:komodo_dex/model/order_book_provider.dart';
import 'package:komodo_dex/model/order_coin.dart';
import 'package:komodo_dex/model/orderbook.dart';
import 'package:komodo_dex/screens/dex/trade/build_trade_fees.dart';
import 'package:komodo_dex/screens/dex/trade/exchange_rate.dart';
import 'package:komodo_dex/screens/dex/trade/get_fee.dart';
import 'package:komodo_dex/screens/dex/trade/receive_orders.dart';
import 'package:komodo_dex/screens/dex/trade/swap_confirmation_page.dart';
import 'package:komodo_dex/utils/decimal_text_input_formatter.dart';
import 'package:komodo_dex/utils/log.dart';
import 'package:komodo_dex/utils/text_editing_controller_workaroud.dart';
import 'package:komodo_dex/utils/utils.dart';
import 'package:komodo_dex/widgets/cex_data_marker.dart';
import 'package:komodo_dex/widgets/primary_button.dart';
import 'package:komodo_dex/widgets/secondary_button.dart';
import 'package:komodo_dex/widgets/sounds_explanation_dialog.dart';
import 'package:komodo_dex/widgets/theme_data.dart';
import 'package:provider/provider.dart';

class TradePage extends StatefulWidget {
  const TradePage({this.mContext});

  final BuildContext mContext;

  @override
  _TradePageState createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> with TickerProviderStateMixin {
  final TextEditingControllerWorkaroud _controllerAmountSell =
      TextEditingControllerWorkaroud();
  final TextEditingController _controllerAmountReceive =
      TextEditingController();
  CoinBalance sellCoinBalance;
  Coin currentCoinToBuy;
  String tmpText = '';
  Decimal tmpAmountSell = deci(0);
  final FocusNode _focusSell = FocusNode();
  final FocusNode _focusReceive = FocusNode();
  Animation<double> animationInputSell;
  AnimationController controllerAnimationInputSell;
  Animation<double> animationCoinSell;
  AnimationController controllerAnimationCoinSell;
  String amountToBuy;
  bool _noOrderFound = false;
  bool isMaxActive = false;
  Ask currentAsk;
  bool isLoadingMax = false;
  bool showDetailedFees = false;
  CexProvider cexProvider;
  OrderBookProvider orderBookProvider;

  @override
  void initState() {
    super.initState();

    swapBloc.outFocusTextField.listen((bool onData) {
      if (widget.mContext != null) {
        try {
          FocusScope.of(widget.mContext).requestFocus(_focusSell);
        } catch (e) {
          Log.println('trade_page:72', 'deactivated widget: ' + e.toString());
        }
      }
    });
    _noOrderFound = false;
    initListenerAmountReceive();
    swapBloc.enabledReceiveField = false;

    swapBloc.updateSellCoin(null);
    swapBloc.updateBuyCoin(null);
    swapBloc.updateReceiveCoin(null);
    swapBloc.setEnabledSellField(false);
    swapBloc.setCurrentAmountBuy(null);
    swapBloc.setCurrentAmountSell(null);

    _controllerAmountReceive.clear();
    _controllerAmountSell.addListener(onChangeSell);
    _controllerAmountReceive.addListener(onChangeReceive);

    _initAnimationCoin();
    _initAnimationSell();
  }

  void _initAnimationCoin() {
    controllerAnimationCoinSell = AnimationController(
        duration: const Duration(milliseconds: 0), vsync: this);
    animationCoinSell = CurvedAnimation(
        parent: controllerAnimationCoinSell, curve: Curves.easeIn);
    controllerAnimationCoinSell.forward();
    controllerAnimationCoinSell.duration = const Duration(milliseconds: 500);
  }

  void _initAnimationSell() {
    controllerAnimationInputSell = AnimationController(
        duration: const Duration(milliseconds: 0), vsync: this);
    animationInputSell = CurvedAnimation(
        parent: controllerAnimationInputSell, curve: Curves.easeIn);
    controllerAnimationInputSell.forward();
    controllerAnimationInputSell.duration = const Duration(milliseconds: 500);
  }

  @override
  void dispose() {
    _controllerAmountSell.dispose();
    controllerAnimationInputSell.dispose();
    controllerAnimationCoinSell.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    cexProvider ??= Provider.of<CexProvider>(context);
    orderBookProvider ??= Provider.of<OrderBookProvider>(context);

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: <Widget>[
        _buildExchange(),
        const SizedBox(
          height: 8,
        ),
        _buildButton(),
        StreamBuilder<Object>(
            initialData: false,
            stream: swapBloc.outIsTimeOut,
            builder: (BuildContext context, AsyncSnapshot<Object> snapshot) {
              if (snapshot.data != null && snapshot.data) {
                return ExchangeRate();
              } else {
                return Container();
              }
            }),
      ],
    );
  }

  void initListenerAmountReceive() {
    swapBloc.outAmountReceive.listen((double onData) {
      if (!mounted) {
        return;
      }
      setState(() {
        if (onData != 0) {
          _controllerAmountReceive.text = onData.toString();
        } else {
          _controllerAmountReceive.text = '';
        }
      });
    });
  }

  void onChangeReceive() {
    if (_amountReceive() > 0) {
      swapBloc.setCurrentAmountBuy(_amountReceive());
    } else {
      swapBloc.setCurrentAmountBuy(null);
    }
    if (_noOrderFound && _amountSell() > 0 && _amountReceive() > 0) {
      final Decimal bestPrice = deci(_amountReceive()) / deci(_amountSell());
      swapBloc.updateBuyCoin(OrderCoin(
          coinBase: swapBloc.receiveCoin,
          coinRel: swapBloc.sellCoinBalance?.coin,
          bestPrice: bestPrice,
          maxVolume: deci(_amountSell())));
    }
    setState(() {});
  }

  void onChangeSell() {
    final amountSell = deci(_amountSell());

    if (_controllerAmountSell.text.isNotEmpty) {
      swapBloc.setCurrentAmountSell(amountSell.toDouble());
    } else {
      swapBloc.setCurrentAmountSell(null);
    }
    setState(() {
      if (_noOrderFound && _amountSell() > 0 && _amountReceive() > 0) {
        final Decimal bestPrice = deci(_amountReceive()) / deci(_amountSell());
        swapBloc.updateBuyCoin(OrderCoin(
            coinBase: swapBloc.receiveCoin,
            coinRel: swapBloc.sellCoinBalance?.coin,
            bestPrice: bestPrice,
            maxVolume: deci(_amountSell())));
      }
      if (amountSell != tmpAmountSell && amountSell != deci(0)) {
        setState(() {
          if (swapBloc.receiveCoin != null && !swapBloc.enabledReceiveField) {
            swapBloc
                .setReceiveAmount(swapBloc.receiveCoin, amountSell, currentAsk)
                .then((_) {
              _checkMaxVolume();
            });
          }
          if (_amountSell() > 0 &&
              _amountReceive() > 0 &&
              swapBloc.receiveCoin != null) {
            Decimal price = amountSell / deci(_amountReceive());
            Decimal maxVolume = amountSell;

            if (currentAsk != null) {
              price = deci(currentAsk.price);
              maxVolume = currentAsk.maxvolume;
            }

            swapBloc.updateBuyCoin(OrderCoin(
                coinBase: swapBloc.receiveCoin,
                coinRel: swapBloc.sellCoinBalance?.coin,
                bestPrice: price,
                maxVolume: maxVolume));
          }
          _getSellCoinFees(false).then((Decimal sellCoinFees) async {
            Log.println('trade_page:249', 'sellCoinFees $sellCoinFees');
            if (sellCoinBalance != null &&
                amountSell + sellCoinFees > sellCoinBalance.balance.balance) {
              if (!swapBloc.isMaxActive) {
                await setMaxValue();
              }
            }
          });
        });
      }

      tmpAmountSell = amountSell;
    });
  }

  void _checkMaxVolume() {
    if (deci(_amountSell()) <=
        swapBloc.orderCoin.maxVolume * swapBloc.orderCoin.bestPrice) return;

    setState(() {
      final max = swapBloc.orderCoin.maxVolume * swapBloc.orderCoin.bestPrice;
      _controllerAmountSell.setTextAndPosition(deci2s(max));
    });
  }

  Future<Decimal> _getSellCoinFees(bool isMax) async {
    setState(() {
      isLoadingMax = true;
    });

    final CoinAmt fee = await GetFee.totalSell(
      sellCoin: sellCoinBalance.coin.abbr,
      buyCoin: swapBloc.receiveCoin?.abbr,
      sellAmt:
          isMax ? sellCoinBalance.balance.balance.toDouble() : _amountSell(),
    );

    setState(() {
      isLoadingMax = false;
    });

    return deci(fee.amount);
  }

  Widget buildCexPrice(double price, [double size = 12]) {
    if (price == null || price == 0) return Container();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        CexMarker(
          context,
          size: Size.fromHeight(size),
        ),
        const SizedBox(width: 2),
        Text(
          cexProvider.convert(price),
          style: TextStyle(fontSize: size, color: cexColor),
        ),
      ],
    );
  }

  Future<void> setMaxValue() async {
    try {
      setState(() async {
        final Decimal sellCoinFee = await _getSellCoinFees(true);
        final Decimal maxValue = sellCoinBalance.balance.balance - sellCoinFee;
        Log.println('trade_page:380', 'setting max: $maxValue');

        if (maxValue < deci(0)) {
          setState(() {
            isLoadingMax = false;
          });
          _controllerAmountSell.text = '';
          Scaffold.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).errorColor,
            content: sellCoinFee <
                    deci(swapBloc.minVolumeDefault(sellCoinBalance.coin.abbr))
                ? Text(AppLocalizations.of(context).minValueSell(
                    sellCoinBalance.coin.abbr,
                    '${swapBloc.minVolumeDefault(sellCoinBalance.coin.abbr)}'))
                : Text(AppLocalizations.of(context).minValueSell(
                    sellCoinBalance.coin.abbr, sellCoinFee.toStringAsFixed(8))),
          ));
          _focusSell.unfocus();
        } else {
          Log.println('trade_page:398', '-----------_controllerAmountSell');
          _controllerAmountSell.setTextAndPosition(deci2s(maxValue));
        }
      });
    } catch (e) {
      Log.println('trade_page:403', e);
    }
  }

  Widget _buildExchange() {
    return Column(
      children: <Widget>[
        _buildCard(Market.SELL),
        _buildCard(Market.RECEIVE),
      ],
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: StreamBuilder<CoinBalance>(
          initialData: swapBloc.sellCoinBalance,
          stream: swapBloc.outSellCoin,
          builder: (BuildContext context, AsyncSnapshot<CoinBalance> sellCoin) {
            return StreamBuilder<Coin>(
                initialData: swapBloc.receiveCoin,
                stream: swapBloc.outReceiveCoin,
                builder:
                    (BuildContext context, AsyncSnapshot<Coin> receiveCoin) {
                  return PrimaryButton(
                    key: const Key('trade-button'),
                    onPressed: _amountSell() > 0 &&
                            _amountReceive() > 0 &&
                            sellCoin.data != null &&
                            receiveCoin.data != null
                        ? () => _confirmSwap(context)
                        : null,
                    text: AppLocalizations.of(context).trade,
                  );
                });
          }),
    );
  }

  void _animCoin(Market market) {
    if (!swapBloc.enabledSellField && market == Market.SELL) {
      controllerAnimationCoinSell.reset();
      controllerAnimationCoinSell.forward();
    }
  }

  Widget _buildCard(Market market) {
    double paddingRight = 24;

    return StreamBuilder<bool>(
        initialData: swapBloc.enabledSellField,
        stream: swapBloc.outEnabledSellField,
        builder:
            (BuildContext context, AsyncSnapshot<bool> enabledSellFieldStream) {
          if (market == Market.SELL && enabledSellFieldStream.data) {
            paddingRight = 4;
          } else {
            paddingRight = 24;
          }

          Widget _buildCEXamount(double amount, Coin coin) {
            if (amount == null || coin == null || amount == 0)
              return Container();

            final double price = cexProvider.getUsdPrice(coin.abbr);
            if (price == null || price == 0) return Container();

            final double usd = amount * price;

            return buildCexPrice(usd);
          }

          return Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 8,
                  margin: const EdgeInsets.all(8),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 24, right: paddingRight, top: 32, bottom: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      AppLocalizations.of(context).selectCoin,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Container(
                                      width: 130,
                                      child: _buildCoinSelect(market),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        market == Market.SELL
                                            ? AppLocalizations.of(context).sell
                                            : AppLocalizations.of(context)
                                                .receiveLower,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      FadeTransition(
                                        opacity: animationInputSell,
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () => _animCoin(market),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    TextFormField(
                                                        key: Key(
                                                            'input-text-${market.toString().toLowerCase()}'),
                                                        scrollPadding: const EdgeInsets.only(
                                                            left: 35),
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          DecimalTextInputFormatter(
                                                              decimalRange: 8),
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '^\$|^(0|([1-9][0-9]{0,6}))([.,]{1}[0-9]{0,8})?\$'))
                                                        ],
                                                        focusNode: market == Market.SELL
                                                            ? _focusSell
                                                            : _focusReceive,
                                                        controller: market == Market.SELL
                                                            ? _controllerAmountSell
                                                            : _controllerAmountReceive,
                                                        onChanged: market ==
                                                                Market.SELL
                                                            ? (_) {
                                                                swapBloc
                                                                    .setIsMaxActive(
                                                                        false);
                                                              }
                                                            : null,
                                                        enabled: market == Market.RECEIVE
                                                            ? swapBloc
                                                                .enabledReceiveField
                                                            : swapBloc
                                                                .enabledSellField,
                                                        keyboardType:
                                                            const TextInputType.numberWithOptions(
                                                                decimal: true),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .subtitle2,
                                                        textInputAction: TextInputAction
                                                            .done,
                                                        decoration: InputDecoration(
                                                            hintStyle: Theme.of(context)
                                                                .textTheme
                                                                .bodyText1
                                                                .copyWith(
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.w400),
                                                            hintText: market == Market.SELL ? AppLocalizations.of(context).amountToSell : '')),
                                                    const SizedBox(height: 2),
                                                    _buildCEXamount(
                                                        market == Market.SELL
                                                            ? swapBloc
                                                                .currentAmountSell
                                                            : swapBloc
                                                                .currentAmountBuy,
                                                        market == Market.SELL
                                                            ? swapBloc
                                                                .sellCoinBalance
                                                                ?.coin
                                                            : swapBloc
                                                                .buyCoinBalance
                                                                ?.coin)
                                                  ],
                                                ),
                                              ),
                                              market == Market.SELL &&
                                                      enabledSellFieldStream
                                                          .data
                                                  ? Container(
                                                      child: FlatButton(
                                                        onPressed: () async {
                                                          swapBloc
                                                              .setIsMaxActive(
                                                                  true);
                                                          setState(() {
                                                            isLoadingMax = true;
                                                          });
                                                          await setMaxValue();
                                                        },
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .max,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyText2
                                                              .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .accentColor),
                                                        ),
                                                      ),
                                                    )
                                                  : Container()
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            market == Market.SELL && _amountSell() > 0
                                ? Container(
                                    padding: EdgeInsets.only(top: 12),
                                    child: BuildTradeFees(
                                      baseCoin: sellCoinBalance.coin.abbr,
                                      baseAmount: _amountSell(),
                                      includeGasFee: true,
                                      relCoin: swapBloc.receiveCoin?.abbr,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                      _noOrderFound && market == Market.RECEIVE
                          ? Positioned(
                              bottom: 10,
                              left: 22,
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: swapBloc.receiveCoin != null
                                      ? Text(
                                          AppLocalizations.of(context).noOrder(
                                              swapBloc.receiveCoin.abbr),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        )
                                      : const Text('')))
                          : Container()
                    ],
                  ),
                ),
              ),
              if (market == Market.RECEIVE)
                Positioned(
                  top: -25,
                  left: MediaQuery.of(context).size.width / 2 - 60,
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32)),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/svg/icon_swap.svg',
                        height: 40,
                      )),
                )
            ],
          );
        });
  }

  Widget _buildCoinSelect(Market market) {
    Log.println(
        'trade_page:719', 'coin-select-${market.toString().toLowerCase()}');
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: InkWell(
        key: Key('coin-select-${market.toString().toLowerCase()}'),
        borderRadius: BorderRadius.circular(4),
        onTap: () async {
          _replaceAllCommas();
          if (_controllerAmountSell.text.isEmpty && market == Market.RECEIVE) {
            setState(() {
              if (swapBloc.enabledSellField) {
                FocusScope.of(context).requestFocus(_focusSell);
                controllerAnimationInputSell.reset();
                controllerAnimationInputSell.forward();
              } else {
                controllerAnimationCoinSell.reset();
                controllerAnimationCoinSell.forward();
              }
            });
          } else {
            _openDialogCoinWithBalance(market);
          }
        },
        child: market == Market.RECEIVE
            ? Container(
                child: StreamBuilder<Coin>(
                  initialData: swapBloc.receiveCoin,
                  stream: swapBloc.outReceiveCoin,
                  builder:
                      (BuildContext context, AsyncSnapshot<Coin> snapshot) {
                    return _buildSelectorCoin(snapshot.data);
                  },
                ),
              )
            : FadeTransition(
                opacity: animationCoinSell,
                child: StreamBuilder<dynamic>(
                    initialData: swapBloc.sellCoinBalance,
                    stream: swapBloc.outSellCoin,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.data != null &&
                          snapshot.data is CoinBalance) {
                        final CoinBalance coinBalance = snapshot.data;
                        sellCoinBalance = coinBalance;
                        return _buildSelectorCoin(coinBalance.coin);
                      } else if (snapshot.data != null &&
                          snapshot.data is OrderCoin) {
                        final OrderCoin orderCoin = snapshot.data;
                        return _buildSelectorCoin(orderCoin.coinBase);
                      } else {
                        return _buildSelectorCoin(null);
                      }
                    }),
              ),
      ),
    );
  }

  Widget _buildSelectorCoin(Coin coin) {
    return Opacity(
      opacity: coin == null ? 0.2 : 1,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              coin != null
                  ? Image.asset(
                      'assets/${coin.abbr.toLowerCase()}.png',
                      height: 25,
                    )
                  : CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      radius: 12,
                    ),
              Expanded(
                child: Center(
                  child: coin != null
                      ? CoinScrollText(
                          abbr: coin.abbr,
                          style: Theme.of(context).textTheme.subtitle2,
                          maxLines: 1,
                        )
                      : Text(
                          '-',
                          style: Theme.of(context).textTheme.subtitle2,
                          maxLines: 1,
                        ),
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey,
            height: 1,
            width: double.infinity,
          )
        ],
      ),
    );
  }

  void pushNewScreenChoiseOrder() {
    _replaceAllCommas();
    dialogBloc.dialog = showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return ReceiveOrders(
              sellAmount: _amountSell(),
              onCreateNoOrder: (String coin) => _noOrders(coin),
              onCreateOrder: (Ask ask) => _createOrder(ask));
        }).then((_) {
      dialogBloc.dialog = null;
    });
  }

  void _replaceAllCommas() {
    _controllerAmountSell.text =
        _controllerAmountSell.text.replaceAll(',', '.');
    _controllerAmountReceive.text =
        _controllerAmountReceive.text.replaceAll(',', '.');
  }

  Future<void> _openDialogCoinWithBalance(Market market) async {
    if (market == Market.RECEIVE) {
      if (!isLoadingMax && _amountSell() > 0) {
        Log.println('trade_page:850', isLoadingMax);
        dialogBloc.dialog = showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return DialogLooking(
                onDone: () {
                  try {
                    Navigator.of(context).pop();
                    pushNewScreenChoiseOrder();
                  } catch (e) {
                    Log('trade_page:754', '_openDialogCoinWithBalance] $e');
                  }
                },
              );
            }).then((dynamic _) => dialogBloc.dialog = null);
      }
    } else {
      final List<SimpleDialogOption> listDialogCoins =
          _createListDialog(context, market, null);

      dialogBloc.dialog = showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return listDialogCoins.isNotEmpty
                ? SimpleDialog(
                    title: Text(AppLocalizations.of(context).sell),
                    children: listDialogCoins,
                  )
                : SimpleDialog(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    title: Column(
                      children: <Widget>[
                        Icon(
                          Icons.info_outline,
                          size: 48,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(AppLocalizations.of(context).noFunds,
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                    children: <Widget>[
                      Text(AppLocalizations.of(context).noFundsDetected,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Theme.of(context).hintColor)),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: PrimaryButton(
                              text: AppLocalizations.of(context).goToPorfolio,
                              onPressed: () {
                                Navigator.of(context).pop();
                                mainBloc.setCurrentIndexTab(0);
                              },
                              backgroundColor: Theme.of(context).accentColor,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  );
          }).then((dynamic _) => dialogBloc.dialog = null);
    }
  }

  Future<void> _noOrders(String coin) async {
    setState(() {
      currentAsk = null;
    });
    swapBloc.updateBuyCoin(null);
    _replaceAllCommas();
    swapBloc.updateReceiveCoin(Coin(abbr: coin));
    setState(() {
      _noOrderFound = true;
      _controllerAmountReceive.text = '';
      if (swapBloc.receiveCoin != null) {
        swapBloc.enabledReceiveField = true;
        FocusScope.of(context).requestFocus(_focusReceive);
      }
    });
  }

  Future<void> _createOrder(Ask ask) async {
    setState(() {
      currentAsk = ask;
    });
    _replaceAllCommas();
    _controllerAmountReceive.clear();
    setState(() {
      swapBloc.enabledReceiveField = false;
      _noOrderFound = false;
    });
    swapBloc.updateReceiveCoin(Coin(abbr: ask.coin));
    _controllerAmountReceive.text = '';
    _controllerAmountReceive.text =
        deci2s(ask.getReceiveAmount(deci(_amountSell())));

    swapBloc.updateBuyCoin(OrderCoin(
        coinBase: swapBloc.receiveCoin,
        coinRel: swapBloc.sellCoinBalance?.coin,
        bestPrice: deci(_amountSell()) / deci(_amountReceive()),
        maxVolume: deci(_amountSell())));

    final Decimal askPrice = Decimal.parse(ask.price.toString());
    final Decimal amountSell = Decimal.parse(_controllerAmountSell.text);
    final Decimal amountReceive = Decimal.parse(_controllerAmountReceive.text);
    final Decimal maxVolume = Decimal.parse(ask.maxvolume.toString());

    if (amountReceive < (amountSell / askPrice) &&
        amountSell > maxVolume * askPrice) {
      _controllerAmountSell.text = (maxVolume * askPrice).toStringAsFixed(8);
    }
  }

  List<SimpleDialogOption> _createListDialog(
      BuildContext context, Market market, List<OrderCoin> orderbooks) {
    final List<SimpleDialogOption> listDialog = <SimpleDialogOption>[];
    _replaceAllCommas();

    if (orderbooks != null && market == Market.RECEIVE) {
      for (OrderCoin orderbook in orderbooks) {
        SimpleDialogOption dialogItem;
        if (orderbook.coinBase.abbr != swapBloc.sellCoinBalance.coin.abbr) {
          final bool isOrderAvailable =
              orderbook.coinBase.abbr != swapBloc.sellCoinBalance.coin.abbr &&
                  orderbook.getBuyAmount(deci(_amountSell())) > deci(0);
          Log.println(
              'trade_page:992',
              '----getBuyAmount----' +
                  deci2s(orderbook.getBuyAmount(deci(_amountSell()))));
          Log.println('trade_page:997',
              'item-dialog-${orderbook.coinBase.abbr.toLowerCase()}-${market.toString().toLowerCase()}');
          dialogItem = SimpleDialogOption(
            key: Key(
                'item-dialog-${orderbook.coinBase.abbr}-${market.toString().toLowerCase()}'),
            onPressed: () async {
              _controllerAmountReceive.clear();
              setState(() {
                swapBloc.enabledReceiveField = false;
                _noOrderFound = false;
              });
              swapBloc.updateReceiveCoin(orderbook.coinBase);
              _controllerAmountReceive.text = '';

              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/${orderbook.coinBase.abbr.toLowerCase()}.png',
                    )),
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                        child: isOrderAvailable
                            ? Text(deci2s(
                                orderbook.getBuyAmount(deci(_amountSell()))))
                            : Text(
                                AppLocalizations.of(context).noOrderAvailable,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                        color: Theme.of(context).cursorColor),
                              ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      isOrderAvailable
                          ? Text(
                              orderbook.coinBase.abbr,
                              style: Theme.of(context).textTheme.caption,
                            )
                          : Container()
                    ],
                  ),
                )
              ],
            ),
          );
        }
        if (dialogItem != null) {
          listDialog.add(dialogItem);
        }
      }
    } else if (market == Market.SELL) {
      for (CoinBalance coin in coinsBloc.coinBalance) {
        if (double.parse(coin.balance.getBalance()) > 0) {
          final SimpleDialogOption dialogItem = SimpleDialogOption(
            key: Key(
                'item-dialog-${coin.coin.abbr.toLowerCase()}-${market.toString().toLowerCase()}'),
            onPressed: () {
              swapBloc.updateBuyCoin(null);
              swapBloc.updateReceiveCoin(null);
              swapBloc.setTimeout(true);
              _controllerAmountReceive.clear();
              _controllerAmountSell.clear();
              setState(() {
                sellCoinBalance = coin;
                swapBloc.setEnabledSellField(true);
              });
              swapBloc.updateSellCoin(coin);
              orderBookProvider.activePair = CoinsPair(
                sell: coin.coin,
                buy: orderBookProvider.activePair?.buy != coin.coin
                    ? orderBookProvider.activePair?.buy
                    : null,
              );
              swapBloc.updateBuyCoin(null);

              Navigator.pop(context);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'assets/${coin.coin.abbr.toLowerCase()}.png',
                    )),
                Expanded(
                  child: Container(),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    StreamBuilder<bool>(
                        initialData: settingsBloc.showBalance,
                        stream: settingsBloc.outShowBalance,
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> snapshot) {
                          String amount = coin.balance.getBalance();
                          if (snapshot.hasData && snapshot.data == false) {
                            amount = '**.**';
                          }
                          return Text(amount);
                        }),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      coin.coin.abbr,
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                )
              ],
            ),
          );
          listDialog.add(dialogItem);
        }
      }
    }

    return listDialog;
  }

  bool _checkValueMin() {
    _replaceAllCommas();

    final double minVolumeSell =
        swapBloc.minVolumeDefault(sellCoinBalance.coin.abbr);
    final double minVolumeReceive =
        swapBloc.minVolumeDefault(swapBloc.receiveCoin.abbr);

    if (_amountSell() > 0 && _amountSell() < minVolumeSell) {
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(AppLocalizations.of(context)
            .minValue(swapBloc.sellCoinBalance.coin.abbr, '$minVolumeSell')),
      ));
      return false;
    } else if (_amountReceive() > 0 && _amountReceive() < minVolumeReceive) {
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(AppLocalizations.of(context)
            .minValueBuy(swapBloc.receiveCoin.abbr, '$minVolumeReceive')),
      ));
      return false;
    } else if (currentAsk != null && currentAsk.minVolume != null) {
      if (_controllerAmountReceive.text != null &&
          _controllerAmountReceive.text.isNotEmpty &&
          double.parse(_controllerAmountReceive.text) < currentAsk.minVolume) {
        Scaffold.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 2),
          content: Text(AppLocalizations.of(context).minValueBuy(
              swapBloc.receiveCoin.abbr,
              cutTrailingZeros(formatPrice(currentAsk.minVolume)))),
        ));
        return false;
      }
      return true;
    } else {
      return true;
    }
  }

  Future<bool> _checkEnoughGas(BuildContext mContext) async {
    if (!(await _checkGasFor(swapBloc.receiveCoin.abbr, mContext)))
      return false;

    return await _checkGasFor(sellCoinBalance.coin.abbr, mContext);
  }

  Future<bool> _checkGasFor(String coin, BuildContext mContext) async {
    final CoinAmt gasFee = await GetFee.gas(coin);
    if (gasFee == null) return true;

    CoinBalance gasBalance;
    try {
      gasBalance = coinsBloc.coinBalance
          .singleWhere((CoinBalance coin) => coin.coin.abbr == gasFee.coin);
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(
          'Please activate ${gasFee.coin} and top-up balance first',
          style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 12),
        ),
      ));
      return false;
    }

    double requiredGasAmt = gasFee.amount;
    if (gasFee.coin == swapBloc.sellCoinBalance.coin.abbr) {
      requiredGasAmt += GetFee.trading(_amountSell()).amount;
    }

    if (gasBalance.balance.balance < deci(requiredGasAmt)) {
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Theme.of(context).primaryColor,
        content: Text(
          AppLocalizations.of(context).swapGasAmount(
              cutTrailingZeros(formatPrice(gasFee.amount)), gasFee.coin),
          style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 12),
        ),
      ));
      return false;
    }

    return true;
  }

  Future<void> _confirmSwap(BuildContext mContext) async {
    _replaceAllCommas();

    if (!(await _checkEnoughGas(context))) return;

    if (mainBloc.isNetworkOffline) {
      Scaffold.of(mContext).showSnackBar(SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Theme.of(context).errorColor,
        content: Text(AppLocalizations.of(context).noInternet),
      ));
      return;
    }

    if (!_checkValueMin()) return;

    setState(() {
      _noOrderFound = false;
    });
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => SwapConfirmation(
                orderSuccess: () {
                  dialogBloc.dialog = showDialog<dynamic>(
                          builder: (BuildContext context) {
                            return SimpleDialog(
                              title: Text(
                                  AppLocalizations.of(context).orderCreated),
                              contentPadding: const EdgeInsets.all(24),
                              children: <Widget>[
                                Text(AppLocalizations.of(context)
                                    .orderCreatedInfo),
                                const SizedBox(
                                  height: 16,
                                ),
                                PrimaryButton(
                                  text:
                                      AppLocalizations.of(context).showMyOrders,
                                  onPressed: () {
                                    swapBloc.setIndexTabDex(1);
                                    Navigator.of(context).pop();
                                    showSoundsDialog(context);
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SecondaryButton(
                                  text: AppLocalizations.of(context).close,
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    showSoundsDialog(context);
                                  },
                                )
                              ],
                            );
                          },
                          context: context)
                      .then((dynamic _) {
                    dialogBloc.dialog = null;
                  });
                },
                order: currentAsk,
                bestPrice: deci2s(swapBloc.orderCoin.bestPrice),
                coinBase: swapBloc.orderCoin?.coinBase,
                coinRel: swapBloc.orderCoin?.coinRel,
                swapStatus: swapBloc.enabledReceiveField
                    ? SwapStatus.SELL
                    : SwapStatus.BUY,
                amountToSell: '${_amountSell()}',
                amountToBuy: '${_amountReceive()}',
              )),
    ).then((dynamic _) {
      setState(() {
        currentAsk = null;
      });
      _controllerAmountReceive.clear();
      _controllerAmountSell.clear();
    });
  }

  double _amountSell() {
    return double.tryParse(_controllerAmountSell.text.replaceAll(',', '.')) ??
        0;
  }

  double _amountReceive() {
    return double.tryParse(
            _controllerAmountReceive.text.replaceAll(',', '.')) ??
        0;
  }
}

enum Market {
  SELL,
  RECEIVE,
}

class DialogLooking extends StatefulWidget {
  const DialogLooking({Key key, this.onDone}) : super(key: key);

  final Function onDone;

  @override
  _DialogLookingState createState() => _DialogLookingState();
}

class _DialogLookingState extends State<DialogLooking> {
  OrderBookProvider orderBookProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orderBookProvider = Provider.of<OrderBookProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await orderBookProvider.subscribeCoin();
      widget.onDone();
    });

    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircularProgressIndicator(),
            const SizedBox(
              width: 16,
            ),
            Text(
              AppLocalizations.of(context).loadingOrderbook,
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }
}

class CoinScrollText extends StatefulWidget {
  const CoinScrollText({Key key, this.abbr, this.style, this.maxLines})
      : super(key: key);
  final String abbr;
  final TextStyle style;
  final int maxLines;

  @override
  _CoinScrollTextState createState() => _CoinScrollTextState();
}

class _CoinScrollTextState extends State<CoinScrollText> {
  Timer _scrollTimer;
  int _scrollAbbrStart = 0;
  int _scrollAbbrEnd = 0;
  int _scrollAbbrLength = 0;
  int _spacesBefore = 0;
  int _spacesAfter = 0;
  bool _isScrollStart = true;
  bool _isScrollBefore = false;
  String text = '-';

  String coinScroll(String abbr, {int maxChar}) {
    maxChar ??= 5;
    if (abbr.length <= maxChar) return abbr;
    if (_isScrollStart) {
      _scrollAbbrStart = 0;
      _scrollAbbrEnd = maxChar;
      _scrollAbbrLength = abbr.length;
      _spacesBefore = 0;
      _spacesAfter = 0;
      _isScrollStart = false;
    } else if (_isScrollBefore) {
      _scrollAbbrStart = 0;
      _scrollAbbrEnd = 1;
      _scrollAbbrLength = abbr.length;
      _spacesBefore = maxChar - 1;
      _spacesAfter = 0;
      _isScrollBefore = false;
    } else {
      if (_spacesBefore > 0) {
        _spacesBefore -= 1;
      }
      if (_scrollAbbrEnd < _scrollAbbrLength) {
        _scrollAbbrEnd += 1;
      }
      if (_scrollAbbrEnd > maxChar) {
        _scrollAbbrStart += 1;
      }
      if ((_scrollAbbrEnd - _scrollAbbrStart + _spacesAfter + _spacesBefore) <
          maxChar) {
        _spacesAfter += 1;
      }
      if (_spacesAfter >= maxChar - 1) {
        _isScrollBefore = true;
      }
    }

    const spaceCharacter = ' ';
    final r = (spaceCharacter * _spacesBefore) +
        abbr.substring(_scrollAbbrStart, _scrollAbbrEnd) +
        (spaceCharacter * _spacesAfter);
    return r;
  }

  @override
  Widget build(BuildContext context) {
    _scrollTimer ??= Timer.periodic(Duration(milliseconds: 300), (t) {
      if (mounted) {
        final r = coinScroll(widget.abbr);
        setState(() {
          text = r;
        });
      } else {
        t.cancel();
      }
    });

    return Text(
      text,
      style: widget.style,
      maxLines: widget.maxLines,
    );
  }

  @override
  void dispose() {
    _scrollTimer.cancel();
    super.dispose();
  }
}
