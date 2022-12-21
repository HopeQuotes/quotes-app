import 'package:common/core/widgets/quote_item_placeholder.dart';
import 'package:common/utils/array.dart';
import 'package:domain/models/ui/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/home/bloc/home_bloc.dart';
import 'package:common/core/widgets/quote_item_widget.dart';
import 'package:di/data_module_injector.dart';
import 'dashboard_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(injector())
        ..add(GetProfile())
        ..add(LoadQuotes()),
      child: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          final bloc = context.read<HomeBloc>();
          return ListView.builder(
            itemCount: (state.quotes?.length ?? 0) + 1,
            controller: bloc.quotesScrollController,
            itemBuilder: (BuildContext context, int index) {
              if (index > 0) {
                var quote = state.quotes![index - 1];
                return state.quotes.nullOrEmpty == true
                    ? Container()
                    : QuoteItem(
                        index: index,
                        author: quote.author,
                        text: quote.text,
                      );
              } else {
                return BlocProvider.value(
                  value: bloc,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DashBoard(),
                      if (state.quotes == null) const QuoteItemPlaceHolder(),
                    ],
                  ),
                );
              }
            },
          );
        },
        listener: (context, state) {
          //
        },
      ),
    );
  }
}
