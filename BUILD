load("//:foo_rule.bzl", "foo_rule")
load("//:foo_toolchain.bzl", "foo_toolchain")

java_binary(
    name = "tool",
    srcs = [
        "Tool.java",
    ],
    main_class = "Tool",
)

toolchain_type(
    name = "toolchain_type",
)

foo_toolchain(
    name = "impl",
)

toolchain(
    name = "toolchain",
    toolchain = ":impl",
    toolchain_type = ":toolchain_type",
)

foo_rule(
    name = "a",
)
