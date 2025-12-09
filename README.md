# mvvm_boilerplate

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Code instructions

#### Command to generate .g class & api data
`dart pub run build_runner build`

#### Command to generate local files
`flutter gen-l10n`

#### Dummy API Doc
https://dummyjson.com/docs

## Cursor AI Rules

This project uses a modular cursor rules system to maintain code consistency and architecture patterns.

### Structure

```
├── cursorrules/              # Modular rule files
│   ├── structurerules.mdc   # Project structure and file organization
│   ├── themerules.mdc       # Theme and styling rules (to be added)
│   ├── featurerules.mdc     # Feature development rules (to be added)
│   └── modelrules.mdc       # Data model rules (to be added)
├── .cursorrules             # Main rules file (references modular files)
└── README.md                # This file
```

### How It Works

1. **Main Rules File** (`.cursorrules`): Contains high-level guidelines and references to modular rule files using `mdc:` syntax.

2. **Modular Rule Files** (`cursorrules/*.mdc`): Each file focuses on a specific aspect of the codebase:
   - `structurerules.mdc`: Project structure, file organization, naming conventions
   - Additional rule files can be added for specific domains (theme, features, models, etc.)

3. **Usage**: Cursor AI automatically reads these rules when assisting with code generation and refactoring.

### Adding New Rule Files

To add a new rule file:

1. Create a new `.mdc` file in the `cursorrules/` directory
2. Name it descriptively (e.g., `themerules.mdc`, `featurerules.mdc`)
3. Add a reference in `.cursorrules` using the format:
   ```
   For [topic] rules, refer to: [mdc:cursorrules/filename.mdc]
   ```

### Current Rule Files

- **structurerules.mdc**: Complete project structure documentation, file naming conventions, directory organization, and file placement rules.

### Benefits

- **Modularity**: Each rule file focuses on a specific domain
- **Maintainability**: Easy to update specific rules without affecting others
- **Readability**: Smaller, focused files are easier to understand
- **Scalability**: Add new rule files as the project grows
