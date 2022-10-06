import 'package:mobx/mobx.dart';

part 'about_page_store.g.dart';

class AboutPageStore = _AboutPageStoreBase with _$AboutPageStore;

abstract class _AboutPageStoreBase with Store {
  @observable
  Duration _audioProgress = Duration.zero;

  @observable
  Duration _audioTotal = Duration.zero;

  @computed
  Duration get audioProgress => _audioProgress;

  @computed
  Duration get audioTotal => _audioTotal;

  @action
  void setAudioProgress(Duration audioProgress) {
    _audioProgress = audioProgress;
  }

  @action
  void setAudioTotal(Duration audioTotal) {
    _audioTotal = audioTotal;
  }
}
