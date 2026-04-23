import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/blocks/settings_state.dart';

class SettingsBlock extends Cubit<SettingsState>{
  SettingsBlock():super(SettingsState());

  void switchLanguage(){
    emit(SettingsState(language: !state.language,theme: state.theme));
  }

  void switchTheme(){
    emit(SettingsState(language: state.language,theme: !state.theme));
  }
  void themeToDark(){
    emit(SettingsState(language: state.language,theme: true));
  }
  void themeToLight(){
    emit(SettingsState(language: state.language,theme: false));
  }
}