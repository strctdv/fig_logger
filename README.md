# fig_logger

Just a tiny wrapper we like to use internally — nothing fancy, nothing serious.  
If it saves you a coffee break of work, then hey, that’s a win. ☕😉

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  fig_logger:
    git:
      url: https://github.com/your-org/fig_logger.git
```
	 
## Usage
	 
```dart
import 'package:fig_logger/fig_logger.dart';

final log = getLogger("MyClass", prefix: "Init");

log.d("Starting something...");
```

### Or use the mixin:

```dart
class MyService with WithFigLogger {
  void run() {
    l.d("Running service...");
  }
}
```