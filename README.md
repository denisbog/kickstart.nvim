# Neovim config

Kickstart/LazyVim-flavoured config for Windows. Plugins live in `lua/plugins/`.

## Java (jdtls)

`lua/plugins/nvim-jdtls.lua` runs the language server shipped by Mason
(`eclipse.jdt.ls` v1.63.0, snapshot `202610191322`).

**Gotcha:** since `eclipse.jdt.ls` v1.63 the Eclipse/Equinox bundles that make up
the server require **JavaSE 25** just to *boot*. This is unrelated to the JDK the
project compiles against (this machine still builds with OpenLogic JDK 21).

When that requirement is not met, the OSGi bundle resolution fails and the server
exits before it ever speaks LSP, so:

- `:LspInfo` / `:checkhealth` shows nothing useful,
- `%LOCALAPPDATA%\nvim-data\lsp.log` only contains
  `WARNING: Using incubator modules: jdk.incubator.vector`,
- running `mason\bin\jdtls.CMD` by hand prints
  `An error has occurred. See the log file <cache>\jdtls\<project>\config\<ts>.log`,
  and that Eclipse log contains
  `Unresolved requirement: Require-Capability: osgi.ee; ... (version=25)`.

### Fix

Install a JDK 25 and let only the server use it:

```powershell
winget install --id EclipseAdoptium.Temurin.25.JDK -e
```

The plugin reads `JDTLS_JAVA_HOME` (default:
`C:/Program Files/Eclipse Adoptium/jdk-25.0.5.8-hotspot`) and exports it as
`JAVA_HOME` via the LSP client's `cmd_env`, so the terminal/`java`/`mvn` stay on
the project JDK. If the directory does not exist the variable is omitted and the
first `java` on `PATH` is used (which needs to be 25+, or jdtls will not start).

After changing the JDK, delete `%LOCALAPPDATA%\nvim-data\cache\jdtls\<project>`
so the workspace gets re-indexed.

### Notes

- `jdtls` is the only viable Java LSP for Neovim; `nvim-java` is a friendlier
  wrapper but pulls the same server, and `java-language-server` is unmaintained.
- `mason-registry` currently only offers `jdtls` 1.63.0, so there is no clean
  way to pin an older, Java 21-compatible build from within Mason.
