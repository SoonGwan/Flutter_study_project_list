import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll/bloc/post/post_state.dart';
import 'package:infinite_scroll/model/post_model.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:async';
import 'dart:convert';

import 'bloc/post/post_event.dart';
import 'bloc/post_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final PostBloc _postBloc = PostBloc(httpClient: http.Client());

  _HomePageState() {
    _scrollController.addListener(_onScroll);
    _postBloc.dispatch(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _postBloc, builder: (BuildContext context, PostState state) {
          if(state is PostUninitialized) {
            return Center (
              child:CircularProgressIndicator(),
            );
          }
          if(state is PostError) {
            return Center(
              child:Text('failed to fetch posts');
            );
          }
          if(state is PostLoaded) {
            if (state.posts.isEmpty) {
              return Center (
                child:Text('no posts')
              );
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
            return index >= state.posts.length 
              ? BottomLoader() 
              : PostWidget(post:state.posts[index]);
              },
              itemCount: state.hasReachedMax ? state.posts.length :state.posts.length + 1,
              controller: _scrollController,
            );
          }
        });
  }

  @override
  void dispose() {
    _postBloc.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if( maxScroll <= currentScroll) {
      _postBloc.dispatch(Fetch());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      alignment: Alignment.center,
      child:Center (
        child:SizedBox(
          width:33,
          height:33,
          child: CircularProgressIndicator(
            strokeWidth:1.5,
          )
        )
      )
    );
  }
}

class PostWidget extends StatelessWidget {
  final PostModel post;

  const PostWidget({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Text('${post.id}', style:TextStyle(fontSize:10.0),
      ),
      title:Text('${post.title}'),
      isThreeLine:true,
      subtitle:Text(post.body),
      dense:true,
    );
  }
}
