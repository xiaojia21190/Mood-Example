import 'dart:ffi';

typedef NativeResultCallback = Void Function(Int64, Int32);

@Native<Void Function(Pointer<NativeFunction<NativeResultCallback>>, Int32)>(
  symbol: 'RegisterCallback',
)
external void registerCallback(Pointer<NativeFunction<NativeResultCallback>> callback, int seconds);
