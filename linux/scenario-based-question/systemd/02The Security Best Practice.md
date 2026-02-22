# The Scenario
Now that your API service is running, your Security Lead notices something concerning. By default, when you created your service file, you didn't specify a user, so the API is running as root.

In DevOps, we follow the Principle of Least Privilege. If someone hacks your Python API and it's running as root, they have full control over the entire server.

Your Goal:
Modify the service file so the application runs under a specific service account named www-data and ensure the service waits for the Network to be fully up before it tries to start (to avoid "Address already in use" or "Network unreachable" errors on boot).

# The Question
Inside the [Unit] section, which directive do you use to ensure the service waits for the network to be ready?
Inside the [Service] section, which directive do you use to specify that the process should run as the www-data user?
If the API crashes, you want systemd to wait 5 seconds and then try to restart it automatically. What two directives in the [Service] section handle this?

# The Answer
1. `After=network.target`
2.`User=www-data`
3. `Restart=on-failure   RestartSec=5s`