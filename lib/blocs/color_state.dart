part of 'color_bloc.dart';

class ColorState extends Equatable {
  final Color color;

  const ColorState({required this.color});

  factory ColorState.initial() => const ColorState(color: Colors.white);


  @override
  // TODO: implement props
  List<Object?> get props => [color];

  @override
  // TODO: implement stringify
  bool? get stringify => true;

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }
}
