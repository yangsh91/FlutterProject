void main() {
  checkVersion();
  print("end");
}

// async : 비동기함수
Future checkVersion() async {
  var version = await lookUpVersion();
  print(version);
}

int lookUpVersion() {
  return 12;
}
