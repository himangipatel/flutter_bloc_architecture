import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/base/CommonWidget.dart';
import 'package:flutter_bloc_architecture/base/base.dart';
import 'package:flutter_bloc_architecture/model/model.dart';
import 'package:flutter_bloc_architecture/screen/github_search/search.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Center(
                child: Text('Github Search'),
              ),
            ),
            body: SafeArea(
                child: BlocBuilder<GithubSearchBloc, GithubSearchState>(
              builder: (builder, state) {
                print("GithubSearchState "+state.status.toString());
                return Stack(
                  children: [
                    Column(
                      children: [
                        _SearchBar(),
                        if(state is SearchStateSuccess)
                          _SearchResults(items:  state.items)
                        // state.items.isNotEmpty ?
                        //   _SearchResults(items:  state.items):Container()
                      ],
                    ),
                    // CommonWidget(state.status == Status.loading ? true : false)
                  ],
                );
              },
            ))));
  }
}

class _SearchBar extends StatefulWidget {
  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final textController = TextEditingController();
  late GithubSearchBloc _githubSearchBloc;

  @override
  void initState() {
    super.initState();
    _githubSearchBloc = context.read<GithubSearchBloc>();
  }

  void onSearch() {
    _githubSearchBloc.add(TextChanged(text: textController.text));
  }

  void _onClearTapped() {
    textController.text = '';
    _githubSearchBloc.add(const TextChanged(text: ''));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
        builder: (context, state) {
      return TextField(
        textInputAction: TextInputAction.search,
        controller: textController,
        autocorrect: false,
        onSubmitted: (value) {
          onSearch();
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: GestureDetector(
            onTap: _onClearTapped,
            child: state is SearchStateLoading
                ? Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgressIndicator(strokeWidth: 1),
                    ),
                  )
                : const Icon(Icons.clear),
          ),
          border: InputBorder.none,
          hintText: 'Enter a search term',
        ),
      );
    });
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({Key? key, required this.items}) : super(key: key);

  final List<SearchResultItem> items;

  @override
  Widget build(BuildContext context) {
    print(items.length);
    return Expanded(
        child: SingleChildScrollView(
      child: Column(
        children: items
            .map((e) => _SearchResultItem(
                  item: e,
                ))
            .toList(),
      ),
    ));
  }
}

class _SearchResultItem extends StatelessWidget {
  const _SearchResultItem({Key? key, required this.item}) : super(key: key);

  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(item.owner.avatarUrl),
      ),
      title: Text(item.fullName),
      onTap: () async {
        if (await canLaunch(item.htmlUrl)) {
          await launch(item.htmlUrl);
        }
      },
    );
  }
}
