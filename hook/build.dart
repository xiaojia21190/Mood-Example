import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> args) async {
  await build(args, (input, output) async {
    if (!input.config.buildCodeAssets) return;
    await CBuilder.library(
      name: 'moodexample_ffi',
      assetName: 'features/laboratory/views/ffi/ffi_bindings.dart',
      sources: ['lib/features/laboratory/views/ffi/src/ffi.cpp'],
      language: Language.cpp,
      std: 'c++14',
      cppLinkStdLib: input.config.code.targetOS == OS.android ? 'c++_static' : null,
    ).run(input: input, output: output);
  });
}
