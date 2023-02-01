This repo is a minimal repro for a Bazel bug. It shows that providing a Java binary as an executable
tool through a toolchain breaks Bazel's dependency analysis: changing the tool's source code does
not rerun actions that use the tool. By contrast, providing the same Java binary as a
FilesToRunProvider works as expected: changing the tool's source code reruns the actions that use
the tool.

## Repro steps

1. Clone the repo
2. `bazel build :a && cat bazel-bin/a.txt`. Expected output: `hello from the tool`
3. Change the message in `Tool.java` to `new message`.
4. `bazel build :a && cat bazel-bin/a.txt`. Expected output: `new message`
5. Change `foo_toolchain.bzl` to provide the tool as an executable instead of the FilesToRunProvider.
6. `bazel build :a && cat bazel-bin/a.txt`. Expected output: `new message`
7. Change the message in `Tool.java` to `Another new message`.
8. `bazel build :a && cat bazel-bin/a.txt`. Expected output: `Another new message` **Actual output**: `new message`

You can also make more drastic changes to `Tool.java` and confirm they don't touch `//:a`, for
example changing the main method to throw an exception, or even deleting the file.