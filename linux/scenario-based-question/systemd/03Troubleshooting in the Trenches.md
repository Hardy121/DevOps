# The Scenario 
You’ve deployed the API with the settings we just discussed. However, a few minutes later, the frontend team calls you. They say the API is returning 500 Internal Server Errors.

As a DevOps Engineer, you don't have time to log in and manually run the Python script to see the errors. You need to see the "live" logs of the service as it's running in the background to catch the traceback.

Your Goal:
Use journalctl (the systemd logging tool) to find out what's going wrong without stopping the service.

# The Question
1. What is the journalctl command to see logs only for your specific service (let's call it api.service)?
2. In DevOps, we often "tail" logs (watch them in real-time as they happen). What flag do you add to your command to follow the logs live?
3. The logs are huge! How do you filter the command to show only logs from the last 10 minutes?

# The Answer
1. journalctl -u api.serivce
2. journalctl -f -u api.serivce
3. journalctl --since "10 minutes ago" -u api.serivce