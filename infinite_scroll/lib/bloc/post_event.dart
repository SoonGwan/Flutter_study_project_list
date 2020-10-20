import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {}

class Fetch extends PostEvent {
  @override
  String toString() => 'Fetch';
}

// PostBloc은 표시할 Post가 더 필요할 때마다 프리젠테이션 레이어에 의해 보낼 Fetch 한 이벤트에만 응답 한다. Fetch 이벤트는 PostEvent의 한 타입
// event 문자열 표시를 하기 위해서 toString을 재정의 한다. 다시, 인스턴스를 재정의 하기 위해서 Equatable을 재정의 한다.
// PostBloc 은 PostEvent를 받고 PostState로 변화 한다. PostEvents (Fetch)를 모두 정의를 했다.
