{ pkgs, lib, ... }:
{
  plugins = {
    jdtls = {
      enable = true;
      lazyLoad.settings.ft = "java";
      settings = {
        cmd = [
          (lib.getExe pkgs.jdt-language-server)
          "--jvm-arg=-javaagent:${pkgs.lombok}/share/java/lombok.jar"
        ];

        java = {
          signatureHelp = true;
          completion = true;
        };
        initOptions.bundles = [
          "${pkgs.vscode-extensions.vscjava.vscode-java-debug}/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-*.jar"
          "${pkgs.vscode-extensions.vscjava.vscode-java-test}/share/vscode/extensions/vscjava.vscode-java-test/server/com.microsoft.java.test.plugin-*.jar"
          "${pkgs.vscode-extensions.vscjava.vscode-maven}/share/vscode/extensions/vscjava.vscode-maven/jdtls.ext/com.microsoft.java.maven.plugin/target/com.microsoft.java.maven.plugin-*.jar"
          "${pkgs.vscode-extensions.vscjava.vscode-gradle}/share/vscode/extensions/vscjava.vscode-gradle/server/com.microsoft.gradle.bs.importer-*.jar"
        ];
      };
    };
    none-ls.sources.diagnostics.checkstyle.enable = true;
  };
}
