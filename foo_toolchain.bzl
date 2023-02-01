FooToolchainInfo = provider(
    fields = ["tool"],
)

def _foo_toolchain(ctx):
    return platform_common.ToolchainInfo(
        foo = FooToolchainInfo(
            # This does the right thing: changing the tool's src and building //:a rebuilds the tool
            # and updates a.txt.
            tool = ctx.attr._tool[DefaultInfo].files_to_run,
            # This does not do the right thing. Changing the tool's src and building //:a does not
            # rebuild the tool or update a.txt.
            #            tool = ctx.executable._tool,
        ),
    )

foo_toolchain = rule(
    implementation = _foo_toolchain,
    attrs = {
        "_tool": attr.label(
            default = "//:tool",
            executable = True,
            cfg = "exec",
        ),
    },
)
