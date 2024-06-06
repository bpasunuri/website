#!/bin/bash

# Start your application here
# For example, if your application is a web server, you might start it like this:
 exec apache2ctl -D FOREGROUND

# You may need to customize the command to start your specific application.
# If your application doesn't require any specific initialization, you can omit this part.

# Keep the container running
tail -f /dev/null

