{pkgs,...}: {
  channel = "stable-23.11";
  packages = [
    pkgs.nodePackages.firebase-tools
    pkgs.jdk17
    pkgs.unzip
  ];
  services.docker.enable = true;
  idx.extensions = [
 "Dart-Code.dart-code"
 "Dart-Code.flutter"
 "zhuangtongfa.material-theme"
 "LaurentTreguier.vscode-simple-icons"
 "circlecodesolution.ccs-flutter-color"
 "jeroen-meijer.pubspec-assist"
 "Nash.awesome-flutter-snippets"
 "robert-brunhage.flutter-riverpod-snippets"
 "AMiner.codegeex"];
  idx.previews = {
    enable= true;
    previews = {
      web = {
        command = [
          "flutter"
          "run"
          "--machine"
          "-d"
          "web-server"
          "--web-hostname"
          "0.0.0.0"
          "--web-port"
          "$PORT"
        ];
        manager = "flutter";
      };
      android = {
        command = [
          "flutter"
          "run"
          "--machine"
          "-d"
          "android"
          "-d"
          "emulator-5554"
        ];
        manager = "flutter";
      };
    };
  };
  idx.workspace.onCreate = {
      get_pub = "flutter pub get";
  };
}