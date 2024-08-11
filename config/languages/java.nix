{ pkgs, ... }: {
  plugins.nvim-jdtls = {
    enable = true;
    cmd = [
      "${pkgs.jdt-language-server}/bin/jdtls"
      "--jvm-arg=-javaagent:${pkgs.lombok}/share/java/lombok.jar"
      # "-configuration"
      # "/dev/null"
    ];

    rootDir.__raw =
      "require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})";
    settings.java = {
      signatureHelp = true;
      completion = true;
    };
    initOptions.bundles = [
      "${pkgs.vscode-extensions.vscjava.vscode-java-debug}/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-0.50.0.jar"
      "${pkgs.vscode-extensions.vscjava.vscode-java-test}/share/vscode/extensions/vscjava.vscode-java-test/server/com.microsoft.java.test.plugin-0.40.1.jar"
      "${pkgs.vscode-extensions.vscjava.vscode-maven}/share/vscode/extensions/vscjava.vscode-maven/jdtls.ext/com.microsoft.java.maven.plugin/target/com.microsoft.java.maven.plugin-0.39.0.jar"
      "${pkgs.vscode-extensions.vscjava.vscode-gradle}/share/vscode/extensions/vscjava.vscode-gradle/server/com.microsoft.gradle.bs.importer-0.2.0.jar"
    ];
  };
}
