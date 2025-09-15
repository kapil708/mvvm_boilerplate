# Flutter MVVM Boilerplate - Cursor Rules

This file defines the architectural patterns, coding standards, and project structure rules for Flutter MVVM projects using Bloc as the ViewModel layer.

## 🏗️ Architecture Overview

- **Pattern**: MVVM (Model-View-ViewModel)
- **State Management**: Bloc/Cubit as ViewModel
- **Dependency Injection**: GetIt
- **Navigation**: GoRouter
- **Network**: Dio + Retrofit
- **Local Storage**: SharedPreferences + SQLite
- **Localization**: Flutter Intl

## 📁 Project Structure

```
lib/
├── core/                    # Shared utilities and configurations
│   ├── assets/             # Asset path constants
│   ├── constants/          # App-wide constants
│   ├── enums/              # Application enums
│   ├── route/              # Navigation configuration
│   ├── theme/              # Theme and styling
│   └── utils/              # Utility functions and extensions
├── data/                   # Data layer
│   ├── models/             # Data models with JSON serialization
│   ├── repositories/       # Repository implementations
│   └── sources/            # Data sources (local/remote)
├── di/                     # Dependency injection
├── l10n/                   # Localization files
├── main.dart               # Application entry point
└── presentation/           # Presentation layer
    ├── app/                # App-level configuration
    ├── common/             # Reusable UI components
    └── features/           # Feature-based modules
        └── {feature}/
            ├── view/       # UI components
            └── viewmodel/  # Bloc/Cubit logic
```

## 🎯 Naming Conventions

### Files and Directories
- **Files**: `snake_case.dart`
- **Directories**: `snake_case`
- **Feature folders**: `snake_case` (e.g., `user_profile`, `product_detail`)

### Classes and Types
- **Classes**: `PascalCase` (e.g., `UserRepository`, `LoginCubit`)
- **Enums**: `PascalCase` (e.g., `AppThemeMode`, `Language`)
- **Interfaces**: `IPascalCase` (e.g., `IUserRepository`)

### Variables and Methods
- **Variables**: `camelCase` (e.g., `userName`, `isLoading`)
- **Methods**: `camelCase` (e.g., `getUserData`, `handleLogin`)
- **Constants**: `UPPER_SNAKE_CASE` (e.g., `API_BASE_URL`, `MAX_RETRY_COUNT`)

### Routes
- **Route names**: `camelCase` (e.g., `userProfile`, `productDetail`)
- **Route paths**: `kebab-case` (e.g., `/user-profile`, `/product-detail`)

## 🔧 State Management Rules

### Cubit vs Bloc Usage
- **Use Cubit** for simple state management (single responsibility)
- **Use Bloc** for complex state with multiple events
- **Always extend Equatable** for state classes
- **Use sealed classes** for state definitions (Dart 3.0+)

### State Definition Pattern
```dart
// ✅ Correct
sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

final class LoginSuccess extends LoginState {
  final User user;
  
  const LoginSuccess(this.user);
  
  @override
  List<Object> get props => [user];
}

final class LoginError extends LoginState {
  final String message;
  
  const LoginError(this.message);
  
  @override
  List<Object> get props => [message];
}
```

### Cubit Implementation Pattern
```dart
class LoginCubit extends Cubit<LoginState> {
  final APIRepository apiRepository;
  final PreferencesProvider preferencesProvider;

  LoginCubit({
    required this.apiRepository,
    required this.preferencesProvider,
  }) : super(LoginInitial());

  void login(String username, String password) async {
    try {
      emit(LoginLoading());
      
      final response = await apiRepository.login(username, password);
      
      response.fold(
        (failure) => emit(LoginError(failure.message)),
        (user) => emit(LoginSuccess(user)),
      );
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
```

## 🗄️ Data Layer Rules

### Repository Pattern
- **All repositories must extend BaseRepository**
- **Use Either<Failure, T> for return types**
- **Implement proper error handling with safeApiCall**

```dart
class UserRepository extends BaseRepository {
  final RestClient restClient;

  UserRepository({required this.restClient});

  Future<Either<RemoteFailure, User>> getUser(int id) async {
    return safeApiCall(
      apiCall: () => restClient.getUser(id),
      modelFromJson: (json) => User.fromJson(json),
    );
  }

  Future<Either<RemoteFailure, List<User>>> getUsers() async {
    return safeApiCallList<User>(
      apiCall: () => restClient.getUsers(),
      modelFromJson: (json) => User.fromJson(json),
      listKey: 'users',
    );
  }
}
```

### Model Definition Pattern
```dart
@JsonSerializable()
class User {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
```

## 🔌 Dependency Injection Rules

### GetIt Registration Patterns
```dart
Future<void> setupLocator() async {
  // Factory - for stateful objects (Cubits/Blocs)
  locator.registerFactory(() => LoginCubit(
    apiRepository: locator<APIRepository>(),
    preferencesProvider: locator<PreferencesProvider>(),
  ));

  // LazySingleton - for stateless services
  locator.registerLazySingleton(() => APIRepository(
    restClient: locator<RestClient>(),
  ));

  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
}
```

### Registration Order
1. **External dependencies** (SharedPreferences, etc.)
2. **Core services** (NetworkInfo, etc.)
3. **Data sources** (RestClient, PreferencesProvider)
4. **Repositories**
5. **ViewModels** (Cubits/Blocs)

## 🎨 UI Component Rules

### Widget Structure
- **Use StatelessWidget** when possible
- **Use StatefulWidget** only when necessary
- **Extract reusable components** to `presentation/common/`
- **Follow Material Design 3** guidelines

### Form Validation Pattern
```dart
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: _usernameController,
              labelText: "Username",
              validator: Validators.username,
            ),
            CustomTextFormField(
              controller: _passwordController,
              labelText: "Password",
              obscureText: true,
              validator: Validators.password,
            ),
            FilledButton(
              onPressed: _handleLogin,
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().login(
        _usernameController.text,
        _passwordController.text,
      );
    }
  }
}
```

## 🛣️ Navigation Rules

### Route Definition
```dart
class RouteName {
  static const splash = 'splash';
  static const login = 'login';
  static const home = 'home';
  static const userProfile = 'userProfile';
  static const productDetail = 'productDetail';
}
```

### Router Configuration
```dart
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteName.splash,
      builder: (context, state) => BlocProvider(
        create: (_) => locator.get<SplashCubit>()..init(),
        child: const SplashPage(),
      ),
    ),
    GoRoute(
      path: '/login',
      name: RouteName.login,
      builder: (context, state) => BlocProvider(
        create: (_) => locator.get<LoginCubit>(),
        child: const LoginPage(),
      ),
    ),
  ],
);
```

## 🎨 Theming Rules

### Theme Configuration
- **Use Material 3** design system
- **Define custom colors** in theme.dart
- **Use AppCss** for consistent text styles
- **Support light/dark modes**

### Text Style Usage
```dart
// ✅ Correct
Text("Title", style: AppCss.h3)
Text("Body text", style: AppCss.bodyBase)
Text("Caption", style: AppCss.caption)

// ❌ Avoid
Text("Title", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
```

## 🌐 Localization Rules

### ARB File Structure
```json
{
  "appTitle": "My App",
  "loginTitle": "Login",
  "loginButton": "Sign In",
  "@loginButton": {
    "description": "Text for the login button"
  }
}
```

### Usage in Code
```dart
Text(AppLocalizations.of(context)!.loginTitle)
```

## 🔒 Error Handling Rules

### Global Error Handling
- **Use AppErrorBoundary** to catch uncaught errors
- **Implement proper error states** in Cubits
- **Show user-friendly error messages**
- **Log technical errors** for debugging

### Error State Pattern
```dart
// In Cubit
response.fold(
  (failure) => emit(ErrorState(failure.message)),
  (data) => emit(SuccessState(data)),
);

// In UI
BlocConsumer<MyCubit, MyState>(
  listener: (context, state) {
    if (state is ErrorState) {
      showAlertDialog(context: context, body: state.message);
    }
  },
  builder: (context, state) {
    if (state is ErrorState) {
      return buildErrorWidget(context, state.message);
    }
    // ... other states
  },
)
```

## 📱 Asset Management

### Asset Organization
```
assets/
├── images/
│   ├── logo.png
│   ├── splash.png
│   └── flags/
│       ├── us.png
│       └── india.png
├── icons/
└── animations/
```

### Asset Usage
```dart
// Define in image_assets.dart
class ImageAssets {
  static const logo = 'assets/images/logo.png';
  static const splash = 'assets/images/splash.png';
}

// Use in widgets
Image.asset(ImageAssets.logo)
```

## 🧪 Testing Guidelines

### Test Structure
```
test/
├── unit/
│   ├── cubits/
│   ├── repositories/
│   └── utils/
├── widget/
└── integration/
```

### Cubit Testing Pattern
```dart
void main() {
  group('LoginCubit', () {
    late LoginCubit loginCubit;
    late MockAPIRepository mockAPIRepository;

    setUp(() {
      mockAPIRepository = MockAPIRepository();
      loginCubit = LoginCubit(
        apiRepository: mockAPIRepository,
        preferencesProvider: MockPreferencesProvider(),
      );
    });

    test('should emit LoginLoading then LoginSuccess when login succeeds', () async {
      // Arrange
      when(() => mockAPIRepository.login(any(), any()))
          .thenAnswer((_) async => Right(mockUser));

      // Act
      loginCubit.login('username', 'password');

      // Assert
      expect(loginCubit.stream, emitsInOrder([
        LoginLoading(),
        LoginSuccess(mockUser),
      ]));
    });
  });
}
```

## 📦 Package Dependencies

### Core Dependencies (Always Include)
```yaml
dependencies:
  # State Management
  bloc: ^9.0.0
  flutter_bloc: ^9.1.1
  equatable: ^2.0.7
  dartz: ^0.10.1
  
  # Dependency Injection
  get_it: ^8.0.3
  
  # Navigation
  go_router: ^16.0.0
  
  # Network
  dio: ^5.8.0+1
  retrofit: ^4.7.0
  json_annotation: ^4.9.0
  
  # Local Storage
  shared_preferences: ^2.5.3
  sqflite: ^2.3.3
  
  # Localization
  flutter_localizations:
    sdk: flutter
  intl: any
  
  # Environment
  flutter_dotenv: ^5.2.1
```

### Development Dependencies
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.6.0
  retrofit_generator: ^10.0.1
  json_serializable: ^6.10.0
```

## 🚀 Project Setup Checklist

### Initial Setup
- [ ] Copy boilerplate files
- [ ] Update `pubspec.yaml` with project name
- [ ] Set API URLs in `.env` files
- [ ] Update app constants
- [ ] Customize theme colors
- [ ] Add project-specific routes
- [ ] Register services in service locator
- [ ] Update branding in MyApp

### Development Workflow
- [ ] Run `flutter pub get`
- [ ] Run `dart run build_runner build`
- [ ] Run `flutter analyze`
- [ ] Run `flutter test`
- [ ] Test app launch and navigation

## 📋 Code Quality Rules

### Linting
- **Use flutter_lints** package
- **No warnings** in production code
- **Consistent formatting** with dart format
- **Proper imports** organization

### Documentation
- **Document public APIs** with dartdoc
- **Add inline comments** for complex logic
- **Keep README.md** updated
- **Document environment variables**

### Performance
- **Use const constructors** where possible
- **Implement proper disposal** of resources
- **Optimize widget rebuilds** with proper keys
- **Use lazy loading** for large lists

## 🔄 Migration Guidelines

### When Updating Dependencies
1. **Test thoroughly** after updates
2. **Update generated files** with build_runner
3. **Check breaking changes** in changelogs
4. **Update documentation** if needed

### When Adding New Features
1. **Follow the established patterns**
2. **Add proper error handling**
3. **Include unit tests**
4. **Update route definitions**
5. **Register dependencies** in service locator

---

## 📚 References

- [Flutter Documentation](https://docs.flutter.dev/)
- [Bloc Library](https://bloclibrary.dev/)
- [GoRouter](https://pub.dev/packages/go_router)
- [GetIt](https://pub.dev/packages/get_it)
- [Retrofit](https://pub.dev/packages/retrofit)
- [Material Design 3](https://m3.material.io/)

---

*This blueprint ensures consistency, maintainability, and scalability across all Flutter MVVM projects.*
