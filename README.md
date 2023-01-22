# Automate BITS WiFi

Automating the login process to BITS-STUDENT and BITS-STAFF WiFi on Linux and Windows.

-   Clone the repository to your system.
-   Enter credentials in the respective autologin file (autologin-linux for Linux and
    autologin-win.ps1 for Windows).
-   On Linux, from any terminal, navigate to the directory containing the script and run
    `sh linux-install.sh` to install and `sh linux-uninstall.sh` to uninstall.
-   On Windows,open Powershell with admin privileges (Run as Administrator). Run
    `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser`. Enter 'y' to allow.
    Then, navigate to the directory containing the script and run `.\windows-install.ps1` to install
    (enter 'r' to allow to run once) and `.\windows-uninstall.ps1` to uninstall.
