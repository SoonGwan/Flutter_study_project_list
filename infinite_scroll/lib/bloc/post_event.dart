import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class Fetch extends PostEvent {
  @override
  String toString() => 'Fetch';
}

// 우리의 PostBloc은 표시할 Post가 더 필요할 때마다 프리젠테이션 레이어에 의해 보낼 Fetch 한 이벤트에만 응답 할 것입니다. 우리의 Fetch 이벤트는 PostEvent의 한 타입
