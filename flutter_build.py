#!/usr/bin/env python3
import os
import sys
import time
import signal
import platform
import subprocess

# Colors for output
RED = '\033[0;31m'
GREEN = '\033[0;32m'
YELLOW = '\033[1;33m'
BLUE = '\033[0;34m'
NC = '\033[0m'  # No Color
MAGENTA = '\033[0;35m'  # Added for spinner
CHECKMARK = '\033[32m✓\033[0m'  # Added for success checkmark
CROSS = '\033[31m𐄂\033[0m'  # Added for failure cross

def show_loading(description, process):
    """
    Displays a loading spinner with a custom message while a process is running
    Parameters:
        description: Description message to display
        process: Process object to monitor
    """
    spinner_index = 0
    braille_spinner_list = '⡿⣟⣯⣷⣾⣽⣻⢿'
    
    print(description, end='', flush=True)
    
    # Continue spinning while the process is running
    while process.poll() is None:
        print(f"\b{MAGENTA}{braille_spinner_list[spinner_index]}{NC}", end='', flush=True)
        spinner_index = (spinner_index + 1) % len(braille_spinner_list)
        time.sleep(0.025)
    
    # Display success or failure icon based on the process exit status
    if process.returncode == 0:
        print(f"\b{CHECKMARK} ", flush=True)
        return True
    else:
        print(f"\b{CROSS} ", flush=True)
        return False

def display_apk_size():
    """Function to display APK size"""
    apk_path = "build/app/outputs/flutter-apk/app-release.apk"
    
    if os.path.isfile(apk_path):
        # Get size in bytes
        size_bytes = os.path.getsize(apk_path)
        # Convert to megabytes (with 2 decimal places)
        size_mb = round(size_bytes / 1048576, 2)
        
        print(f"{BLUE}APK Size: {size_mb} MB{NC}")
    else:
        print(f"{RED}APK file not found at {apk_path}{NC}")

def open_directory(directory_path):
    """Opens a directory based on the operating system"""
    try:
        if platform.system() == "Darwin":  # macOS
            subprocess.run(["open", directory_path])
        elif platform.system() == "Linux":
            subprocess.run(["xdg-open", directory_path])
        elif platform.system() == "Windows":
            subprocess.run(["start", directory_path], shell=True)
        else:
            print(f"Cannot open directory automatically. Please check: {directory_path}")
    except Exception as e:
        print(f"Error opening directory: {e}")
        print(f"Please check: {directory_path}")

def build_apk():
    """Build APK (Full Process)"""
    print(f"{YELLOW}Building APK (Full Process)...{NC}\n")
    
    # Clean the project
    process = subprocess.Popen(
        ["flutter", "clean"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Cleaning project...                                   ", process)
    
    # Get dependencies
    process = subprocess.Popen(
        ["flutter", "pub", "get"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Getting dependencies...                              ", process)
    
    # Generate build files
    process = subprocess.Popen(
        ["dart", "run", "build_runner", "build", "--delete-conflicting-outputs"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Generating build files...                            ", process)
    
    # Build APK
    process = subprocess.Popen(
        ["flutter", "build", "apk", "--release", "--obfuscate", "--target-platform", "android-arm64", "--split-debug-info=./"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Building APK...                                      ", process)
    
    print(f"\n{GREEN}✓ APK built successfully!{NC}")
    
    # Display APK size
    display_apk_size()
    
    # Open the APK directory
    open_directory("build/app/outputs/flutter-apk/")

def build_aab():
    """Build AAB"""
    print(f"{YELLOW}Building AAB...{NC}\n")
    
    # Clean the project
    process = subprocess.Popen(
        ["flutter", "clean"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Cleaning project...                                   ", process)
    
    # Get dependencies
    process = subprocess.Popen(
        ["flutter", "pub", "get"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Getting dependencies...                              ", process)
    
    # Generate build files
    process = subprocess.Popen(
        ["dart", "run", "build_runner", "build", "--delete-conflicting-outputs"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Generating build files...                            ", process)
    
    # Build AAB
    process = subprocess.Popen(
        ["flutter", "build", "appbundle", "--release", "--obfuscate", "--split-debug-info=./"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Building AAB...                                      ", process)
    
    print(f"\n{GREEN}✓ AAB built successfully!{NC}")
    
    # Open the AAB directory
    open_directory("build/app/outputs/bundle/release/")

def generate_lang():
    """Generate localization files"""
    # Run flutter gen-l10n to generate localization files
    process = subprocess.Popen(
        ["flutter", "gen-l10n"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Generating localizations                              ", process)
    
    print(f"\n{CHECKMARK}  Localizations generated successfully.")

def run_build_runner():
    """Run build_runner to generate Dart code"""
    print(f"{YELLOW}Executing build_runner...{NC}  \n")
    
    # Run build_runner to generate Dart code
    process = subprocess.Popen(
        ["dart", "run", "build_runner", "build", "--delete-conflicting-outputs"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Running build_runner     ", process)

def full_setup():
    """Perform full project setup"""
    print(f"{YELLOW}Performing full setup...{NC}  \n")
    
    # Clean the project
    process = subprocess.Popen(
        ["flutter", "clean"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Cleaning project...                                  ", process)
    
    # Upgrade dependencies
    process = subprocess.Popen(
        ["flutter", "pub", "upgrade"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Upgrading dependencies...                            ", process)
    
    # Run build_runner
    process = subprocess.Popen(
        ["dart", "run", "build_runner", "build", "--delete-conflicting-outputs"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Running build_runner...                              ", process)
    
    # Generate localizations
    process = subprocess.Popen(
        ["flutter", "gen-l10n"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Generating localizations...                          ", process)
    
    # Refresh dependencies
    process = subprocess.Popen(
        ["flutter", "pub", "upgrade"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Refreshing dependencies...                           ", process)
    
    # Analyze code
    process = subprocess.Popen(
        ["flutter", "analyze"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Analyzing code...                                    ", process)
    
    # Format code
    process = subprocess.Popen(
        ["dart", "format", "."],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Formatting code...                                   ", process)
    
    print(f"\n {GREEN}✓  Full setup completed successfully.  {NC}")

def repair_cache():
    """Repair pub cache"""
    print(f"{YELLOW}Repairing pub cache...{NC}\n")
    
    # Repair pub cache
    process = subprocess.Popen(
        ["flutter", "pub", "cache", "repair"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Repairing pub cache...                               ", process)
    
    print(f"\n {GREEN}✓  Pub cache repaired successfully.  {NC}")

def cleanup_project():
    """Clean up project"""
    print(f"{YELLOW}Cleaning up project...{NC}\n")
    
    # Clean the project
    process = subprocess.Popen(
        ["flutter", "clean"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Cleaning project...                                   ", process)
    
    # Get dependencies
    process = subprocess.Popen(
        ["flutter", "pub", "get"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Getting dependencies...                              ", process)
    
    print(f"\n{GREEN}✓ Project cleaned successfully!{NC}")

def release_run():
    """Build & Install Release APK"""
    print(f"{YELLOW}Building & Installing Release APK...{NC}\n")
    
    # Clean the project
    process = subprocess.Popen(
        ["flutter", "clean"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Cleaning project...                                   ", process)
    
    # Get dependencies
    process = subprocess.Popen(
        ["flutter", "pub", "get"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Getting dependencies...                              ", process)
    
    # Generate localizations
    process = subprocess.Popen(
        ["flutter", "gen-l10n"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Generating localizations...                          ", process)
    
    # Generate build files
    process = subprocess.Popen(
        ["dart", "run", "build_runner", "build", "--delete-conflicting-outputs"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Generating build files...                            ", process)
    
    # Build APK
    process = subprocess.Popen(
        ["flutter", "build", "apk", "--release", "--obfuscate", "--target-platform", "android-arm64", "--split-debug-info=./"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Building APK...                                      ", process)
    
    # Display APK size after building
    display_apk_size()
    
    # Install on device
    process = subprocess.Popen(
        ["flutter", "install", "--release"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Installing on device...                              ", process)
    
    print(f"\n{GREEN}✓ APK built and installed successfully!{NC}")

def update_pods():
    """Update iOS pods"""
    print(f"{YELLOW}Updating iOS pods...{NC}\n")
    
    # Navigate to iOS directory
    current_dir = os.getcwd()
    os.chdir("ios")
    
    # Delete Podfile.lock
    try:
        os.remove("Podfile.lock")
        # Use a dummy process for the loading animation
        dummy_process = subprocess.Popen(["sleep", "0.1"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        show_loading("Removing Podfile.lock                                 ", dummy_process)
    except FileNotFoundError:
        pass
    
    # Update pod repo
    process = subprocess.Popen(
        ["pod", "repo", "update"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Updating pod repository                               ", process)
    
    # Install pods
    process = subprocess.Popen(
        ["pod", "install"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
    )
    show_loading("Installing pods                                       ", process)
    
    # Return to root directory
    os.chdir(current_dir)
    
    print(f"\n{GREEN}✓ iOS pods updated successfully!{NC}")

def create_page(page_name):
    """Create page structure"""
    print(f"{YELLOW}Creating page...{NC}\n")
    
    if not page_name:
        print(f"{RED}Error: Page name is required.{NC}")
        print(f"Usage: {sys.argv[0]} page <page_name>")
        sys.exit(1)
    
    # Run the create_page with the page name
    try:
        subprocess.run(["./create_page.py", page_name], check=True)
    except subprocess.CalledProcessError:
        print(f"{RED}Error: Failed to run page generator.{NC}")
        sys.exit(1)
    except FileNotFoundError:
        print(f"{RED}Error: create_page not found.{NC}")
        print("Make sure it exists and is executable in the current directory.")
        sys.exit(1)

def show_usage():
    """Show usage information"""
    print(f"{YELLOW}Usage: {sys.argv[0]} [command]{NC}")
    print("\nAvailable commands:")
    print("  apk          Build release APK (Full Process)")
    print("  aab          Build release AAB")
    print("  lang         Generate localization files")
    print("  db           Run build_runner")
    print("  setup        Perform full project setup")
    print("  cache-repair Repair pub cache")
    print("  cleanup      Clean project and get dependencies")
    print("  release-run  Build & install release APK on connected device")
    print("  pod          Update iOS pods")
    print("  page         Create page structure (usage: {sys.argv[0]} page <page_name>)")
    sys.exit(1)

def main():
    """Main function"""
    # Create required directories if they don't exist
    os.makedirs("build/app/outputs/flutter-apk", exist_ok=True)
    os.makedirs("build/app/outputs/bundle/release", exist_ok=True)
    
    if len(sys.argv) < 2:
        show_usage()
    
    command = sys.argv[1].lower()
    
    if command == "apk":
        build_apk()
    elif command == "aab":
        build_aab()
    elif command == "lang":
        generate_lang()
    elif command == "db":
        run_build_runner()
    elif command == "setup":
        full_setup()
    elif command == "cache-repair":
        repair_cache()
    elif command == "cleanup":
        cleanup_project()
    elif command == "release-run":
        release_run()
    elif command == "pod":
        update_pods()
    elif command == "page":
        if len(sys.argv) < 3:
            print(f"{RED}Error: Page name is required.{NC}")
            print(f"Usage: {sys.argv[0]} page <page_name>")
            sys.exit(1)
        create_page(sys.argv[2])
    else:
        show_usage()

if __name__ == "__main__":
    # Handle Ctrl+C gracefully
    def signal_handler(sig, frame):
        print("\nProcess interrupted. Exiting...")
        sys.exit(0)
    
    signal.signal(signal.SIGINT, signal_handler)
    main()
