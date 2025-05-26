#!/usr/bin/env python3
import os
import re
import sys

# Colors for output
RED = '\033[0;31m'
GREEN = '\033[0;32m'
YELLOW = '\033[1;33m'
BLUE = '\033[0;34m'
NC = '\033[0m'  # No Color

def get_project_name():
    """Get the project name from pubspec.yaml using regex instead of YAML library"""
    if os.path.isfile("pubspec.yaml"):
        try:
            with open("pubspec.yaml", 'r') as file:
                content = file.read()
                
            # Use regex to find the name field
            name_match = re.search(r'^name:\s*(.+)$', content, re.MULTILINE)
            if name_match:
                project_name = name_match.group(1).strip()
                # Remove quotes if present
                project_name = project_name.strip('"\'')
                return project_name
            else:
                print(f"{RED}Error: Could not find 'name' field in pubspec.yaml.{NC}")
                exit(1)
                
        except Exception as e:
            print(f"{RED}Error: Could not read pubspec.yaml - {str(e)}{NC}")
            exit(1)
    else:
        print(f"{RED}Error: pubspec.yaml not found in the current directory.{NC}")
        print(f"Please run this command from the root of a Flutter project.")
        exit(1)

def get_project_name_alternative():
    """Alternative method: Get project name from current directory or user input"""
    # Try to get from current directory name
    current_dir = os.path.basename(os.getcwd())
    
    # Check if we're in a Flutter project by looking for common Flutter files
    flutter_indicators = ["pubspec.yaml", "lib", "android", "ios"]
    if not any(os.path.exists(indicator) for indicator in flutter_indicators):
        print(f"{RED}Error: This doesn't appear to be a Flutter project directory.{NC}")
        exit(1)
    
    # If pubspec.yaml exists but we can't parse it, use directory name
    if os.path.isfile("pubspec.yaml"):
        try:
            return get_project_name()
        except:
            print(f"{YELLOW}Warning: Could not parse pubspec.yaml, using directory name '{current_dir}' as project name.{NC}")
            return current_dir
    else:
        print(f"{YELLOW}Warning: pubspec.yaml not found, using directory name '{current_dir}' as project name.{NC}")
        return current_dir

def update_presenter_setup(project_name, class_prefix, page_name):
    """Update presenter_setup.dart with the new presenter"""
    presenter_setup_path = "lib/core/di/setup/presenter_setup.dart"
    
    if not os.path.isfile(presenter_setup_path):
        print(f"{YELLOW}Warning: Could not find presenter_setup.dart at {presenter_setup_path}.{NC}")
        print(f"Presenter registration in DI container skipped.")
        return
    
    try:
        # Read the file content
        with open(presenter_setup_path, 'r') as file:
            content = file.read()
        
        # Add import statement if it doesn't exist
        import_statement = f"import 'package:{project_name}/presentation/{page_name}/presenter/{page_name}_presenter.dart';"
        if import_statement not in content:
            # Find the last import statement and add the new import after it
            import_matches = re.findall(r'import [^;]+;', content)
            if import_matches:
                last_import = import_matches[-1]
                content = content.replace(last_import, f"{last_import}\n{import_statement}")
        
        # The new registration line to add
        registration_line = f"      ..registerLazySingleton(() => loadPresenter({class_prefix}Presenter()))"
        
        # Find the setup method bounds
        setup_match = re.search(r'setup\(\)[^{]*{', content)
        if setup_match:
            setup_start = setup_match.end()
            # Find the matching closing brace
            brace_count = 1
            setup_end = setup_start
            for i in range(setup_start, len(content)):
                if content[i] == '{':
                    brace_count += 1
                elif content[i] == '}':
                    brace_count -= 1
                    if brace_count == 0:
                        setup_end = i
                        break
            
            # Find the first semicolon within the setup method
            setup_content = content[setup_start:setup_end]
            semicolon_match = re.search(r';', setup_content)
            
            if semicolon_match:
                semicolon_pos = setup_start + semicolon_match.start()
                # Insert our registration line before this semicolon
                content = content[:semicolon_pos] + f"\n{registration_line}" + content[semicolon_pos:]
                
                # Write the updated content back to the file
                with open(presenter_setup_path, 'w') as file:
                    file.write(content)
                
                print(f"{GREEN}✓ Updated presenter_setup.dart with {class_prefix}Presenter registration.{NC}")
                print(f"{BLUE}  Added: {NC}{registration_line}")
            else:
                print(f"{YELLOW}Warning: Could not find semicolon in setup method.{NC}")
                return
        else:
            print(f"{YELLOW}Warning: Could not find setup method.{NC}")
            return
            
    except Exception as e:
        print(f"{YELLOW}Warning: Could not update presenter_setup.dart - {str(e)}{NC}")
        return

def generate_page(page_name):
    """Generate Flutter page structure and files"""
    if not page_name:
        print(f"{RED}Error: Page name is required.{NC}")
        print(f"Usage: {sys.argv[0]} <page_name>")
        exit(1)
    
    # Get project name (with fallback methods)
    try:
        project_name = get_project_name()
    except:
        project_name = get_project_name_alternative()
    
    # Convert input to lowercase for folder name
    page_name = page_name.lower()
    # Convert first letter to uppercase and rest lowercase for class name
    class_prefix = page_name[0].upper() + page_name[1:].lower()
    
    print(f"{YELLOW}Creating page structure for {class_prefix}Page in {project_name} project...{NC}\n")
    
    try:
        # Create the directories
        os.makedirs(f"lib/presentation/{page_name}/presenter", exist_ok=True)
        os.makedirs(f"lib/presentation/{page_name}/ui", exist_ok=True)
        os.makedirs(f"lib/presentation/{page_name}/widgets", exist_ok=True)
        
        # Create presenter files
        presenter_content = f'''import 'dart:async';
import 'package:{project_name}/core/base/base_presenter.dart';
import 'package:{project_name}/core/utility/utility.dart';
import 'package:{project_name}/presentation/{page_name}/presenter/{page_name}_ui_state.dart';

class {class_prefix}Presenter extends BasePresenter<{class_prefix}UiState> {{
  final Obs<{class_prefix}UiState> uiState = Obs<{class_prefix}UiState>({class_prefix}UiState.empty());
  {class_prefix}UiState get currentUiState => uiState.value;

  @override
  Future<void> addUserMessage(String message) async {{
    uiState.value = currentUiState.copyWith(userMessage: message);
    showMessage(message: currentUiState.userMessage);
  }}

  @override
  Future<void> toggleLoading({{required bool loading}}) async {{
    uiState.value = currentUiState.copyWith(isLoading: loading);
  }}
}}
'''
        
        ui_state_content = f'''import 'package:{project_name}/core/base/base_ui_state.dart';

class {class_prefix}UiState extends BaseUiState {{
  const {class_prefix}UiState({{required super.isLoading, required super.userMessage}});

  factory {class_prefix}UiState.empty() {{
    return {class_prefix}UiState(isLoading: false, userMessage: '');
  }}

  @override
  List<Object?> get props => [isLoading, userMessage];

  //Add more properties to the state

  {class_prefix}UiState copyWith({{bool? isLoading, String? userMessage}}) {{
    return {class_prefix}UiState(
      isLoading: isLoading ?? this.isLoading,
      userMessage: userMessage ?? this.userMessage,
    );
  }}
}}
'''
        
        # Create the UI file
        page_content = f'''import 'package:flutter/material.dart';

class {class_prefix}Page extends StatelessWidget {{
  const {class_prefix}Page({{super.key}});

  @override
  Widget build(BuildContext context) {{
    return Scaffold(
      appBar: AppBar(title: Text('{class_prefix}')),
      body: Center(child: Text('{class_prefix}')),
    );
  }}
}}
'''
        
        # Write files
        with open(f"lib/presentation/{page_name}/presenter/{page_name}_presenter.dart", 'w') as file:
            file.write(presenter_content)
        
        with open(f"lib/presentation/{page_name}/presenter/{page_name}_ui_state.dart", 'w') as file:
            file.write(ui_state_content)
        
        with open(f"lib/presentation/{page_name}/ui/{page_name}_page.dart", 'w') as file:
            file.write(page_content)
        
        # Update the presenter_setup.dart file
        update_presenter_setup(project_name, class_prefix, page_name)
        
        # Show success message with proper indentation
        print(f"\n{GREEN}✓ Page '{class_prefix}' created successfully!{NC}")
        print(f"  {BLUE}Structure:{NC}")
        print(f"    └── {BLUE}lib/presentation/{page_name}{NC}")
        print(f"        ├── {BLUE}ui{NC}")
        print(f"        │   └── {GREEN}{page_name}_page.dart{NC}")
        print(f"        ├── {BLUE}widgets{NC}")
        print(f"        └── {BLUE}presenter{NC}")
        print(f"            ├── {GREEN}{page_name}_ui_state.dart{NC}")
        print(f"            └── {GREEN}{page_name}_presenter.dart{NC}")
            
    except Exception as e:
        print(f"{RED}Error: Could not create page files - {str(e)}{NC}")
        exit(1)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        generate_page(sys.argv[1])
    else:
        print(f"{RED}Error: Page name is required.{NC}")
        print(f"Usage: {sys.argv[0]} <page_name>")
        exit(1)