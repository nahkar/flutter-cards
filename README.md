
## Clean Architecture
```
lib/
 ├── core/
 │    ├── theme/
 │    ├── constants/
 │    ├── utils/
 │    ├── widgets/
 │    └── services/
 │
 ├── features/
 │    ├── auth/
 │    │    ├── data/
 │    │    ├── domain/
 │    │    └── presentation/
 │    │
 │    ├── profile/
 │    │    ├── data/
 │    │    ├── domain/
 │    │    └── presentation/
 │
 ├── app/
 │    ├── app.dart
 │    ├── router.dart
 │    └── di.dart
 │
 └── main.dart


```

## Feature Structure
```
auth/
 ├── data/
 │    ├── models/
 │    ├── repositories/
 │    └── datasources/
 │
 ├── domain/
 │    ├── entities/
 │    ├── repositories/
 │    └── usecases/
 │
 └── presentation/
      ├── pages/
      ├── widgets/
      └── bloc/
```