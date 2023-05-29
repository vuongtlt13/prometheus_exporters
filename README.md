# prometheus_exporters_installer

Install exporters for prometheus

Example:
``rm -rf prometheus_exporters && git clone  https://github.com/vuongtlt13/prometheus_exporters_installer prometheus_exporters && cd prometheus_exporters && sudo ./install.sh admin 1234 && cd ..``

Explain:

1. rm -rf prometheus_exporters: This command removes the directory named prometheus_exporters and its contents recursively (-r), and does not prompt for confirmation (-f) if any files or directories exist within it. This step ensures a clean state before cloning the repository.

2. git clone https://github.com/vuongtlt13/prometheus_exporters_installer prometheus_exporters: This command uses git to clone the repository from the specified URL (https://github.com/vuongtlt13/prometheus_exporters_installer) into a new directory named prometheus_exporters. This step downloads the source code from the repository.

3. cd prometheus_exporters: This command changes the current directory to prometheus_exporters.

4. sudo ./install.sh admin 1234: This command executes the script named install.sh with elevated privileges (sudo). It passes two arguments to the script: "admin" and "1234". The specific purpose for username and password for basic auth

5. cd ..: This command changes the current directory back to the previous directory.

