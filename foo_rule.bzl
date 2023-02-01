def _foo_rule(ctx):
    out = ctx.actions.declare_file(ctx.attr.name + ".txt")
    ctx.actions.run(
        inputs = [],
        outputs = [out],
        executable = ctx.toolchains["//:toolchain_type"].foo.tool,
        arguments = [ctx.actions.args().add(out)],
    )
    return DefaultInfo(files = depset([out]))

foo_rule = rule(
    implementation = _foo_rule,
    toolchains = [
        "//:toolchain_type",
    ],
)
