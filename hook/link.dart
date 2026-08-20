import 'package:hooks/hooks.dart';
import 'package:native_toolchain_c/native_toolchain_c.dart';

void main(List<String> args) async {
  await link(args, (input, output) async {
    await CLinker.library(
      name: 'moodexample_ffi',
      assetName: 'features/laboratory/views/ffi/ffi_bindings.dart',
      sources: ['lib/features/laboratory/views/ffi/src/ffi.cpp'],
      linkerOptions: LinkerOptions.treeshake(
        symbolsToKeep: input.recordedUses?.calls.keys.map((e) => e.name),
      ),
    ).run(input: input, output: output);
  });
}
